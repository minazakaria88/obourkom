import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewOrderModel {
  late final LatLng pickUpLocation;
  late final LatLng dropOffLocation;
  late final String pickUpAddress;
  late final String dropOffAddress;
  late final String paymentMethod;
  late final String notes;
  late final String discount;


  NewOrderModel({
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.paymentMethod,
    required this.notes,
    required this.discount,
  });





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickUpLocation'] = pickUpLocation;
    data['dropOffLocation'] = dropOffLocation;
    data['pickUpAddress'] = pickUpAddress;
    data['dropOffAddress'] = dropOffAddress;
    data['paymentMethod'] = paymentMethod;
    data['notes'] = notes;
    data['discount'] = discount;
    return data;
  }

}
