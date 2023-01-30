import 'package:dio/dio.dart';

class MyResponse<T> extends Response {
  MyResponse.fromDioResponse(Response response)
      : super(
          data: response.data,
          headers: response.headers,
          requestOptions: response.requestOptions,
          isRedirect: response.isRedirect,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          redirects: response.redirects,
          extra: response.extra,
        );
}
