import 'package:astrology/models/astrologer/astrologer.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class AstrologerRepository {
  final Dio _dio;

  AstrologerRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseStatus<List<Astrologer>>> fetchAstrologersList() async* {
    List<Astrologer>? astrologers;
    try {
      final response = await _dio.get(asatrologersUrl);
      final data = response.data['data'] as List<dynamic>;
      if (data.isNotEmpty) {
        astrologers = data.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return Astrologer.fromJson(map);
        }).toList();
      } else {
        astrologers = [];
      }

      yield ApiResponseStatus(
        isSuccessful: true,
        data: astrologers,
        error: null,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: astrologers,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: astrologers,
        error: e.toString(),
      );
    }
  }

  Stream<ApiResponseStatus<Astrologer>> fetchAstrologerDetail(
      int astrologerId) async* {
    Astrologer? astrologers;
    try {
      final response = await _dio.get("$asatrologersUrl/$astrologerId");
      final data = response.data['data'];
      if (data != null) {
        astrologers = Astrologer.fromJson(data);
      }
      yield ApiResponseStatus(
        isSuccessful: true,
        data: astrologers,
        error: null,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: astrologers,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: astrologers,
        error: e.toString(),
      );
    }
  }
}
