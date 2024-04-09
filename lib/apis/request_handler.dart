import 'dart:convert';
import 'package:flutterstates/apis/exceptions.dart';
import 'package:http/http.dart' as http;

class RequestHandler {
  RequestHandler();

  final String _baseUrl = 'rickandmortyapi.com';

  Future<http.Response> get(
    String api, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri uri = _getUri(api, queryParameters);

    try {
      await _checkConnectivity();

      http.Response response = await http.get(uri);

      return ResponseHandler.handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<http.Response> post(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
    String? encodedRequestBody,
  }) async {
    Uri uri = _getUri(api, queryParameters);

    try {
      await _checkConnectivity();

      http.Response response = await http.post(
        uri,
        body: encodedRequestBody ?? json.encode(requestBody),
        headers: _getHeaders(),
      );

      return ResponseHandler.handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<http.Response> multipartPost(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? formFields,
    List<http.MultipartFile>? files,
  }) async {
    Uri uri = _getUri(api, queryParameters);

    http.MultipartRequest request = http.MultipartRequest('POST', uri);

    if (formFields != null) {
      request.fields.addAll(formFields);
    }

    if (files != null) {
      request.files.addAll(files);
    }

    try {
      await _checkConnectivity();

      http.Response response = await http.Response.fromStream(
        await request.send(),
      );

      return ResponseHandler.handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<http.Response> put(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  }) async {
    Uri uri = _getUri(api, queryParameters);

    try {
      await _checkConnectivity();

      http.Response response = await http.put(
        uri,
        body: json.encode(requestBody),
        headers: _getHeaders(),
      );

      return ResponseHandler.handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  Future<http.Response> delete(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? requestBody,
  }) async {
    Uri uri = _getUri(api, queryParameters);

    try {
      await _checkConnectivity();

      http.Response response = await http.delete(
        uri,
        body: json.encode(requestBody),
        headers: _getHeaders(),
      );

      return ResponseHandler.handleResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  Map<String, String> _getHeaders() {
    return {'content-type': 'application/json'};
  }

  Uri _getUri(
    String api,
    Map<String, dynamic>? queryParameters,
  ) {
    return Uri.https(_baseUrl, api, queryParameters);
  }

  Future<void> _checkConnectivity() async {
    // List<ConnectivityResult> connectivity =
    //     await Connectivity().checkConnectivity();

    // if (connectivity.isEmpty) {
    //   throw NetworkErrorException(
    //     'Error in the APIs RequestHandler. Reason: There is no network connection.',
    //   );
    // }
  }
}

class ResponseHandler {
  static http.Response handleResponse(http.Response response) {
    String exception =
        'Error in one of the APIs. Response body: ${response.body}. Status code: ${response.statusCode}.';

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return response;
      case 400:
        throw ServerErrorException(exception);
      case 404 || 401:
        throw NotFoundException(exception);
      case 409:
        throw AlreadyExistsException(exception);
      case 500:
        throw ServerErrorException(exception);
      default:
        throw UnknownException(exception);
    }
  }
}
