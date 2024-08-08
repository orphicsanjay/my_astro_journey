import 'package:astrology/models/product/products.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class ShopRepository {
  final Dio _dio;

  ShopRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseStatus<List<Products>>> fetchProducts() async* {
    List<Products>? products;

    try {
      final response = await _dio.get(productsListsUrl);
      products = (response.data['data'] as List<dynamic>).map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Products.fromJson(map);
      }).toList();

      yield ApiResponseStatus(
        isSuccessful: true,
        data: products,
        error: null,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: products,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: products,
        error: e.toString(),
      );
    }
  }
}
