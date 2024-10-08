import 'package:dio/dio.dart';
import 'api_consumer.dart';
import 'package:doctory/core/error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = "https://doctory.orbitdimension.online/api/";
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
