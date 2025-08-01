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
  GetOrdersStatus ? getOrdersStatus;
  List<OrderDataModel>? recentOrdersList;
  List<OrderDataModel>? completedOrdersList;
  SubmitOrderModel? orderDataModel;
  OrdersState({
    this.pickedLocation,
    this.pickedLocationData,
    this.deliveryLocation,
    this.deliveryLocationData,
    this.paymentMethod,
    this.makeOrderStatus,
    this.errorMessage,
    this.getOrdersStatus,
    this.completedOrdersList,
    this.recentOrdersList,
    this.orderDataModel
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
    List<OrderDataModel>? recentOrdersList,
    List<OrderDataModel>? completedOrdersList,
    SubmitOrderModel? orderDataModel
  }) {
    return OrdersState(
      pickedLocation: pickedLocation ?? this.pickedLocation,
      pickedLocationData: pickedLocationData ?? this.pickedLocationData,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      deliveryLocationData: deliveryLocationData ?? this.deliveryLocationData,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      makeOrderStatus: makeOrderStatus ?? this.makeOrderStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      getOrdersStatus: getOrdersStatus ?? this.getOrdersStatus,
      recentOrdersList: recentOrdersList ?? this.recentOrdersList,
      completedOrdersList: completedOrdersList ?? this.completedOrdersList,
      orderDataModel: orderDataModel ?? this.orderDataModel
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
    getOrdersStatus,
    recentOrdersList,
    completedOrdersList,
    orderDataModel
  ];
}
