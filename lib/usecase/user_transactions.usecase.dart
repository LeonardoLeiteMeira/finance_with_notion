import 'package:finance_with_notion/repository/transaction/transaction_database.dart';
import 'package:finance_with_notion/shared/models/user_transaction_list_model.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_with_notion/shared/base/base_usecase.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';

@injectable
class UserTransactionUsecase extends BaseUsecase {
  final TransactionDatabase _transactionDatabase;

  UserTransactionUsecase(this._transactionDatabase);

  //TODO: Local databse to cache items

  Future<Result<UserTransactionList>> getUserTransactions() =>
      safeCall(() async {
        var transactionList = await _transactionDatabase.getTransactions();
        return transactionList;
      });

  Future<Result<List<String>>> getUserCategories() => safeCall(() async {
        var categories = await _transactionDatabase.getCategories();
        return categories;
      });

  Future<Result<List<String>>> gettransactionAccount() => safeCall(() async {
        var categories = await _transactionDatabase.getTransactionsAccount();
        return categories;
      });
}
