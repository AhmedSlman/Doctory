import 'package:dio/dio.dart';
import 'package:doctory/core/dataSource/local/cache.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[''] = CacheHelpers().getData(key: '') != null
        ? "${CacheHelpers().getData(key: "")}"
        : null;
    super.onRequest(options, handler);
  }
}
