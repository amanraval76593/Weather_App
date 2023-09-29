// ignore_for_file: camel_case_types, unused_local_variable, avoid_print

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;
  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
