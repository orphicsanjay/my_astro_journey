import 'package:astrology/models/address/country.dart';
import 'package:astrology/network/api_response_status.dart';

class ApiResponseWithSelectedCountry<T> {
  final ApiResponseStatus<T> apiResponse;
  final Country? selectedCountry;

  ApiResponseWithSelectedCountry({
    required this.apiResponse,
    this.selectedCountry,
  });
}
