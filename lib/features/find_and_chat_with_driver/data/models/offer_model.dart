class OfferModel
{
  String? id;
  String? driverId;
  String? orderId;
  String? price;
  String? createdAt;
  String? updatedAt;

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}