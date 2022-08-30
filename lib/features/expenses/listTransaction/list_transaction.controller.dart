import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/generic/data_state.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/user_transaction_list_model.dart';
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
    var rng = Random().nextInt(200).toString();
    var transaction = UserTransaction(rng, "iPhone", 4630, TransactionType.debt,
        DateTime.now().toIso8601String(), "Tech", [], "", "NuConta");
    var currentUserTransactionList = userTransactionsState.data;

    currentUserTransactionList!.userTransactions.add(transaction);

    userTransactionsState.setData(currentUserTransactionList);
  }
}
