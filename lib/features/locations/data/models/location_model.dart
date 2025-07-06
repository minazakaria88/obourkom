import 'package:google_maps_flutter/google_maps_flutter.dart';



/// get locations model
class LocationModel
{
  int? id;
  String? name;
  LatLng? latLng;
  String? type;


  LocationModel({
    this.id,
    this.name,
    this.latLng,
    this.type
  });

    LocationModel.fromJson(Map<String,dynamic> json)
    {
      id = json['id'];
      name = json['name'];
      latLng = LatLng(json['latitude'], json['longitude']);
      type = json['type'];
    }
}