class OrderModel {
  List<OrderDataModel>? data;
  Links? links;
  Meta? meta;

  OrderModel({this.data, this.links, this.meta});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderDataModel>[];
      json['data'].forEach((v) {
        data!.add(OrderDataModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class OrderDataModel {
  int? id;
  String? code;
  String? fromAddress;
  String? toAddress;
  double? fromLat;
  double? fromLng;
  double? toLat;
  double? toLng;
  String? priceFrom;
  String? priceTo;
  String ? price;
  String? status;
  String? statusPaid;
  String? paymentType;
  String? notes;
  String? typeService;
  int? acceptedOfferId;
  TruckType? truckType;
  TruckSize? truckSize;
  Driver? driver;
  Customer? customer;
  String? createdAt;
  List<Offer>? offers;

  OrderDataModel(
      {this.id,
        this.code,
        this.fromAddress,
        this.toAddress,
        this.fromLat,
        this.fromLng,
        this.toLat,
        this.toLng,
        this.priceFrom,
        this.priceTo,
        this.price,
        this.status,
        this.statusPaid,
        this.paymentType,
        this.notes,
        this.typeService,
        this.acceptedOfferId,
        this.truckType,
        this.truckSize,
        this.driver,
        this.customer,
        this.createdAt,
        this.offers});

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    fromAddress = json['from_address'];
    toAddress = json['to_address'];
    fromLat = json['from_lat'];
    fromLng = json['from_lng'];
    toLat = json['to_lat'];
    toLng = json['to_lng'];
    priceFrom = json['price_from'];
    priceTo = json['price_to'];
    price = json['price'];
    status = json['status'];
    statusPaid = json['status_paid'];
    paymentType = json['payment_type'];
    notes = json['notes'];
    typeService = json['type_service'];
    acceptedOfferId = json['accepted_offer_id'];
    truckType = json['truckType'] != null
        ? TruckType.fromJson(json['truckType'])
        : null;
    truckSize = json['truckSize'] != null
        ? TruckSize.fromJson(json['truckSize'])
        : null;
    driver =
    json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    createdAt = json['created_at'];
    if (json['offers'] != null) {
      offers = <Offer>[];
      json['offers'].forEach((v) {
        offers!.add(Offer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['from_address'] = fromAddress;
    data['to_address'] = toAddress;
    data['from_lat'] = fromLat;
    data['from_lng'] = fromLng;
    data['to_lat'] = toLat;
    data['to_lng'] = toLng;
    data['price_from'] = priceFrom;
    data['price_to'] = priceTo;
    data['price'] = price;
    data['status'] = status;
    data['status_paid'] = statusPaid;
    data['payment_type'] = paymentType;
    data['notes'] = notes;
    data['type_service'] = typeService;
    data['accepted_offer_id'] = acceptedOfferId;
    if (truckType != null) {
      data['truckType'] = truckType!.toJson();
    }
    if (truckSize != null) {
      data['truckSize'] = truckSize!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['created_at'] = createdAt;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TruckType {
  int? id;
  String? name;

  TruckType({this.id, this.name});

  TruckType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TruckSize {
  int? id;
  String? name;

  TruckSize({this.id, this.name});

  TruckSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Driver {
  int ? id;
  String? name;
  String? phone;

  Driver({this.id, this.name, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Offer {
  int? id;
  int? driverId;
  int? customerId;
  String ? title;
  String ? description;
  String? price;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? orderId;
  int? isAccepted;

  Offer(
      {this.id,
        this.driverId,
        this.customerId,
        this.title,
        this.description,
        this.price,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.orderId,
        this.isAccepted});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    customerId = json['customer_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderId = json['order_id'];
    isAccepted = json['is_accepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driver_id'] = driverId;
    data['customer_id'] = customerId;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_id'] = orderId;
    data['is_accepted'] = isAccepted;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String ? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}


