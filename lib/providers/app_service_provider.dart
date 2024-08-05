import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/models/services/app_service.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:astrology/network/http_service.dart';
import 'package:flutter/foundation.dart';

class AppServicesProvider with ChangeNotifier {
  final HttpService _httpService;

  AppServicesProvider(this._httpService);

  List<AppService>? _appServiceList;
  List<AppService>? get appServiceList => _appServiceList;

  int? _currentPage;
  int? get currentPage => _currentPage;

  int? _totalPages;
  int? get totalPages => _totalPages;

  bool _isFetchingMoreAppService = false;
  bool get isFetchingMOreAppService => _isFetchingMoreAppService;

  updateFetchingAppService(bool value) {
    _isFetchingMoreAppService = value;
    notifyListeners();
  }

  fetchAppServiceList() async {
    final ApiResponse? apiResponse = await _httpService.getData(appServiceUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _appServiceList = [];
      for (var item in tempList) {
        _appServiceList!.add(AppService.fromJson(item));
      }
      _currentPage = 1;
      _totalPages = apiResponse.data['total_pages'];
    }

    notifyListeners();
  }

  fetchMoreAppServiceList() async {
    updateFetchingAppService(true);
    String url = bannerUrl;
    if (_currentPage != null) {
      url = "$url?page=$_currentPage&page_size=10";
    }
    final ApiResponse? apiResponse = await _httpService.getData(url);

    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      for (var item in tempList) {
        _appServiceList!.add(AppService.fromJson(item));
      }
      _currentPage = _currentPage! + 1;
    }
    notifyListeners();
    updateFetchingAppService(true);
  }
}
