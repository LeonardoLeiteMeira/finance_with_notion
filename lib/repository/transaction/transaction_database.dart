import '../../shared/models/user_transaction.model.dart';

abstract class TransactionDatabase {
  Future<void> insertTransaction(UserTransaction userTransaction);

  Future<List<UserTransaction>> getTransactions();

  Future<void> deleteTransaction(String id);
}
