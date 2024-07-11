// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'dart:io';

import 'package:astrology/models/response/api_response.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  // final String baseUrl = base_url;

  void redirectToLogin() {
    // navigatorKey.currentState?.pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) => const HomePage()),
    //   (Route<dynamic> route) => false,
    // );
  }

  Future<ApiResponse?> getData(String endpoint) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.get(Uri.parse(endpoint));
      print("get response : ${response.statusCode} ");
      print("get response : ${response.body} ");

      if (response.statusCode == 401) {
        redirectToLogin();
        return null;
      }
      final decodedJson = jsonDecode(response.body);
      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: decodedJson['message'] ?? "",
        data: decodedJson,
      );
      print("after response : ${apiResponse.data}");
      return apiResponse;
    } on SocketException {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'Network error. Please try again later.',
        data: null,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }

  Future<ApiResponse?> postData(
      String endpoint, Map<String, dynamic> data) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      print("status code : ${response.statusCode}");
      print("response body : ${response.body}");
      if (response.statusCode == 401) {
        redirectToLogin();
        return null;
      }
      final decodedJson = jsonDecode(response.body);
      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: decodedJson['message'] ?? "",
        data: decodedJson,
      );
      print("api response : ${apiResponse.data}");
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }

  Future<ApiResponse?> putData(
      String endpoint, Map<String, dynamic> data) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.put(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      if (response.statusCode == 401) {
        redirectToLogin();
        return null;
      }
      final decodedJson = jsonDecode(response.body);
      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: decodedJson['message'],
        data: decodedJson,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }

  Future<ApiResponse?> deleteData(String endpoint) async {
    ApiResponse? apiResponse;

    try {
      final response = await http.delete(Uri.parse(endpoint));
      if (response.statusCode == 401) {
        redirectToLogin();
        return null;
      }
      final decodedJson = jsonDecode(response.body);
      apiResponse = ApiResponse(
        statusCode: response.statusCode,
        message: decodedJson['message'],
        data: decodedJson,
      );
      return apiResponse;
    } catch (e) {
      apiResponse = ApiResponse(
        statusCode: 0,
        message: 'An unexpected error occurred.',
        data: null,
      );
      return apiResponse;
    }
  }
}
