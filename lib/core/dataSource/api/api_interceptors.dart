import 'package:dio/dio.dart';
import 'package:doctory/core/dataSource/local/cache.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[''] = CacheHelper().getData(key: '') != null
        ? "${CacheHelper().getData(key: "")}"
        : null;
    super.onRequest(options, handler);
  }
}
