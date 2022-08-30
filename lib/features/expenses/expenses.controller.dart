import 'package:finance_with_notion/shared/models/generic/data_state.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'expenses.controller.g.dart';

@lazySingleton
class ExpensesController = _ExpensesControllerBase with _$ExpensesController;

abstract class _ExpensesControllerBase with Store {
  DataState appDataState = DataState<bool>();

  Future<void> initiApp() async {
    appDataState.setData(true);
  }
}
