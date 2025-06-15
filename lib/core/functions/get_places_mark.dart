import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<Placemark>> getAddressFromLatAndLng(LatLng position) async {
  return await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );
}
