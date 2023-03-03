import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import '../../shared/models/user_transaction.model.dart';

abstract class TransactionDatabase {
  Future<bool> insertTransaction(UserTransaction userTransaction);

  Future<UserTransactionList> getTransactions({String page});

  Future<void> deleteTransaction(String id);

  Future<List<String>> getCategories();

  Future<List<String>> getTransactionsAccount();
}
