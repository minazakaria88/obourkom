import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationOrderModel {
  LatLng ? position;
  Placemark ? address;

  LocationOrderModel({
    required this.position,
    required this.address,
  });
}