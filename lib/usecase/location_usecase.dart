import 'package:finance_with_notion/shared/models/generic/result.dart';
import 'package:injectable/injectable.dart';

import '../shared/service/location_service/location_service.dart';

@lazySingleton
class LocationUseCase {
  final LocationService _locationService;
  LocationUseCase(this._locationService);

  Future<Result<String>> getUserLocation() async {
    var location = await _locationService.getLocation();
    var address = await location.getAddress();
    return Result.success(address);
  }
}
