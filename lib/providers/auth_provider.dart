import 'dart:async';

import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/models/otp/otp_response.dart';
import 'package:astrology/utils/endpoints.dart';
import 'package:astrology/utils/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  String? _otpCode;
  String? get otpCode => _otpCode;

  bool _isVerifyingOtp = false;
  bool get isVerifyingOtp => _isVerifyingOtp;

  updateVerifyingOtp(bool value) {
    _isVerifyingOtp = value;
    notifyListeners();
  }

  requestOTP(Map<String, dynamic> data) async {
    final ApiResponse? apiResponse =
        await _httpService.postData(requestOTPUrl, data);
    print("response : ${apiResponse!.data}");
    // if (apiResponse.statusCode == 201) {
    //   _otpCode = apiResponse.data['otp_code'];
    //   notifyListeners();
    // }
  }

  Future<OTPResponse> verifyOTP(Map<String, dynamic> data) async {
    Completer<OTPResponse> completer = Completer<OTPResponse>();
    OTPResponse? otpResponse;
    updateVerifyingOtp(true);
    final ApiResponse? apiResponse =
        await _httpService.postData(verifyOTPUrl, data);
    if (apiResponse!.statusCode == 200 || apiResponse.statusCode == 201) {
      otpResponse = OTPResponse.fromJson(apiResponse.data);
      completer.complete(otpResponse);
    } else {
      otpResponse = OTPResponse(apiResponse.data['message'], null, null);
    }
    print("verify response : ${apiResponse.data}");
    return completer.future;
  }
}
