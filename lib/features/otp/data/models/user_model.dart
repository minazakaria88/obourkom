class UserModel {
  User? user;
  String? token;
  String? message;

  UserModel({this.user, this.token, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? avatar;
  String? localedType;
  String? createdAt;
  String? createdAtFormatted;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.avatar,
    this.localedType,
    this.createdAt,
    this.createdAtFormatted,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    avatar = json['avatar'];
    localedType = json['localed_type'];
    createdAt = json['created_at'];
    createdAtFormatted = json['created_at_formatted'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['type'] = type;
    data['avatar'] = avatar;
    data['localed_type'] = localedType;
    data['created_at'] = createdAt;
    data['created_at_formatted'] = createdAtFormatted;
    return data;
  }
}
