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
  int ?acceptedOfferId;
  String? code;
  double? fromLat;
  double? fromLng;
  double? toLat;
  double? toLng;
  String? priceFrom;
  String? priceTo;
  String? price;
  String? status;
  String? statusPaid;
  String? paymentType;
  String? notes;
  Driver? driver;
  Customer? customer;
  String? createdAt;
  List<Offer>? offers;
  TruckSize ?truckSize;
  TruckType ?truckType;
  String ? typeService;

  OrderDataModel({
    this.id,
    this.code,
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
    this.driver,
    this.customer,
    this.createdAt,
    this.offers,
    this.truckSize,
    this.truckType,
    this.acceptedOfferId,
    this.typeService
  });

  OrderDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
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
    acceptedOfferId = json['accepted_offer_id'];
    typeService = json['type_service'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
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
    if (json['truckSize'] != null) {
      truckSize = TruckSize.fromJson(json['truckSize']);
    }
    if (json['truckType'] != null) {
      truckType = TruckType.fromJson(json['truckType']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
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
    data['accepted_offer_id'] = acceptedOfferId;
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
}

class Offer {
  int? id;
  String? price;
  int? driverId;
  Offer({this.id, this.price,this.driverId});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    driverId = json['driver_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    return data;
  }
}

class Driver {
  int? id;
  String? name;

  Driver({this.id, this.name});

  Driver.fromJson(Map<String, dynamic> json) {
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

class Customer {
  int? id;
  String? name;

  Customer({this.id, this.name});

  Customer.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? first;
  String? last;
  String? prev;
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

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

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
