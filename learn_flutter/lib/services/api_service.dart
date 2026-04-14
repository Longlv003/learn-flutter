import 'package:dio/dio.dart';
import 'package:learn_flutter/configs/system.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  late final Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: URL.getBaseURL(),
        connectTimeout: const Duration(milliseconds: System.connectionTimeout),
        receiveTimeout: const Duration(milliseconds: System.receiveTimeout),
        headers: System.header(),
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
