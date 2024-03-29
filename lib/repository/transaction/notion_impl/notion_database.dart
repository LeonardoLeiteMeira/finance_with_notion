import 'package:finance_with_notion/repository/transaction/notion_impl/enum/notion_database_columns_enum.dart';
import 'package:finance_with_notion/repository/transaction/notion_impl/notionTypes/notion_database_metadata/notion_database_metadata.dart';
import 'package:finance_with_notion/repository/transaction/transaction_database.dart';
import 'package:finance_with_notion/shared/config/shared_prefs.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:finance_with_notion/shared/models/generic/failure.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'model/user_transaction_notion_extension.dart';
import 'notion_parser.dart';

@LazySingleton(as: TransactionDatabase)
class NotionDatabase implements TransactionDatabase {
  final HttpRequest _httpRequest;
  final NotionParser _notionParser;
  late final SharedPrefs _sharedPrefs;
  final String _notionApiUrl = "https://api.notion.com/v1";
  final String _templateDeleteUrl = "/blocks/{id}";
  final String _templateDatabasePropertiesUrl = "/databases/{id}";
  final String _templateGetTransactionsUrl = "/databases/{id}/query";
  static const String _notionVersion = "2022-02-22";
  static const String _contentType = "application/json";

  NotionDatabase(this._httpRequest, {SharedPrefs? sharedPrefsToUnitTest})
      : _notionParser = NotionParser() {
    _sharedPrefs = sharedPrefsToUnitTest ?? GetIt.I.get<SharedPrefs>();
    var token = _sharedPrefs.notionSecretToken;
    _httpRequest.setBaseUrl(_notionApiUrl);
    _httpRequest.setHeader({
      "Authorization": "Bearer $token",
      "Content-Type": _contentType,
      "Notion-Version": _notionVersion
    });
  }

  String _getDeleteUrl(String pageId) =>
      _templateDeleteUrl.replaceAll("{id}", pageId);

  @override
  Future<void> deleteTransaction(String id) async {
    var deleteEndPoint = _getDeleteUrl(id);
    var response = await _httpRequest.delete(deleteEndPoint);
    print(response);
  }

  String _getTransactionsUrl(String databaseId) =>
      _templateGetTransactionsUrl.replaceAll("{id}", databaseId);

  Map<String, dynamic> _getTransactionsBody(String page) {
    var getTransactionsBody = {
      "sorts": [
        {"property": "Date", "direction": "descending"}
      ],
      "page_size": 100
    };

    if (page != "") {
      getTransactionsBody.addAll({"start_cursor": page});
    }
    return getTransactionsBody;
  }

  @override
  Future<UserTransactionList> getTransactions({String page = ""}) async {
    var databaseId = _sharedPrefs.notionDatabaseId;
    var getEndPoint = _getTransactionsUrl(databaseId);
    var body = _getTransactionsBody(page);
    var response = await _httpRequest.post(getEndPoint, body: body);
    if (response.statusCode == 200) {
      return _notionResponseToUserTransactionList(response.data);
    }
    throw (NotionError(
        "${response.statusCode} - ${response.statusMessage} - ${response.data}"));
  }

  UserTransactionList _notionResponseToUserTransactionList(
      Map<String, dynamic> notionResponse) {
    bool hasMoreResults = notionResponse["has_more"];
    var page = notionResponse["next_cursor"] ?? "";

    var userTransactions =
        _notionParser.notionDatabaseToUserTransactionList(notionResponse);

    return UserTransactionList(userTransactions, page, hasMoreResults);
  }

  ///use Create a Page with Content endpoint
  ///post in https://api.notion.com/v1/pages/
  @override
  Future<bool> insertTransaction(UserTransaction userTransaction) async {
    var notionPageAsJson = _notionParser.userTransactionToNotionPage(
        UserTransactionToNotionExtension.fromUserTransaction(userTransaction),
        _sharedPrefs.notionDatabaseId);

    var fullUrl = _notionApiUrl + "/pages";

    var response = await _httpRequest.post(fullUrl, body: notionPageAsJson);

    if (response.statusCode == 200) {
      return true;
    }
    throw (NotionError(
        "${response.statusCode} - ${response.statusMessage} - ${response.data}"));
  }

  Future<NotionDatabaseMetadata> _getDatabaseProperties() async {
    var databaseId = _sharedPrefs.notionDatabaseId;
    var getDatabaseUrl =
        _templateDatabasePropertiesUrl.replaceAll("{id}", databaseId);
    var fullUrl = _notionApiUrl + getDatabaseUrl;

    var response = await _httpRequest.get(fullUrl);

    if (response.statusCode == 200) {
      return NotionDatabaseMetadata.fromJson(response.data);
    }
    throw (NotionError(
        "${response.statusCode} - ${response.statusMessage} - ${response.data}"));
  }

  Future<List<String>> _getSelectOptions(NotionDatabaseColumns column) async {
    var selectOptions = <String>[];
    var databaseMetadata = await _getDatabaseProperties();
    var selectOptionsJson = databaseMetadata
        .properties![column.nameInNotionDatabase]!
        .propertyDetails!["options"] as List;

    for (Map option in selectOptionsJson) {
      selectOptions.add(option["name"]);
    }
    return selectOptions;
  }

  @override
  Future<List<String>> getCategories() async =>
      _getSelectOptions(NotionDatabaseColumns.category);

  @override
  Future<List<String>> getTransactionsAccount() async =>
      _getSelectOptions(NotionDatabaseColumns.account);
}
