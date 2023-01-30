import 'implementation/my_response_model.dart';

abstract class HttpRequest {
  void setBaseUrl(String baseUrl);
  void setHeader(Map<String, String> hearder);

  Future<MyResponse> get(String url);
  Future<MyResponse> put(String url, {Map<String, dynamic>? body});
  Future<MyResponse> post(String url, {Map<String, dynamic>? body});
  Future<MyResponse> delete(String url, {Map<String, dynamic>? body});
  Future<MyResponse> patch(String url, {Map<String, dynamic>? body});
}
