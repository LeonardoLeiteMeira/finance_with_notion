abstract class HttpRequest {
  void setBaseUrl(String baseUrl);
  void setHeader(Map<String, String> hearder);
  void setJsonBody(Map<String, dynamic> body);
  void configureInterceptors();

  dynamic get();
  dynamic put();
  dynamic post();
  dynamic delete();
  dynamic path();
}
