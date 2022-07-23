import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';

class UserTransaction {
  int id;
  String description;
  double value;
  TransactionType transactionType;
  DateTime date;

  UserTransaction(
      this.id, this.description, this.value, this.transactionType, this.date);

  UserTransaction.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        description = json["description"],
        value = json["value"],
        transactionType = json["transactionType"],
        date = json["date"];
}
