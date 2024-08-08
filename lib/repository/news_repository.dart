import 'package:dio/dio.dart';

class NewsRepository {
  final Dio _dio;

  NewsRepository({required Dio dio}) : _dio = dio;
}
