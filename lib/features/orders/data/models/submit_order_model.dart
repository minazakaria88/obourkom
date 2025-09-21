class SubmitOrderModel {
  double? fromLat;
  double? fromLng;
  double? toLat;
  double? toLng;
  num? priceFrom;
  num? priceTo;
  int? customerId;
  String? paymentType;
  String? notes;
  String? code;
  String? truckTypeId;
  String? truckSizeId;
  String ? typeService;
  String? updatedAt;
  String? createdAt;
  String? status;
  String ? addressFrom;
  String ? addressTo;
  int? id;

  SubmitOrderModel(
      {this.fromLat,
        this.fromLng,
        this.toLat,
        this.toLng,
        this.priceFrom,
        this.priceTo,
        this.customerId,
        this.paymentType,
        this.notes,
        this.code,
        this.truckTypeId,
        this.truckSizeId,
        this.typeService,
        this.updatedAt,
        this.createdAt,
        this.status,
        this.addressFrom,
        this.addressTo,
        this.id});

  SubmitOrderModel.fromJson(Map<String, dynamic> json) {
    fromLat = json['from_lat'];
    fromLng = json['from_lng'];
    toLat = json['to_lat'];
    toLng = json['to_lng'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    customerId = json['customer_id'];
    paymentType = json['payment_type'];
    notes = json['notes'];
    code = json['code'];
    truckTypeId = json['truck_type_id'];
    truckSizeId = json['truckSize']['name'];
    typeService = json['type_service'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    status = json['status'];
    addressFrom = json['address_from'];
    addressTo = json['address_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from_lat'] = fromLat;
    data['from_lng'] = fromLng;
    data['to_lat'] = toLat;
    data['to_lng'] = toLng;
    data['price_from'] = priceFrom;
    data['price_to'] = priceTo;
    data['customer_id'] = customerId;
    data['payment_type'] = paymentType;
    data['notes'] = notes;
    data['code'] = code;
    data['truck_type_id'] = truckTypeId;
    data['truck_size_id'] = truckSizeId;
    data['type_service'] = typeService;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['status'] = status;
    data['address_from'] = addressFrom;
    data['address_to'] = addressTo;
    return data;
  }
}