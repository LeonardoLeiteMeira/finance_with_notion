import 'package:dio/dio.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:injectable/injectable.dart';

import 'dio_interceptors.dart';

@Injectable(as: HttpRequest)
class DioImpl implements HttpRequest {
  final Dio _dio;
  final DioInterceptors _dioInterceptors;

  DioImpl()
      : _dio = Dio(),
        _dioInterceptors = DioInterceptors() {
    _configureInterceptors();
  }

  void _configureInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
        onError: _dioInterceptors.onError,
        onRequest: _dioInterceptors.onRequest,
        onResponse: _dioInterceptors.onResponse));
  }

  @override
  void setHeader(Map<String, String> hearder) {
    _dio.options.headers = hearder;
  }

  @override
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  Future<dynamic> delete(String url, {Map<String, dynamic>? body}) async =>
      _dio.delete(url, data: body);

  @override
  Future<dynamic> get(String url) async => _dio.get(url);

  @override
  Future<dynamic> patch(String url, {Map<String, dynamic>? body}) async =>
      _dio.patch(url, data: body);

  @override
  Future<dynamic> post(String url, {Map<String, dynamic>? body}) async =>
      _dio.post(url, data: body);

  @override
  Future<dynamic> put(String url, {Map<String, dynamic>? body}) async =>
      _dio.put(url, data: body);
}
