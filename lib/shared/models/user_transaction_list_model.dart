import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

class UserTransactionList {
  List<UserTransaction> userTransactions;
  int page;
  bool hasMore;

  UserTransactionList(this.userTransactions, this.page, this.hasMore);
}
