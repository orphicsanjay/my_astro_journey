import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/models/blogs/blogs.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:astrology/network/http_service.dart';
import 'package:flutter/foundation.dart';

class BlogsProvider with ChangeNotifier {
  final HttpService _httpService;

  BlogsProvider(this._httpService);

  List<Blogs>? _blogsList;
  List<Blogs>? get blogsList => _blogsList;

  int? _currentPage;
  int? get currentPage => _currentPage;

  int? _totalPages;
  int? get totalPages => _totalPages;

  bool _isFetchingMoreBlogs = false;
  bool get isFetchingMOreBlogs => _isFetchingMoreBlogs;

  updateFetchingBlogs(bool value) {
    _isFetchingMoreBlogs = value;
    notifyListeners();
  }

  fetchBannerList() async {
    final ApiResponse? apiResponse = await _httpService.getData(blogsUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _blogsList = [];
      for (var item in tempList) {
        _blogsList!.add(Blogs.fromJson(item));
      }
      _currentPage = 1;
      _totalPages = apiResponse.data['total_pages'];
    }

    notifyListeners();
  }

  fetchMoreBannerList() async {
    updateFetchingBlogs(true);
    String url = blogsUrl;
    if (_currentPage != null) {
      url = "$url?page=$_currentPage&page_size=10";
    }
    final ApiResponse? apiResponse = await _httpService.getData(url);

    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      for (var item in tempList) {
        _blogsList!.add(Blogs.fromJson(item));
      }
      _currentPage = _currentPage! + 1;
    }
    notifyListeners();
    updateFetchingBlogs(true);
  }
}
