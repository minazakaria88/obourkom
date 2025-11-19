import 'package:geocoding/geocoding.dart';

String? concatenatePlacemark({required Placemark? place}) {
  if (place == null) return null;
  return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}';
}
