import 'package:finance_with_notion/repository/transaction/transaction_database.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:injectable/injectable.dart';

import 'notion_parser.dart';

@Singleton(as: TransactionDatabase)
class NotionDatabase implements TransactionDatabase {
  final HttpRequest _httpRequest;
  final String _notionApiUrl = "https://api.notion.com/v1";
  final String _templateDeleteUrl = "/blocks/{id}";
  final String _templateGetTransactionsUrl = "/databases/{id}/query";
  final NotionParser _notionParser;

  //TODO
  //Put in shared preferes
  static const String _databaseId = "";
  static const String _token = "";
  static const String _notionVersion = "2022-02-22";
  static const String _contentType = "application/json";

  //----------

  NotionDatabase(this._httpRequest) : _notionParser = NotionParser() {
    _httpRequest.setBaseUrl(_notionApiUrl);
    _httpRequest.setHeader({
      "Authorization": "Bearer $_token",
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

  @override
  Future<UserTransactionList> getTransactions() async {
    //TODO ver como pegar o numero da pagina
    //TODO ver se o hasMore faz o parse automatico de string para bool
    var getEndPoint = _getTransactionsUrl(_databaseId);
    var response = await _httpRequest.post(getEndPoint);
    if (response.statusCode == 200) {
      var notionDatabaseResult = response.data;
      var userTransactionList = _notionParser
          .notionDatabaseToUserTransactionList(notionDatabaseResult);
      print(userTransactionList);
      return UserTransactionList(userTransactionList, 1, false);
    }

    //TODO: Handle erro
    throw ("Error");
  }

  List<UserTransaction> _userTransactionListJsonToUserTransactionListEntity(
      List<Map<String, dynamic>> userTransactionListJson) {
    List<UserTransaction> userTransactions = [];
    for (var userTransactionJson in userTransactionListJson) {
      userTransactions.add(UserTransaction.fromJson(userTransactionJson));
    }
    return userTransactions;
  }

  ///use Create a Page with Content endpoint
  ///post in https://api.notion.com/v1/pages/
  @override
  Future<void> insertTransaction(UserTransaction userTransaction) async {
    // TODO: implement insertTransaction
  }

  void userTransactionToNotionUserTransaction(UserTransaction userTransaction) {
    //TODO
  }
}
