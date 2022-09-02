import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

class UserTransactionList {
  List<UserTransaction> userTransactions;
  String page;
  bool hasMore;

  UserTransactionList(this.userTransactions, this.page, this.hasMore);

  double get totalValueExpende => userTransactions.fold<double>(
      0.0,
      (previousTransaction, transaction) =>
          previousTransaction + transaction.value);
}
