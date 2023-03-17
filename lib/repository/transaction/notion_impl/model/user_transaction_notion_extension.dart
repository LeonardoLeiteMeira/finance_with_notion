import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

import '../enum/notion_database_columns_enum.dart';
import '../notionTypes/notion_type_base.dart';

class UserTransactionToNotionExtension extends UserTransaction {
  late NotionTypeBase notionNote;
  late NotionTypeBase notionValue;
  late NotionTypeBase notionTransactionType;
  late NotionTypeBase notionDate;
  late NotionTypeBase notionCategory;
  late NotionTypeBase notionSecondaryCategory;
  late NotionTypeBase notionLocation;
  late NotionTypeBase notionOrigin;

  UserTransactionToNotionExtension(
      {required String note,
      required double value,
      required TransactionType transactionType,
      required DateTime date,
      required String category,
      required List<String> secondaryCategory,
      required String location,
      required String origin})
      : super(
            note: note,
            value: value,
            transactionType: transactionType,
            date: date,
            category: category,
            secondaryCategory: secondaryCategory,
            location: location,
            origin: origin) {
    _initNotionTypes();
  }

  UserTransactionToNotionExtension.fromUserTransaction(
      UserTransaction userTransaction)
      : super(
            note: userTransaction.note,
            value: userTransaction.value,
            transactionType: userTransaction.transactionType,
            date: userTransaction.date,
            category: userTransaction.category,
            secondaryCategory: userTransaction.secondaryCategory,
            location: userTransaction.location,
            origin: userTransaction.origin) {
    _initNotionTypes();
  }

  void _initNotionTypes() {
    notionNote = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.note.notionType, value: note);

    notionValue = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.value.notionType, value: value);

    notionTransactionType = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.type.notionType,
        value: transactionType.asString());

    notionDate = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.date.notionType, value: date);

    notionCategory = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.category.notionType, value: category);

    notionSecondaryCategory = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.secondaryCategory.notionType,
        value: secondaryCategory);

    notionLocation = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.location.notionType, value: location);

    notionOrigin = NotionTypeBase.initNotionType(
        type: NotionDatabaseColumns.account.notionType, value: origin);
  }
}
