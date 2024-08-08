import 'package:astrology/models/services/app_service.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class AppServiceRepository {
  final Dio _dio;

  AppServiceRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseStatus<List<AppService>>> fetchAppServices() async* {
    List<AppService>? appServices;
    try {
      final response = await _dio.get(appServiceUrl);
      appServices =
          (response.data['data'] as List<dynamic>).map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return AppService.fromJson(map);
      }).toList();

      yield ApiResponseStatus(
        isSuccessful: true,
        data: appServices,
        error: null,
        // fromLocal: false,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: appServices,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: appServices,
        error: e.toString(),
      );
    }
  }
}
