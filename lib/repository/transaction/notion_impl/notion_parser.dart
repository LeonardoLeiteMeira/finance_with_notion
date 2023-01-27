import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

import 'notionTypes/notion_date.dart';
import 'notionTypes/notion_multi_select.dart';
import 'notionTypes/notion_number.dart';
import 'notionTypes/notion_rich_text.dart';
import 'notionTypes/notion_select.dart';
import 'enum/notion_database_columns_enum.dart';

class NotionParser {
  List<UserTransaction> notionDatabaseToUserTransactionList(
      Map<String, dynamic> databaseList) {
    var results = databaseList["results"] as List<dynamic>;

    var userTransactions = <UserTransaction>[];

    for (var transactionJson in results) {
      var properties = transactionJson["properties"];
      var userTransaction =
          notionPropertiesToUserTransaction(properties, transactionJson["id"]);

      userTransactions.add(userTransaction);
    }

    return userTransactions;
  }

  UserTransaction notionPropertiesToUserTransaction(
      Map<String, dynamic> properties, String transactionId) {
    var expendType = NotionSelect.fromJson(
        properties[NotionDatabaseColumns.type.nameInNotionDatabase]);

    var value = NotionNumber.fromJson(
        properties[NotionDatabaseColumns.value.nameInNotionDatabase]);

    var category = NotionSelect.fromJson(
        properties[NotionDatabaseColumns.category.nameInNotionDatabase]);

    var secondaryCategory = NotionMultiSelect.fromJson(properties[
        NotionDatabaseColumns.secondaryCategory.nameInNotionDatabase]);

    var date = NotionDate.fromJson(
        properties[NotionDatabaseColumns.date.nameInNotionDatabase]);

    var location = NoptionRichText.fromJson(
        properties[NotionDatabaseColumns.location.nameInNotionDatabase]);

    var note = NoptionRichText.fromJson(
        properties[NotionDatabaseColumns.note.nameInNotionDatabase]);

    var origin = NotionSelect.fromJson(
        properties[NotionDatabaseColumns.account.nameInNotionDatabase]);

    return UserTransaction(
        transactionId,
        note.value,
        value.value,
        stringToTransactionTypeEnum(expendType.value),
        date.value,
        category.value,
        secondaryCategory.value,
        location.value,
        origin.value);
  }
}
