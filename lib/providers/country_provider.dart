import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/address/country.dart';
import 'package:astrology/utils/endpoints.dart';
import 'package:astrology/utils/http_service.dart';
import 'package:flutter/foundation.dart';

class CountryProvider with ChangeNotifier {
  final HttpService _httpService = HttpService();

  // ignore: prefer_final_fields
  List<Country>? _countryList;
  List<Country>? get countryList => _countryList;

  Country? _selectedCountry;
  Country? get selectedCountry => _selectedCountry;

  updateSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  fetchCountryList() async {
    final ApiResponse? apiResponse = await _httpService.getData(countriesUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _countryList = [];
      for (var item in tempList) {
        _countryList!.add(Country.fromJson(item));
        print("items : ${item['country_name']}");
        if (item['country_name'] == "NEPAL") {
          _selectedCountry = Country.fromJson(item);
        }
      }
      notifyListeners();
      print("selected : ${_selectedCountry!.countryCode}");
    }
  }
}
