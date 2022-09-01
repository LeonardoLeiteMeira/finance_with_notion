import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:finance_with_notion/shared/models/generic/data_state.dart';
import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/user_transaction_list_model.dart';
import '../expenses.controller.dart';
part 'list_transaction.controller.g.dart';

@LazySingleton()
class ListTransactionController = _ListTransactionControllerBase
    with _$ListTransactionController;

abstract class _ListTransactionControllerBase with Store {
  final UserTransactionUsecase _userTransactionUsecase;
  var userTransactionsState = DataState<UserTransactionList>();

  _ListTransactionControllerBase(this._userTransactionUsecase);

  void getTransactions() async {
    _userTransactionUsecase
        .getUserTransactions()
        .resultCompleteSet(userTransactionsState);
  }

  void addTransaction() {
    var expensesController = GetIt.I.get<ExpensesController>();
    expensesController.setCreateNewTransaction(true);
  }
}
