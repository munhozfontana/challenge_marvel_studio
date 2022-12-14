import 'dart:convert';

import 'package:dio/dio.dart';

import 'interfaces/i_http_adapter.dart';

class HttpAdapter implements IHttpAdapter {
  Dio dio = Dio();

  @override
  Future<HttpResponse> deleteHttp(
    String? url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final libResponse = await dio.delete(
      url!,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );

    return _mackObj(libResponse);
  }

  @override
  Future<HttpResponse> getHttp(
    String? url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final libResponse = await dio.get(
      url!,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );

    return _mackObj(libResponse);
  }

  @override
  Future<HttpResponse> postHttp(
    String? url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final libResponse = await dio.post(
      url!,
      data: body,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );

    return _mackObj(libResponse);
  }

  @override
  Future<HttpResponse> putHttp(
    String? url, {
    Map<String, dynamic>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final libResponse = await dio.put(
      url!,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );

    return _mackObj(libResponse);
  }
}

HttpResponse _mackObj(Response response) {
  return HttpResponse(
    statusCode: response.statusCode,
    body: jsonEncode(response.data),
    header: response.requestOptions.headers,
  );
}
