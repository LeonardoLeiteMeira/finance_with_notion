import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:leo_financial/shared/models/enum/transaction_type.dart';
import 'package:leo_financial/shared/models/generic/data_state.dart';
import 'package:leo_financial/shared/models/user_transaction.model.dart';
import 'package:leo_financial/usecase/user_transactions.usecase.dart';
import 'package:leo_financial/shared/models/generic/result.dart';
import 'package:mobx/mobx.dart';
part 'initial.controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  final UserTransactionUsecase _userTransactionUsecase;

  _InitialControllerBase(this._userTransactionUsecase);

  var userTransactionsState = DataState<List<UserTransaction>>();

  void getTransactions() async {
    _userTransactionUsecase
        .getUserTransactions()
        .resultCompleteSet(userTransactionsState);
  }

  void addTransaction() {
    var rng = Random().nextInt(200);
    var transaction = UserTransaction(
        rng, "iPhone", 4630, TransactionType.debt, DateTime.now());

    userTransactionsState
        .setData([...userTransactionsState.data ?? [], transaction]);
  }
}
