class SliderModel {
  List<SliderData>? data;
  Meta? meta;

  SliderModel({this.data, this.meta});

  SliderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SliderData>[];
      json['data'].forEach((v) {
        data!.add(SliderData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class SliderData {
  int? id;
  String? link;
  int? userId;
  int? pageId;
  String? paragraph;
  String? image;

  SliderData({
    this.id,
    this.link,
    this.userId,
    this.pageId,
    this.paragraph,
    this.image,
  });

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    userId = json['user_id'];
    pageId = json['page_id'];
    paragraph = json['paragraph'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['link'] = link;
    data['user_id'] = userId;
    data['page_id'] = pageId;
    data['paragraph'] = paragraph;
    data['image'] = image;
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
