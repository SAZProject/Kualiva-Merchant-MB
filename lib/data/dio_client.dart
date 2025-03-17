import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Dio? _dio;

  Future<Dio> dio() async {
    if (_dio != null) return _dio!;

    const String baseUrl = "http://192.168.1.89:3000/api/v1";
    if (baseUrl.isEmpty) {
      throw Exception("Dotenv is not set");
    }

    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: Map.from({
        'Accept': 'application/json',
      }),
    ));

    _dio!.interceptors.add(PrettyDioLogger(
      compact: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      maxWidth: 100,
      enabled: kDebugMode,
    ));

    return _dio!;
  }

  void reset() {
    _dio = null;
  }
}
