import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import '../../shared/models/user_transaction.model.dart';

abstract class TransactionDatabase {
  Future<void> insertTransaction(UserTransaction userTransaction);

  Future<UserTransactionList> getTransactions();

  Future<void> deleteTransaction(String id);
}
