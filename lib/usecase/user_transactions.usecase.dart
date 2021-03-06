import 'package:injectable/injectable.dart';
import 'package:finance_with_notion/shared/base/base_usecase.dart';
import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';

@injectable
class UserTransactionUsecase extends BaseUsecase {
  Future<Result<List<UserTransaction>>> getUserTransactions() =>
      safeCall(() async {
        var transactionList = <UserTransaction>[];

        transactionList.add(UserTransaction(
            "1",
            "Ticket",
            50.0,
            TransactionType.credit,
            DateTime.now().toIso8601String(),
            "Party",
            [],
            "",
            "C6 Card"));
        transactionList.add(UserTransaction(
            "2",
            "T-Shirt",
            60.0,
            TransactionType.credit,
            DateTime.now().toIso8601String(),
            "Clothes",
            [],
            "",
            "C6 Card"));
        transactionList.add(UserTransaction(
            "3",
            "Uber",
            30.0,
            TransactionType.credit,
            DateTime.now().toIso8601String(),
            "Transportation",
            [],
            "",
            "C6 Card"));
        transactionList.add(UserTransaction(
            "4",
            "Dinner",
            40.0,
            TransactionType.credit,
            DateTime.now().toIso8601String(),
            "Party",
            [],
            "",
            "C6 Card"));
        transactionList.add(UserTransaction(
            "5",
            "My Salary",
            9000.0,
            TransactionType.revenue,
            DateTime.now().toIso8601String(),
            "Salary",
            [],
            "",
            "C6 Card"));

        return transactionList;
      });
}
