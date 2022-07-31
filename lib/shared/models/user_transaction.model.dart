import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';

class UserTransaction {
  String id;
  String note;
  double value;
  TransactionType transactionType;
  String date;
  String category;
  List<String> seconderyCategory;
  String location;
  String origin;

  UserTransaction(
      this.id,
      this.note,
      this.value,
      this.transactionType,
      this.date,
      this.category,
      this.seconderyCategory,
      this.location,
      this.origin);

  UserTransaction.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        note = json["description"],
        value = json["value"],
        transactionType = json["transactionType"],
        date = json["date"],
        category = json["category"],
        seconderyCategory = json["seconderyCategory"],
        location = json["location"],
        origin = json["origin"];
}
