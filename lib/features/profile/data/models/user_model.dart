import 'package:oborkom/features/otp/data/models/user_model.dart';

class CachedUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;

  CachedUserModel({this.name, this.email, this.phone, this.image});

  CachedUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  CachedUserModel.fromUserModel(User user) {
    name = user.name;
    email = user.email;
    phone = user.phone;
    image = user.avatar;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if (image != null) {
      data['image'] = image;
    }
    return data;
  }
}
