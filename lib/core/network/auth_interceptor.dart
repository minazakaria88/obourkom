import 'package:dio/dio.dart';

import '../storage/cache_helper.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: CacheHelperKeys.token)}';
    super.onRequest(options, handler);
  }
}
