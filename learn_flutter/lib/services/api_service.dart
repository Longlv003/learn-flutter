import 'package:dio/dio.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:3000",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      return await _dio.get(path, queryParameters: query);
    } catch (e) {
      throw Exception("GET request failed");
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      throw Exception("POST request failed");
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      throw Exception("PUT request failed");
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } catch (e) {
      throw Exception("DELETE request failed");
    }
  }
}
