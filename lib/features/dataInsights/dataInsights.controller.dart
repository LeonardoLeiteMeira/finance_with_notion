import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'dataInsights.controller.g.dart';

@lazySingleton
class DataInsightsController = _DataInsightsControllerBase
    with _$DataInsightsController;

abstract class _DataInsightsControllerBase with Store {
  @observable
  int counter = 0;

  @action
  void setCounter(int value) => counter = value;
}
