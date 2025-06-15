part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  LatLng? pickedLocation;
  Placemark? pickedLocationData;
  LatLng? deliveryLocation;
  Placemark? deliveryLocationData;
  String? paymentMethod;
  OrdersState({
    this.pickedLocation,
    this.pickedLocationData,
    this.deliveryLocation,
    this.deliveryLocationData,
    this.paymentMethod,
  });

  OrdersState copyWith({
    LatLng? pickedLocation,
    Placemark? pickedLocationData,
    LatLng? deliveryLocation,
    Placemark? deliveryLocationData,
    String? paymentMethod,
  }) {
    return OrdersState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      pickedLocationData: pickedLocationData ?? this.pickedLocationData,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      deliveryLocationData: deliveryLocationData ?? this.deliveryLocationData,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  List<Object?> get props => [
    paymentMethod,
    deliveryLocation,
    deliveryLocationData,
    pickedLocation,
    pickedLocationData,
  ];
}
