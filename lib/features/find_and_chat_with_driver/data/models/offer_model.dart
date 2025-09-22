class OfferModel {
  int? id;
  int? driverId;
  String? orderId;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? phone;

  OfferModel({
    this.id,
    this.driverId,
    this.orderId,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.phone,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'].toString();
    price = json['price'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['driver_name'];
    phone = json['driver_phone'];
  }
}
