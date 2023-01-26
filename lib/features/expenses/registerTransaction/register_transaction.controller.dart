import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/usecase/location_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'register_transaction.controller.g.dart';

@lazySingleton
class RegisterTransactionController = _RegisterTransactionControllerBase
    with _$RegisterTransactionController;

abstract class _RegisterTransactionControllerBase with Store {
  final LocationUseCase _locationUseCase;

  _RegisterTransactionControllerBase(this._locationUseCase);

  @observable
  TransactionType transactionType = TransactionType.credit;

  @action
  void setTransactionTypeFromString(String value) =>
      transactionType = stringToTransactionTypeEnum(value);

  @observable
  double value = 0;

  @action
  void setValue(double newValue) => value = newValue;

  @observable
  String category = "";

  @action
  void setCategory(String value) => category = value;

  @observable
  String seconderyCategory = "";

  @action
  void setSecondaryCategory(String value) => category = value;

  @observable
  DateTime transactionDate = DateTime.now();

  @action
  void setTransactionDate(DateTime value) => transactionDate = value;

  void getLocation() {
    _locationUseCase.getUserLocation();
  }
}
