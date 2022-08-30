import 'package:finance_with_notion/repository/transaction/transaction_database.dart';
import 'package:finance_with_notion/shared/config/shared_prefs.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'notion_parser.dart';

@LazySingleton(as: TransactionDatabase)
class NotionDatabase implements TransactionDatabase {
  final HttpRequest _httpRequest;
  final NotionParser _notionParser;
  late final SharedPrefs _sharedPrefs;
  final String _notionApiUrl = "https://api.notion.com/v1";
  final String _templateDeleteUrl = "/blocks/{id}";
  final String _templateGetTransactionsUrl = "/databases/{id}/query";
  static const String _notionVersion = "2022-02-22";
  static const String _contentType = "application/json";
  //----------

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
        {"property": "Date", "direction": "ascending"}
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
    //TODO: Handle erro
    throw ("Error");
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
  Future<void> insertTransaction(UserTransaction userTransaction) async {
    // TODO: implement insertTransaction
  }
}
