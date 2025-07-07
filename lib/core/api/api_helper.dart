import 'package:dio/dio.dart';
import '../helpers/cache_helper.dart';
import 'end_point.dart';

class ApiHelper {
  static Dio? dio;

  static init() {
    const Duration timeoutDuration = Duration(seconds: 30);
    dio = Dio();
    dio
      ?..options.baseUrl = EndPoints.baseUrl
      ..options.connectTimeout = timeoutDuration
      ..options.receiveTimeout = timeoutDuration
      ..options.sendTimeout = timeoutDuration
      ..options.receiveDataWhenStatusError = true;
    addHeaders();
  }

  static void addHeaders()async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await CacheHelper.getSecureString(CacheHelperKeys.token)}',
    };

  }

  void setTokenIntoHeadersAfterLogin(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  void setLanguageIntoHeaders(String lang) {
    dio?.options.headers['lang'] = lang;
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!.get(url, queryParameters: queryParameters);
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(url, data: data);
  }

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.put(url, data: data);
  }

  Future<Response> deleteData({required String url}) async {
    return await dio!.delete(url);
  }
}
