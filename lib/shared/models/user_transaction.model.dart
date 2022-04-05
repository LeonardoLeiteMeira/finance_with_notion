import 'package:leo_financial/shared/models/enum/transaction_type.dart';

class UserTransaction {
  int id;
  String description;
  double value;
  TransactionType transactionType;
  DateTime date;

  UserTransaction(
      this.id, this.description, this.value, this.transactionType, this.date);
}
