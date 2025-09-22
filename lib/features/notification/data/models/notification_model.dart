class NotificationModel {
  List<DataNotificationModel>? data;

  NotificationModel({this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataNotificationModel>[];
      json['data'].forEach((v) {
        data!.add(DataNotificationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataNotificationModel {
  String? id;
  String? image;
  String? name;
  String? body;
  NotificationData? data;
  bool? isRead;
  String? tab;
  String? createdAt;
  String? createdAtFormated;
  Links? links;
  String? readAt;
  String? readAtFormated;

  DataNotificationModel({
    this.id,
    this.image,
    this.name,
    this.body,
    this.data,
    this.isRead,
    this.tab,
    this.createdAt,
    this.createdAtFormated,
    this.links,
    this.readAt,
    this.readAtFormated,
  });

  DataNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    body = json['body'];
    data = json['data'] != null
        ? NotificationData.fromJson(json['data'])
        : null;
    isRead = json['is_read'];
    tab = json['tab'];
    createdAt = json['created_at'];
    createdAtFormated = json['created_at_formated'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    readAt = json['read_at'];
    readAtFormated = json['read_at_formated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['body'] = body;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['is_read'] = isRead;
    data['tab'] = tab;
    data['created_at'] = createdAt;
    data['created_at_formated'] = createdAtFormated;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['read_at'] = readAt;
    data['read_at_formated'] = readAtFormated;
    return data;
  }
}

class NotificationData {
  String? title;
  String? body;
  String? createdBy;

  NotificationData({this.title, this.body, this.createdBy});

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['created_by'] = createdBy;
    return data;
  }
}

class Links {
  String? delete;

  Links({this.delete});

  Links.fromJson(Map<String, dynamic> json) {
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delete'] = delete;
    return data;
  }
}
