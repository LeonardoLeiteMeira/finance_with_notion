import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'initial.controller.g.dart';

class InitialController = _InitialControllerBase with _$InitialController;

abstract class _InitialControllerBase with Store {
  Future<void> initiApp() async {
    var futureList = <Future>[];

    var future = GetIt.instance.isReady();

    futureList.add(future);
    await Future.wait(futureList);
  }
}
