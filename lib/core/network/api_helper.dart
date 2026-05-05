import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'auth_interceptor.dart';
import 'end_point.dart';
import 'failure.dart';

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
    dio?.interceptors.addAll([
      AuthInterceptor(),
      if (kDebugMode) LogInterceptor(requestBody: true, requestHeader: true),
    ]);
  }

  static void addHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
    };
  }

  // void setTokenIntoHeadersAfterLogin(String token) {
  //   dio?.options.headers['Authorization'] = 'Bearer $token';
  // }

  void setLanguageIntoHeaders(String lang) {
    dio?.options.headers['lang'] = lang;
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio!.get(url, queryParameters: queryParameters);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<Response> postData({required String url, dynamic data}) async {
    try {
      return await dio!.post(url, data: data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<Response> putData({required String url, dynamic data}) async {
    try {
      return await dio!.put(url, data: data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<Response> deleteData({required String url}) async {
    try {
      return await dio!.delete(url);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
