import 'package:finance_with_notion/shared/models/enum/transaction_type.dart';
import 'package:finance_with_notion/shared/models/user_transaction.model.dart';
import 'package:finance_with_notion/usecase/location_usecase.dart';
import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'register_transaction.controller.g.dart';

@lazySingleton
class RegisterTransactionController = _RegisterTransactionControllerBase
    with _$RegisterTransactionController;

abstract class _RegisterTransactionControllerBase with Store {
  final LocationUseCase _locationUseCase;
  final UserTransactionUsecase _userTransactionUsecase;

  _RegisterTransactionControllerBase(
      this._locationUseCase, this._userTransactionUsecase);

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  TransactionType transactionType = TransactionType.credit;

  @action
  void setTransactionType(TransactionType value) => transactionType = value;

  @observable
  DateTime transactionDate = DateTime.now();

  @action
  void setTransactionDate(DateTime value) => transactionDate = value;

  void getLocation() {
    _locationUseCase.getUserLocation();
  }

  Future<bool> saveNewTransaction(UserTransaction newUserTransaction) async {
    setIsLoading(true);
    var result =
        await _userTransactionUsecase.createNewTransaction(newUserTransaction);
    setIsLoading(false);
    if (result.isSuccess) {
      //TODO show success snackbar
      return true;
    } else {
      //TODO show error snackbar
      return false;
    }
  }
}
