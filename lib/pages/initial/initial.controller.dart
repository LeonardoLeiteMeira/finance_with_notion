import 'package:finance_with_notion/shared/models/generic/data_state.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'initial.controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  DataState appDataState = DataState<bool>();

  Future<void> initiApp() async {
    appDataState.setData(true);
  }
}
