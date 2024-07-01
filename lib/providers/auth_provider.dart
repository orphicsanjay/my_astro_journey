import 'package:astrology/utils/http_service.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  login() {
    _httpService.postData("login", {});
  }
}
