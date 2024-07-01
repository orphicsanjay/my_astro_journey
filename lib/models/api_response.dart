class ApiResponse {
  int statusCode;
  Map<String, dynamic>? body;
  String message;

  ApiResponse({
    required this.statusCode,
    this.body,
    required this.message,
  });
}
