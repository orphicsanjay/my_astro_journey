import 'package:astrology/models/services/app_service.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository({required Dio dio}) : _dio = dio;

  // Stream<ApiResponseStatus<List<AppService>>> fetchAppServices() async* {
  //   List<AppService>? appServices;
  //   try {
  //     final response = await _dio.get(appServiceUrl);
  //     appServices =
  //         (response.data['data'] as List<dynamic>).map((dynamic json) {
  //       final map = json as Map<String, dynamic>;
  //       return AppService.fromJson(map);
  //     }).toList();

  //     yield ApiResponseStatus(
  //       isSuccessful: true,
  //       data: appServices,
  //       error: null,
  //       // fromLocal: false,
  //     );
  //   } on DioException catch (error) {
  //     yield ApiResponseStatus(
  //       isSuccessful: false,
  //       data: appServices,
  //       error: error.message,
  //     );
  //   } catch (e) {
  //     yield ApiResponseStatus(
  //       isSuccessful: false,
  //       data: appServices,
  //       error: e.toString(),
  //     );
  //   }
  // }
}



//  requestOTP(Map<String, dynamic> data) async {
//     final ApiResponse? apiResponse =
//         await _httpService.postData(requestOTPUrl, data);
//     print("response : ${apiResponse!.data}");
//     // if (apiResponse.statusCode == 201) {
//     //   _otpCode = apiResponse.data['otp_code'];
//     //   notifyListeners();
//     // }
//   }

//   Future<OTPResponse> verifyOTP(Map<String, dynamic> data) async {
//     Completer<OTPResponse> completer = Completer<OTPResponse>();
//     OTPResponse? otpResponse;
//     updateVerifyingOtp(true);
//     final ApiResponse? apiResponse =
//         await _httpService.postData(verifyOTPUrl, data);
//     if (apiResponse!.statusCode == 200 || apiResponse.statusCode == 201) {
//       otpResponse = OTPResponse.fromJson(apiResponse.data);
//       completer.complete(otpResponse);
//     } else {
//       otpResponse = OTPResponse(apiResponse.data['message'], null, null);
//     }
//     print("verify response : ${apiResponse.data}");
//     return completer.future;
//   }