import 'package:astrology/models/user/gender.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class GenderRepository {
  final Dio _dio;

  GenderRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseStatus<List<Gender>>> fetchCountries() async* {
    List<Gender>? genders;

    try {
      final response = await _dio.get(genderUrl);
      genders = (response.data as List<dynamic>).map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Gender(map[0] as String, map[1] as String);
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
