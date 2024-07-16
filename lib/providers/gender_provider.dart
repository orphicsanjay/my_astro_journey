import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:astrology/utils/endpoints.dart';
import 'package:astrology/utils/http_service.dart';
import 'package:flutter/foundation.dart';

class GenderProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  List<Gender> _genderList = [];
  List<Gender> get genderList => _genderList;

  fetchGenderList() async {
    final ApiResponse? apiResponse = await _httpService.getData(genderUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['gender_options'] as List;
      _genderList = [];
      if (tempList.isNotEmpty) {
        for (var item in tempList) {
          _genderList.add(Gender(item[0], item[1]));
        }
      }

      notifyListeners();
      for (var gender in _genderList) {
        print('Key: ${gender.key}, Value: ${gender.value}');
      }
    }
  }
}
