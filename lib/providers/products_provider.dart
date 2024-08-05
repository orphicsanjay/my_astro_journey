import 'package:astrology/models/product/product_category.dart';
import 'package:astrology/models/product/products.dart';
import 'package:astrology/models/response/api_response.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:astrology/network/http_service.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  final HttpService _httpService;

  ProductsProvider(this._httpService);

  List<ProductCategory>? _productCategoryList;
  List<ProductCategory>? get productCategoryList => _productCategoryList;

  fetchProductCategoryList() async {
    final ApiResponse? apiResponse =
        await _httpService.getData(productCategoriesListUrl);
    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _productCategoryList = [];
      for (var item in tempList) {
        _productCategoryList!.add(ProductCategory.fromJson(item));
      }
      notifyListeners();
    }
  }

  List<Products>? _productsList;
  List<Products>? get productsList => _productsList;

  int? _currentPage;
  int? get currentPage => _currentPage;

  int? _totalPages;
  int? get totalPages => _totalPages;

  bool _isFetchingMoreProducts = false;
  bool get isFetchingMOreProducts => _isFetchingMoreProducts;

  updateFetchingProducts(bool value) {
    _isFetchingMoreProducts = value;
    notifyListeners();
  }

  fetchProductsList(int? categoryId) async {
    String url = productsListsUrl;
    if (_currentPage != null) {
      url = "$url?page=1&page_size=10";
    }
    if (categoryId != null) {
      url = "$url/category=$categoryId";
    }
    print("product url : $url");
    final ApiResponse? apiResponse = await _httpService.getData(url);
    print("Status : ${apiResponse!.statusCode}");
    if (apiResponse.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      _productsList = [];
      for (var item in tempList) {
        _productsList!.add(Products.fromJson(item));
      }
      _currentPage = 1;
      _totalPages = apiResponse.data['total_pages'];
    }
    notifyListeners();
    print("Status : ${apiResponse.statusCode}");
  }

  fetchMoreProductsList(int? categoryId) async {
    updateFetchingProducts(true);
    String url = productsListsUrl;
    if (_currentPage != null) {
      url = "$url?page=$_currentPage&page_size=10";
    }

    if (categoryId != null) {
      url = "$url/?category=$categoryId";
    }

    final ApiResponse? apiResponse = await _httpService.getData(url);

    if (apiResponse!.statusCode == 200) {
      final tempList = apiResponse.data!['data'] as List;
      for (var item in tempList) {
        _productsList!.add(Products.fromJson(item));
      }
      _currentPage = _currentPage! + 1;
    }
    notifyListeners();
    updateFetchingProducts(true);
  }

  Products? _currentProduct;
  Products? get currentProduct => _currentProduct;

  fetchProductDetail(int? productId) async {
    final ApiResponse? apiResponse =
        await _httpService.getData(productsDetailUrl);
    if (apiResponse!.statusCode == 200) {
      _currentProduct = Products.fromJson(apiResponse.data!['data']);
      notifyListeners();
    }
  }
}
