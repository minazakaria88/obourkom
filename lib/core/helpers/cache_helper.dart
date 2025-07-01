import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oborkom/features/profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/otp/data/models/user_model.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage storage;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is List) {
      return await sharedPreferences.setStringList(key, value as List<String>);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static List<String> getListData({required String key}) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> setSecureString(key, value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> getSecureString(key) async {
    return await storage.read(key: key) ?? '';
  }

  static clearData() async {
    await storage.deleteAll();
  }


 static Future<void> saveUser(User model) async {
    await CacheHelper.saveData(key: CacheHelperKeys.name, value: model.name);
    await CacheHelper.saveData(key: CacheHelperKeys.email, value: model.email);
    await CacheHelper.saveData(key: CacheHelperKeys.phone, value: model.phone);
    await CacheHelper.saveData(key: CacheHelperKeys.image, value: model.avatar);
  }


  static Future<CachedUserModel> getUser() async {
    final name = await CacheHelper.getData(key: CacheHelperKeys.name);
    final email = await CacheHelper.getData(key: CacheHelperKeys.email);
    final phone = await CacheHelper.getData(key: CacheHelperKeys.phone);
    final image = await CacheHelper.getData(key: CacheHelperKeys.image);
    return CachedUserModel(
      name: name,
      email: email,
      phone: phone,
      image: image,
    );
  }
}

class CacheHelperKeys {
  static const String token = 'token';
  static const String lang = 'lang';
  static const locationEnabled = 'locationEnabled';
  static const name = 'name';
  static const email = 'email';
  static const phone = 'phone';
  static const image = 'image';
}
