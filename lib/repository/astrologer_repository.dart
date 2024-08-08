import 'package:dio/dio.dart';

class AstrologerRepository {
  final Dio _dio;

  AstrologerRepository({required Dio dio}) : _dio = dio;
}
