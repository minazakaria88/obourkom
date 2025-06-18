part of 'orders_cubit.dart';


enum MakeOrderStatus {
  initial,
  loading,
  success,
  failure,
}


enum GetOrdersStatus {
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
  GetOrdersStatus ? getOrdersStatus;
  List<OrderModel>? ordersList;
  OrdersState({
    this.pickedLocation,
    this.pickedLocationData,
    this.deliveryLocation,
    this.deliveryLocationData,
    this.paymentMethod,
    this.makeOrderStatus,
    this.errorMessage,
    this.orderTimerDuration,
    this.getOrdersStatus,
    this.ordersList,
  });

  OrdersState copyWith({
    LatLng? pickedLocation,
    Placemark? pickedLocationData,
    LatLng? deliveryLocation,
    Placemark? deliveryLocationData,
    String? paymentMethod,
    MakeOrderStatus? makeOrderStatus,
    String? errorMessage,
    Duration? orderTimerDuration,
    GetOrdersStatus? getOrdersStatus,
    List<OrderModel>? ordersList,

  }) {
    return OrdersState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      pickedLocationData: pickedLocationData ?? this.pickedLocationData,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      deliveryLocationData: deliveryLocationData ?? this.deliveryLocationData,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      makeOrderStatus: makeOrderStatus ?? this.makeOrderStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      orderTimerDuration: orderTimerDuration ?? this.orderTimerDuration,
      getOrdersStatus: getOrdersStatus ?? this.getOrdersStatus,
      ordersList: ordersList ?? this.ordersList,
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
    orderTimerDuration,
    getOrdersStatus,
    ordersList,
  ];
}
