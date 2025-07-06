import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



//location picked for order when returning back from map
class LocationOrderModel {
  LatLng ? position;
  Placemark ? address;

  LocationOrderModel({
    required this.position,
    required this.address,
  });
}