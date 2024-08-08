import 'package:dio/dio.dart';

class BlogsRepository {
  final Dio _dio;

  BlogsRepository({required Dio dio}) : _dio = dio;
}
