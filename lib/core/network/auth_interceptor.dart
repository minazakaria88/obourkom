import 'package:dio/dio.dart';

import '../storage/cache_helper.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ${CacheHelper.getData(key: CacheHelperKeys.token)}';
    options.headers['lang'] = CacheHelper.getData(key: CacheHelperKeys.lang);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //Todo logout
    }
    super.onError(err, handler);
  }
}
