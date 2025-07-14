class OrderModel
{
  String? id;
  String? status;
  String ? serviceType;
  String ? truckType;
  String ? cost;
  String ? orderNumber;


  OrderModel({
    this.id,
    this.status,
    this.serviceType,
    this.truckType,
    this.cost,
    this.orderNumber,
  });


  OrderModel.fromJson(Map<String , dynamic> json)
  {
    id = json['id'];
    status = json['status'];
    serviceType = json['service_type'];
    truckType = json['truck_type'];
    cost = json['cost'];
    orderNumber = json['order_number'];
  }
}