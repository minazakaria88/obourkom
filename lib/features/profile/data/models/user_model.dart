import 'package:oborkom/features/otp/data/models/user_model.dart';

class CachedUserModel {
  int? id;
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



  factory CachedUserModel.fromUserModel(User userModel) {
    return CachedUserModel(
      name: userModel.name,
      email: userModel.email,
      phone: userModel.phone,
      image: userModel.avatar,
    );
  }
}
