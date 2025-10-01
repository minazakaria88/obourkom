class FirebaseOfferModel {
  int ?id;
  int ?orderId;
  int ?customerId;
  int ?driverId;
  String ?driverName;
  String ?driverPhone;
  num ?price;
  bool ?isAccepted;
  String? status;
  String ?createdAt;
  String ?updatedAt;

  FirebaseOfferModel({
    this.id,
    this.orderId,
    this.customerId,
    this.driverId,
    this.driverName,
    this.driverPhone,
    this.price,
    this.isAccepted,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory FirebaseOfferModel.fromJson(Map<String, dynamic> json) {
    return FirebaseOfferModel(
      id: json['id'],
      orderId: json['order_id'] ,
      customerId: json['customer_id'] ,
      driverId: json['driver_id'],
      driverName: json['driver_name'],
      driverPhone: json['driver_phone'],
      price: json['price'],
      isAccepted: json['is_accepted'] ,
      status: json['status'],
      createdAt: json['created_at'] ,
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'customer_id': customerId,
      'driver_id': driverId,
      'driver_name': driverName,
      'driver_phone': driverPhone,
      'price': price,
      'is_accepted': isAccepted,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FirebaseOfferModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              orderId == other.orderId &&
              customerId == other.customerId &&
              driverId == other.driverId &&
              driverName == other.driverName &&
              driverPhone == other.driverPhone &&
              price == other.price &&
              isAccepted == other.isAccepted &&
              status == other.status &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt;

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    customerId,
    driverId,
    driverName,
    driverPhone,
    price,
    isAccepted,
    status,
    createdAt,
    updatedAt,
  );






}
