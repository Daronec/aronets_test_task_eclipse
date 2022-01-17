import 'package:aronets_test_task_eclipse/constants/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  DioClient() {
    initialSettings();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  );

  void initialSettings() async {
    Interceptors interceptors = dio.interceptors;
    interceptors.clear();
    if (kDebugMode) {
      interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
    }
  }
}