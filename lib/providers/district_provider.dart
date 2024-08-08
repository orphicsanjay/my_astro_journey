import 'package:astrology/models/address/district.dart';
import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:astrology/network/http_service.dart';
import 'package:flutter/cupertino.dart';

class DistrictProvider with ChangeNotifier {
  final HttpService _httpService;

  DistrictProvider(this._httpService);

  List<District>? _districtList;
  List<District>? get districtList => _districtList;

  int? _currentPage;
  int? get currentPage => _currentPage;

  int? _totalPages;
  int? get totalPages => _totalPages;

  bool _isFetchingMoreDistricts = false;
  bool get isFetchingMOreDistricts => _isFetchingMoreDistricts;

  updateFetchingDistricts(bool value) {
    _isFetchingMoreDistricts = value;
    notifyListeners();
  }

  fetchDistrictList() async {
    final ApiResponse? apiResponse = await _httpService.getData(districtUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _districtList = [];
      for (var item in tempList) {
        // _countryList!.add(Country.fromJson(item));
        _districtList!.add(District.fromJson(item));
        print("items : ${item['country_name']}");
      }
      _currentPage = 1;
      _totalPages = apiResponse.data['total_pages'];
      notifyListeners();
    }
  }

  fetchMoreDistrictList() async {
    updateFetchingDistricts(true);
    String url = districtUrl;
    if (_currentPage != null) {
      url = "$url?page=$_currentPage&page_size=10";
    }
    final ApiResponse? apiResponse = await _httpService.getData(url);

    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      for (var item in tempList) {
        _districtList!.add(District.fromJson(item));
      }
      _currentPage = _currentPage! + 1;
    }
    notifyListeners();
    updateFetchingDistricts(true);
  }
}
