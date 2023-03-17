import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'model/user_transaction_notion_extension.dart';
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

    var location = NotionRichText.fromJson(
        properties[NotionDatabaseColumns.location.nameInNotionDatabase]);

    var note = NotionRichText.fromJson(
        properties[NotionDatabaseColumns.note.nameInNotionDatabase]);

    var account = NotionSelect.fromJson(
        properties[NotionDatabaseColumns.account.nameInNotionDatabase]);

    return UserTransaction(
        id: transactionId,
        note: note.value,
        value: value.value,
        transactionType: stringToTransactionTypeEnum(expendType.value),
        date: date.value,
        category: category.value,
        secondaryCategory: secondaryCategory.value,
        location: location.value,
        origin: account.value);
  }

  Map<String, dynamic> userTransactionToNotionPage(
      UserTransactionToNotionExtension userTransaction, String databaseId) {
    Map<String, dynamic> notionJsonPage = {
      // ignore: unnecessary_string_interpolations
      "parent": {"database_id": "$databaseId"},
      "properties": <String, dynamic>{}
    };

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll({
      "Name": {
        "title": [
          {
            "text": {"content": "Insert from app"}
          }
        ]
      }
    });

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionNote.getPropertyInNotionJson(
            NotionDatabaseColumns.note.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionValue.getPropertyInNotionJson(
            NotionDatabaseColumns.value.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionTransactionType.getPropertyInNotionJson(
            NotionDatabaseColumns.type.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionDate.getPropertyInNotionJson(
            NotionDatabaseColumns.date.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionCategory.getPropertyInNotionJson(
            NotionDatabaseColumns.category.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionSecondaryCategory.getPropertyInNotionJson(
            NotionDatabaseColumns.secondaryCategory.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionLocation.getPropertyInNotionJson(
            NotionDatabaseColumns.location.nameInNotionDatabase));

    (notionJsonPage["properties"] as Map<String, dynamic>).addAll(
        userTransaction.notionOrigin.getPropertyInNotionJson(
            NotionDatabaseColumns.account.nameInNotionDatabase));

    print(notionJsonPage);

    return notionJsonPage;
  }
}
