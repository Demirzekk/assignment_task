import 'package:assignment_task/utility/extensions/general_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utility/enums/service_config_enums.dart';

class DioRequest {
  final Dio _dio = Dio();

  Map<String, dynamic> tokenHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  int receiveTimeout = 60000;
  int sendTimeout = 60000;

  updateDioInterceptors(
      {body,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    // final tokenHeaders = await tokenHeader(dio: _dio);
    _dio.options = BaseOptions(
      baseUrl: ServiceConfigEnum.serverUrl.urlToString,
      queryParameters: queryParameters,
      receiveDataWhenStatusError: true,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      validateStatus: (value) {
        debugPrint("Dio validate status: $value");
        return value! <= 500;
      },
      headers: tokenHeaders,
    );
    _dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? false : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, handler) {
            if (e.response?.statusCode == 402) {
              "should logout user and go to login page".log();
            }
            return handler.next(e);
          },
        ),
      );
  }

  // requests
  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(
      {required String endpoint,
      data,
      Map<String, dynamic>? customHeaders,
      Map<String, dynamic>? queryParameters}) async {
    await updateDioInterceptors(
        customHeaders: customHeaders ?? {},
        queryParameters: queryParameters ?? {},
        body: data);
    return await _dio.post(endpoint, data: data);
  }
}
