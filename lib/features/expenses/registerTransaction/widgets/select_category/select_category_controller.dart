import 'package:finance_with_notion/usecase/user_transactions.usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'select_category_controller.g.dart';

@injectable
class SelectCategoryController = _SelectCategoryControllerBase
    with _$SelectCategoryController;

abstract class _SelectCategoryControllerBase with Store {
  final UserTransactionUsecase _transactionsUsecase;

  _SelectCategoryControllerBase(this._transactionsUsecase);

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  var categories = ObservableList<String>();

  @action
  void setCategories(List<String> values) =>
      categories = ObservableList.of(values);

  Future<void> readUserCategories() async {
    setIsLoading(true);
    var result = await _transactionsUsecase.getUserCategories();
    if (result.isSuccess) {
      setCategories(result.data!);
    } else {
      print(result.error);
    }
    setIsLoading(false);
  }
}
