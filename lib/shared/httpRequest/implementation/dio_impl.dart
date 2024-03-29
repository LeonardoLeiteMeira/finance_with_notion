import 'package:dio/dio.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:finance_with_notion/shared/httpRequest/implementation/my_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptors.dart';

@Injectable(as: HttpRequest)
class DioImpl implements HttpRequest {
  final Dio _dio;
  final DioInterceptors _dioInterceptors;

  DioImpl()
      : _dio = Dio(),
        _dioInterceptors = DioInterceptors() {
    _configureInterceptors();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
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
  Future<MyResponse> delete(String url, {Map<String, dynamic>? body}) async =>
      _dio
          .delete(url, data: body)
          .then((response) => MyResponse.fromDioResponse(response));

  @override
  Future<MyResponse> get(String url) async =>
      _dio.get(url).then((response) => MyResponse.fromDioResponse(response));

  @override
  Future<MyResponse> patch(String url, {Map<String, dynamic>? body}) async =>
      _dio
          .patch(url, data: body)
          .then((response) => MyResponse.fromDioResponse(response));

  @override
  Future<MyResponse> post(String url, {Map<String, dynamic>? body}) async =>
      _dio
          .post(url, data: body)
          .then((response) => MyResponse.fromDioResponse(response));

  @override
  Future<MyResponse> put(String url, {Map<String, dynamic>? body}) async => _dio
      .put(url, data: body)
      .then((response) => MyResponse.fromDioResponse(response));
}
