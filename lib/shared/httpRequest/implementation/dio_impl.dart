import 'package:dio/dio.dart';
import 'package:finance_with_notion/shared/httpRequest/http_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioImpl implements HttpRequest {
  final Dio _dio = Dio();

  DioImpl();

  @override
  void configureInterceptors() {
    // TODO: implement configureInterceptors
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  path() {
    // TODO: implement path
    throw UnimplementedError();
  }

  @override
  post() {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  void setBaseUrl(String baseUrl) {
    // TODO: implement setBaseUrl
  }

  @override
  void setHeader(Map<String, String> hearder) {
    // TODO: implement setHeader
  }

  @override
  void setJsonBody(Map<String, dynamic> body) {
    // TODO: implement setJsonBody
  }
}
