import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://app.example.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ),
);
