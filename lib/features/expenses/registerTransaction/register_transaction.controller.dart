import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'register_transaction.controller.g.dart';

@lazySingleton
class RegisterTransactionController = _RegisterTransactionControllerBase
    with _$RegisterTransactionController;

abstract class _RegisterTransactionControllerBase with Store {
  @observable
  String description = "";
}
