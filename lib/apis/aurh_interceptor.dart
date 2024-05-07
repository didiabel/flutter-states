import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String apiKey;
  String _token = '';
  final Future<Response> Function(RequestOptions) _refreshToken;

  AuthInterceptor(this.apiKey, this._refreshToken);

  void setToken(String token) {
    _token = token;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({'content-type': 'application/json'});
    options.headers.addAll({'x-api-key': apiKey});
    if (_token.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $_token'});
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != 'auth/refresh-token') {
      try {
        final response = await _refreshToken(err.requestOptions);
        return handler.resolve(response);
      } catch (err) {
        print('Refresh Token Failed: ${err.toString()}');
      }
    }
    return handler.next(err);
  }
}
