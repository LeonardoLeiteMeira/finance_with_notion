import 'dart:math';
import 'package:finance_with_notion/repository/transaction/transaction_database.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/generic/data_state.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';
import 'package:mobx/mobx.dart';
part 'list_transaction.controller.g.dart';

@lazySingleton
class ListTransactionController = _ListTransactionControllerBase
    with _$ListTransactionController;

abstract class _ListTransactionControllerBase with Store {
  final UserTransactionUsecase _userTransactionUsecase;

  final TransactionDatabase _transactionDatabase;

  _ListTransactionControllerBase(
      this._userTransactionUsecase, this._transactionDatabase);

  var userTransactionsState = DataState<List<UserTransaction>>();

  void test() {
    _transactionDatabase.getTransactions();
  }

  void getTransactions() async {
    _userTransactionUsecase
        .getUserTransactions()
        .resultCompleteSet(userTransactionsState);
  }

  void addTransaction() {
    var rng = Random().nextInt(200).toString();
    var transaction = UserTransaction(rng, "iPhone", 4630, TransactionType.debt,
        DateTime.now().toIso8601String(), "Tech", [], "", "NuConta");

    userTransactionsState
        .setData([...userTransactionsState.data ?? [], transaction]);
  }
}
