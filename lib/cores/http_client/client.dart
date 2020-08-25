import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class HttpClient {
  Dio _dio;

  HttpClient({
    String baseUrl,
    HttpClientAdapter adapter
  }) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json"
    );

    this._dio = Dio(options);

    if (adapter != null) {
      this._dio.httpClientAdapter = adapter;
    }

    this.interceptors();
  }

  void interceptors() {
    this._dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        debugPrint("[DIO DEBUG] Request : { baseUrl: ${options.baseUrl}, path: ${options.path}, method: ${options.method}, contentType: ${options.contentType}, headers: ${options.headers}, queryParams: ${options.queryParameters}, data: ${options.data} }");

        return options;
      },
      onResponse: (Response response) {
        debugPrint("[DIO DEBUG] Response : $response");
        return response;
      },
      onError: (DioError error) async {
        if(error.response?.data != null){
          debugPrint("[DIO DEBUG] Error Response : ${error.response.data}");
        }
        debugPrint("[DIO DEBUG] Error Response : ${error.response.data}");

        return error;
      }
    ));
  }

  Future<dynamic> request({
    @required String method,
    @required String path,
    dynamic data,
    Map<String, dynamic> queryParams,
    Map<String, dynamic> additionalHeaders
  }) async {
    Options options = Options(
      method: method,
      headers: additionalHeaders
    );

    Response response = await this._dio.request(path, data: data, queryParameters: queryParams, options: options);

    return response;
  }
}