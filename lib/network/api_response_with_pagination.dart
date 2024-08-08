import 'package:astrology/network/api_response_status.dart';

class ApiResponseWithPagination<T> {
  final ApiResponseStatus<T> apiResponseStatus;
  final T? selectedItem;
  final int currentPage;
  final int totalPages;

  ApiResponseWithPagination({
    required this.apiResponseStatus,
    this.selectedItem,
    required this.currentPage,
    required this.totalPages,
  });
}
