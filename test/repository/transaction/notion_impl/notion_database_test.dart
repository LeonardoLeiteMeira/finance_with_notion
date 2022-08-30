import 'package:finance_with_notion/repository/transaction/notion_impl/notion_database.dart';
import 'package:finance_with_notion/shared/config/shared_prefs.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:mockito/mockito.dart';

import 'notion_data_mock.dart';
import 'notion_database_test.mocks.dart';

@GenerateMocks([HttpRequest, SharedPrefs])
void main() {
  late NotionDatabase notionDatabase;
  late MockHttpRequest httpRequest;
  late MockSharedPrefs mockSharedPrefs;

  setUp(() {
    httpRequest = MockHttpRequest();
    mockSharedPrefs = MockSharedPrefs();
    when(mockSharedPrefs.notionDatabaseId).thenReturn("");
    when(mockSharedPrefs.notionSecretToken).thenReturn("");
    notionDatabase =
        NotionDatabase(httpRequest, sharedPrefsToUnitTest: mockSharedPrefs);
  });

  group("getTransactions", () {
    test("Success to get all", () async {
      when(httpRequest.post(any, body: anyNamed("body"))).thenAnswer(
          (_) async => ResponseMock(data: databaseData, statusCode: 200));
      var result = await notionDatabase.getTransactions();

      var entityToCheck = UserTransactionList(userTransactionList, "", false);

      expect(result.hasMore, entityToCheck.hasMore);
      expect(result.page, entityToCheck.page);
      expect(result.userTransactions.length,
          entityToCheck.userTransactions.length);
    });
    test("Success to get first page", () async {
      var resultList = databaseData["results"] as List;
      String nextPageCursor = resultList[1]["id"];

      var mockNotionResponse = {
        "results": [resultList[0]],
        "has_more": true,
        "next_cursor": nextPageCursor
      };

      when(httpRequest.post(any, body: anyNamed("body"))).thenAnswer(
          (_) async => ResponseMock(data: mockNotionResponse, statusCode: 200));
      var result = await notionDatabase.getTransactions();

      var entityToCheck = UserTransactionList(
          [userTransactionList.first], nextPageCursor, true);

      expect(result.hasMore, entityToCheck.hasMore);
      expect(result.page, entityToCheck.page);
      expect(result.userTransactions.length,
          entityToCheck.userTransactions.length);
    });
    test("Success to get next page", () async {
      var resultList = databaseData["results"] as List;
      String startPageCursor = resultList[1]["id"];
      String nextPageCursor = resultList[2]["id"];

      var mockNotionResponse = {
        "results": [resultList[1]],
        "has_more": true,
        "next_cursor": nextPageCursor
      };

      when(httpRequest.post(any, body: anyNamed("body"))).thenAnswer(
          (_) async => ResponseMock(data: mockNotionResponse, statusCode: 200));

      var result = await notionDatabase.getTransactions(page: startPageCursor);

      var entityToCheck = UserTransactionList(
          [userTransactionList.first], nextPageCursor, true);

      expect(result.hasMore, entityToCheck.hasMore);
      expect(result.page, entityToCheck.page);
      expect(result.userTransactions.length,
          entityToCheck.userTransactions.length);
    });

    // test("Unauthorized", () async {
    //   //TODO
    //   when(httpRequest.post(any))
    //       .thenThrow((_) async => throw ("Unauthorized"));
    // });
  });
}

class ResponseMock {
  int statusCode;
  dynamic data;
  ResponseMock({required this.statusCode, required this.data});
}
