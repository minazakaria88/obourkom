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

enum RateDriverStatus {
  initial,
  loading,
  success,
  failure,
}


extension MakeOrderStatusX on OrdersState {
  bool get isLoading => makeOrderStatus == MakeOrderStatus.loading;
  bool get isSuccess => makeOrderStatus == MakeOrderStatus.success;
  bool get isFailure => makeOrderStatus == MakeOrderStatus.failure;
  bool get isRateDriverLoading => rateDriverStatus == RateDriverStatus.loading;
  bool get isRateDriverSuccess => rateDriverStatus == RateDriverStatus.success;
  bool get isRateDriverFailure => rateDriverStatus == RateDriverStatus.failure;
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
  RateDriverStatus ? rateDriverStatus;
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
    this.rateDriverStatus
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
    RateDriverStatus? rateDriverStatus

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
      rateDriverStatus: rateDriverStatus ?? this.rateDriverStatus
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
    rateDriverStatus
  ];
}
