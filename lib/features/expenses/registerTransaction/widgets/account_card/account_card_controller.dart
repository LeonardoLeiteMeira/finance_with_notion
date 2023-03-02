import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'account_card_controller.g.dart';

@injectable
class AccountCardController = _AccountCardControllerBase
    with _$AccountCardController;

abstract class _AccountCardControllerBase with Store {
  final UserTransactionUsecase _transactionsUsecase;

  _AccountCardControllerBase(this._transactionsUsecase);

  @observable
  var accountOrOrigins = ObservableList<String>();

  @action
  void setAccountOrOrigins(List<String> values) =>
      accountOrOrigins = ObservableList.of(values);

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  Future<void> loadingAccountOrOrigins() async {
    setLoading(true);
    var result = await _transactionsUsecase.gettransactionAccount();
    if (result.isSuccess) {
      setAccountOrOrigins(result.data!);
    }
    setLoading(false);
  }
}
