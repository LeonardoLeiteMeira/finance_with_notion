import 'package:finance_with_notion/repository/transaction/notion_impl/notion_database.dart';
import 'package:finance_with_notion/shared/httpRequest/implementation/dio_impl.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:mockito/mockito.dart';

import 'notion_data_mock.dart';
import 'notion_database_test.mocks.dart';

@GenerateMocks([HttpRequest])
void main() {
  late NotionDatabase notionDatabase;
  late MockHttpRequest httpRequest;

  setUp(() {
    httpRequest = MockHttpRequest();
    notionDatabase = NotionDatabase(httpRequest);
  });

  test("Real call", () async {
    ///To run real call its necessary set databaseId and authorization
    ///in NotionDatabase constructor
    var notionRealDatabase = NotionDatabase(DioImpl());
    var a = await notionRealDatabase.getTransactions();
    print(a);
  });
  group("getTransactions", () {
    test("Success", () async {
      when(httpRequest.post(any)).thenAnswer(
          (_) async => ResponseMock(data: databaseData, statusCode: 200));
      var result = await notionDatabase.getTransactions();

      var entityToCheck = UserTransactionList(userTransactionList, 1, false);

      expect(result.hasMore, entityToCheck.hasMore);
      expect(result.page, entityToCheck.page);
      expect(result.userTransactions.length,
          entityToCheck.userTransactions.length);
    });

    test("Unauthorized", () async {
      //TODO
      when(httpRequest.post(any))
          .thenAnswer((_) async => ResponseMock(data: {}, statusCode: 401));
    });
  });
}

class ResponseMock {
  int statusCode;
  dynamic data;
  ResponseMock({required this.statusCode, required this.data});
}
