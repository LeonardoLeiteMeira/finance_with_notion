import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:intl/intl.dart';

class UserTransaction {
  String? id;
  String note;
  double value;
  TransactionType transactionType;
  DateTime date;
  String category;
  List<String> secondaryCategory;
  String location;
  String origin;

  String get valueAsCurrency {
    //TODO insert dynamic locale currency
    var format = NumberFormat.simpleCurrency(locale: "de_DE");
    return format.format(value);
  }

  UserTransaction(
      {this.id,
      required this.note,
      required this.value,
      required this.transactionType,
      required this.date,
      required this.category,
      required this.secondaryCategory,
      required this.location,
      required this.origin});

  UserTransaction.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        note = json["description"],
        value = json["value"],
        transactionType = json["transactionType"],
        date = json["date"],
        category = json["category"],
        secondaryCategory = json["seconderyCategory"],
        location = json["location"],
        origin = json["origin"];
}
