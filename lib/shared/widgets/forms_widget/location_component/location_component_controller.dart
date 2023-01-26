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

  Future<String> getLocationText() async {
    //TODO loading
    var result = await _locationUseCase.getUserLocation();
    if (result.isSuccess) {
      textController.text = result.data!;
      return result.data!;
    }
    //TODO Set error
    return "";
  }
}
