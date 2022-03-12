import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'initial.controller.g.dart';

@lazySingleton
class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  @observable
  int count = 0;

  @action
  void setCount() => count++;
}
