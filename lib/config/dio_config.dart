import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://188.166.9.195:8081/api',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ),
);
