import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'expenses.controller.g.dart';

@lazySingleton
class ExpensesController = _ExpensesControllerBase with _$ExpensesController;

abstract class _ExpensesControllerBase with Store {
  @observable
  bool createNewTransaction = false;

  @action
  void setCreateNewTransaction(bool value) {
    createNewTransaction = value;
  }
}
