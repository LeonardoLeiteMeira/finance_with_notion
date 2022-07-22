import '../../shared/models/user_transaction.model.dart';

abstract class TransactionDatabase {
  ///use Create a Page with Content endpoint
  ///post in https://api.notion.com/v1/pages/
  void insertTransaction(UserTransaction userTransaction);

  ///post in https://api.notion.com/v1/databases/:id/query
  List<UserTransaction> getTransactions();

  ///delete in https://api.notion.com/v1/blocks/:id
  void deleteTransaction(String id);
}
