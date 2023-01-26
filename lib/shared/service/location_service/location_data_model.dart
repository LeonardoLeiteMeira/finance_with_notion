import 'package:geocoding/geocoding.dart';

class LocationDataModel {
  final double latitude;
  final double longitude;

  LocationDataModel(
      {this.latitude = 41.796095087232096,
      this.longitude = -6.768567105761513});

  Future<String> getAddress() async {
    var placemarks = await placemarkFromCoordinates(latitude, longitude);
    var name = placemarks.first.name;
    var street = placemarks.first.street;
    if (name != null) {
      return "$name - $street";
    } else {
      //TODO Create error to get location
      throw ("Error to get address");
    }
  }
}
