import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
      if (kDebugMode) PrettyDioLogger(requestBody: true, requestHeader: true),
    ]);
  }

  static void addHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
    };
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
