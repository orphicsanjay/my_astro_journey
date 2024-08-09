import 'package:astrology/models/user/gender.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class GenderRepository {
  final Dio _dio;

  GenderRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseStatus<List<Gender>>> fetchGenders() async* {
    List<Gender>? genders;

    try {
      final response = await _dio.get(genderUrl);
      final responseData = response.data as Map<String, dynamic>;
      final data = responseData['gender_options'] as List<dynamic>;
      genders = data.map((dynamic json) {
        final list = json as List<dynamic>;
        return Gender(list[0] as String, list[1] as String);
      }).toList();
      yield ApiResponseStatus(
        isSuccessful: true,
        data: genders,
        error: null,
        // fromLocal: false,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: genders,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: genders,
        error: e.toString(),
      );
    }
  }
}
