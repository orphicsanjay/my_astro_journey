// import 'dart:convert';

// import 'package:base_project/main.dart';
// import 'package:base_project/models/api_response.dart';
// import 'package:base_project/pages/home_page.dart';
// import 'package:base_project/utils/http_service.dart';
// import 'package:flutter/material.dart';

// class HttpProvider with ChangeNotifier {
//   final HttpService _httpService = HttpService();

//   HttpProvider._internal();
//   static final HttpProvider _instance = HttpProvider._internal();
//   factory HttpProvider() => _instance;

//   // Map<String, dynamic>? _data;
//   // Map<String, dynamic>? get data => _data;
//   // ApiResponse? _apiResponse;
//   // ApiResponse? get apiResponse => _apiResponse;

//   void redirectToLogin() {
//     navigatorKey.currentState?.pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => const HomePage()),
//       (Route<dynamic> route) => false,
//     );
//   }

//   Future<ApiResponse?> fetchData(String endpoint) async {
//     ApiResponse? apiResponse;
//     try {
//       final response = await _httpService.getData(endpoint);
//       if (response.statusCode == 401) {
//         redirectToLogin();
//         return null;
//       }
//       final decodedJson = jsonDecode(response.body);
//       apiResponse = ApiResponse(
//         statusCode: response.statusCode,
//         message: decodedJson['message'],
//         body: decodedJson,
//       );
//       return apiResponse;
//     } catch (e) {
//       return apiResponse;
//     }
//   }

//   Future<ApiResponse?> sendData(
//       String endpoint, Map<String, dynamic> data) async {
//     ApiResponse? apiResponse;
//     try {
//       final response = await _httpService.postData(endpoint, data);
//       if (response.statusCode == 401) {
//         redirectToLogin();
//         return null;
//       }
//       final decodedJson = jsonDecode(response.body);
//       apiResponse = ApiResponse(
//         statusCode: response.statusCode,
//         message: decodedJson['message'],
//         body: decodedJson,
//       );
//       return apiResponse;
//     } catch (e) {
//       return apiResponse;
//     }
//   }

//   Future<ApiResponse?> updateData(
//       String endpoint, Map<String, dynamic> data) async {
//     ApiResponse? apiResponse;
//     try {
//       final response = await _httpService.putData(endpoint, data);
//       if (response.statusCode == 401) {
//         redirectToLogin();
//         return null;
//       }
//       final decodedJson = jsonDecode(response.body);
//       apiResponse = ApiResponse(
//         statusCode: response.statusCode,
//         message: decodedJson['message'],
//         body: decodedJson,
//       );
//       return apiResponse;
//     } catch (e) {
//       return apiResponse;
//     }
//   }

//   Future<ApiResponse?> removeData(String endpoint) async {
//     ApiResponse? apiResponse;
//     try {
//       final response = await _httpService.deleteData(endpoint);
//       if (response.statusCode == 401) {
//         redirectToLogin();
//         return null;
//       }
//       final decodedJson = jsonDecode(response.body);
//       apiResponse = ApiResponse(
//         statusCode: response.statusCode,
//         message: decodedJson['message'],
//         body: decodedJson,
//       );
//       return apiResponse;
//     } catch (e) {
//       return apiResponse;
//     }
//   }
// }
