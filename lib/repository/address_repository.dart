import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/address/district.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/api_response_with_country.dart';
import 'package:astrology/network/endpoints.dart';
import 'package:dio/dio.dart';

class AddressRepository {
  final Dio _dio;

  AddressRepository({required Dio dio}) : _dio = dio;

  Stream<ApiResponseWithSelectedCountry<List<Country>>>
      fetchCountries() async* {
    List<Country>? countries;
    Country? selectedCountry;
    try {
      final response = await _dio.get(countriesUrl);
      countries = (response.data as List<dynamic>).map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Country.fromJson(map);
      }).toList();
      for (var country in countries) {
        if (country.countryName == "NEPAL") {
          selectedCountry = country;
          break;
        }
      }
      yield ApiResponseWithSelectedCountry(
        apiResponse: ApiResponseStatus(
          isSuccessful: true,
          data: countries,
          error: null,
        ),
        selectedCountry: selectedCountry,
      );
    } on DioException catch (error) {
      yield ApiResponseWithSelectedCountry(
        apiResponse: ApiResponseStatus(
          isSuccessful: false,
          data: countries,
          error: error.message,
        ),
        selectedCountry: selectedCountry,
      );
    } catch (e) {
      yield ApiResponseWithSelectedCountry(
        apiResponse: ApiResponseStatus(
          isSuccessful: false,
          data: countries,
          error: e.toString(),
        ),
        selectedCountry: selectedCountry,
      );
    }
  }

  Stream<ApiResponseStatus<List<District>>> fetchDistricts() async* {
    List<District>? districts;

    try {
      final response = await _dio.get(districtUrl);
      districts = (response.data as List<dynamic>).map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return District.fromJson(map);
      }).toList();

      yield ApiResponseStatus(
        isSuccessful: true,
        data: districts,
        error: null,
      );
    } on DioException catch (error) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: districts,
        error: error.message,
      );
    } catch (e) {
      yield ApiResponseStatus(
        isSuccessful: false,
        data: districts,
        error: e.toString(),
      );
    }
  }
}
