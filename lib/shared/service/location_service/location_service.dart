import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import 'location_data_model.dart';

@injectable
class LocationService {
  Future<LocationDataModel> getLocation() async {
    try {
      if (false) {
        return _mockLocation();
      } else {
        return await _realLocation();
      }
    } catch (ex) {
      print(ex);
      throw "Error in getLocation";
    }
  }

  LocationDataModel _mockLocation() => LocationDataModel(
      latitude: 41.796095087232096, longitude: -6.768567105761513);

  Future<LocationDataModel> _realLocation() async {
    var userLocationService = Location();
    var currentLocation = await userLocationService.getLocation();
    if (currentLocation.latitude == null || currentLocation.longitude == null) {
      //TODO Create error to get location
      throw ("Error to get location");
    }
    return LocationDataModel(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!);
  }
}
