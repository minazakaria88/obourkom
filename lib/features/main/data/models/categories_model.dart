class CategoriesModel {
  List<CategoryModel>? data;
  Links? links;
  Meta? meta;

  CategoriesModel({this.data, this.links, this.meta});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryModel>[];
      json['data'].forEach((v) {
        data!.add(CategoryModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }


}

class CategoryModel {
  int? id;
  String? name;
  String? image;
  List<TruckModel>? trucks;

  CategoryModel({this.id, this.name, this.image, this.trucks});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['trucks'] != null) {
      trucks = <TruckModel>[];
      json['trucks'].forEach((v) {
        trucks!.add(TruckModel.fromJson(v));
      });
    }
  }


}

class TruckModel
{
  int ? id;
  String ? name;
  String ? image;

  TruckModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}



class Links {
  String? first;
  Null last;
  Null prev;
  Null next;

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
  String? path;
  int? perPage;
  int? to;

  Meta({this.currentPage, this.from, this.path, this.perPage, this.to});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    return data;
  }
}