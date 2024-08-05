import 'package:astrology/models/banner/banners.dart';
import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:astrology/network/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BannerProvider with ChangeNotifier {
  final HttpService _httpService;

  BannerProvider(this._httpService);

  List<Banners>? _bannerList;
  List<Banners>? get bannerList => _bannerList;

  int? _currentPage;
  int? get currentPage => _currentPage;

  int? _totalPages;
  int? get totalPages => _totalPages;

  bool _isFetchingMoreBanners = false;
  bool get isFetchingMOreBanners => _isFetchingMoreBanners;

  updateFetchingBanners(bool value) {
    _isFetchingMoreBanners = value;
    notifyListeners();
  }

  fetchBannerList() async {
    final ApiResponse? apiResponse = await _httpService.getData(bannerUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _bannerList = [];
      for (var item in tempList) {
        _bannerList!.add(Banners.fromJson(item));
      }
      _currentPage = 1;
      _totalPages = apiResponse.data['total_pages'];
    }

    notifyListeners();
  }

  fetchMoreBannerList() async {
    updateFetchingBanners(true);
    String url = bannerUrl;
    if (_currentPage != null) {
      url = "$url?page=$_currentPage&page_size=10";
    }
    final ApiResponse? apiResponse = await _httpService.getData(url);

    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      for (var item in tempList) {
        _bannerList!.add(Banners.fromJson(item));
      }
      _currentPage = _currentPage! + 1;
    }
    notifyListeners();
    updateFetchingBanners(true);
  }
}
