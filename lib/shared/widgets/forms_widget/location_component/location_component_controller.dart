import 'package:finance_with_notion/usecase/location_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'location_component_controller.g.dart';

@injectable
class LocationComponentController = _LocationComponentControllerBase
    with _$LocationComponentController;

abstract class _LocationComponentControllerBase with Store {
  final LocationUseCase _locationUseCase;
  TextEditingController textController = TextEditingController();

  _LocationComponentControllerBase(this._locationUseCase);

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<String> getLocationText() async {
    var result = await _locationUseCase.getUserLocation();
    if (result.isSuccess) {
      textController.text = result.data!;
      return result.data!;
    }
    return "";
  }
}
