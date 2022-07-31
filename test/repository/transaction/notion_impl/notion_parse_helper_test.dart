import 'package:finance_with_notion/repository/transaction/notion_impl/notion_parse_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'notion_data_example.mock.dart';

void main() {
  late NotionParseHelper notionParseHelper;

  setUp(() {
    notionParseHelper = NotionParseHelper();
  });

  group("notionDatabaseToUserTransactionList", () {
    test("Check input and output", () {
      var result =
          notionParseHelper.notionDatabaseToUserTransactionList(databaseData);

      if (result.length != userTransactionList.length) {
        throw ("The examples of Notion data are broken");
      }

      var numberOfIterations = result.length;

      for (var i = 0; i < numberOfIterations; i++) {
        expect(result[i].id, userTransactionList[i].id);
        expect(result[i].note, userTransactionList[i].note);
        expect(result[i].value, userTransactionList[i].value);
        expect(
            result[i].transactionType, userTransactionList[i].transactionType);
        expect(result[i].date, userTransactionList[i].date);
        expect(result[i].category, userTransactionList[i].category);
        expect(result[i].seconderyCategory,
            userTransactionList[i].seconderyCategory);
        expect(result[i].location, userTransactionList[i].location);
        expect(result[i].origin, userTransactionList[i].origin);
      }
    });
  });
}
