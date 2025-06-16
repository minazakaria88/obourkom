part of 'orders_cubit.dart';


enum MakeOrderStatus {
  initial,
  loading,
  success,
  failure,
}


extension MakeOrderStatusX on OrdersState {
  bool get isLoading => makeOrderStatus == MakeOrderStatus.loading;
  bool get isSuccess => makeOrderStatus == MakeOrderStatus.success;
  bool get isFailure => makeOrderStatus == MakeOrderStatus.failure;
}

class OrdersState extends Equatable {
  LatLng? pickedLocation;
  Placemark? pickedLocationData;
  LatLng? deliveryLocation;
  Placemark? deliveryLocationData;
  String? paymentMethod;
  MakeOrderStatus ? makeOrderStatus;
  String? errorMessage;
  Duration ? orderTimerDuration;
  OrdersState({
    this.pickedLocation,
    this.pickedLocationData,
    this.deliveryLocation,
    this.deliveryLocationData,
    this.paymentMethod,
    this.makeOrderStatus,
    this.errorMessage,
    this.orderTimerDuration
  });

  OrdersState copyWith({
    LatLng? pickedLocation,
    Placemark? pickedLocationData,
    LatLng? deliveryLocation,
    Placemark? deliveryLocationData,
    String? paymentMethod,
    MakeOrderStatus? makeOrderStatus,
    String? errorMessage,
    Duration? orderTimerDuration

  }) {
    return OrdersState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      pickedLocationData: pickedLocationData ?? this.pickedLocationData,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      deliveryLocationData: deliveryLocationData ?? this.deliveryLocationData,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      makeOrderStatus: makeOrderStatus ?? this.makeOrderStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      orderTimerDuration: orderTimerDuration ?? this.orderTimerDuration
    );
  }

  @override
  List<Object?> get props => [
    paymentMethod,
    deliveryLocation,
    deliveryLocationData,
    pickedLocation,
    pickedLocationData,
    makeOrderStatus,
    errorMessage,
    orderTimerDuration
  ];
}
