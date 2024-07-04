import 'dart:async';

import 'package:astrology/models/api_response.dart';
import 'package:astrology/utils/endpoints.dart';
import 'package:astrology/utils/http_service.dart';
import 'package:flutter/foundation.dart';

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

  Future<bool> verifyOTP(Map<String, dynamic> data) async {
    Completer<bool> completer = Completer<bool>();
    updateVerifyingOtp(true);
    final ApiResponse? apiResponse =
        await _httpService.postData(verifyOTPUrl, data);
    if (apiResponse!.statusCode == 200) {
      completer.complete(true);
    } else {
      completer.complete(false);
    }
    print("verify response : ${apiResponse.data}");
    return completer.future;
  }
}
