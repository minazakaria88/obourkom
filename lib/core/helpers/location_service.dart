import 'package:dio/dio.dart';

class LocationService {
  static final String baseUrl = 'https://maps.googleapis.com/';
  static final String placeAutocompleteUrl = 'maps/api/place/autocomplete/json';
  static final String placeDetailsUrl = 'maps/api/place/details/json';
  static final String key = 'AIzaSyAhbj8Bq2YKX0PQsb_0LmVtSGO6Q6NayDE';
  static Dio? dio;
  static init() {
    dio = Dio();
    dio
      ?..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.sendTimeout = const Duration(seconds: 30)
      ..options.receiveDataWhenStatusError = true;
  }

  Future<Response> getData({
    required String url,
    dynamic queryParameters,
  }) async {
    return await dio!.get(url, queryParameters: queryParameters);
  }
}
