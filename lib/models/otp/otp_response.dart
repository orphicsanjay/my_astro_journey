class OTPResponse {
  String? message;
  String? accessToken;
  String? refreshToken;

  OTPResponse(this.message, this.accessToken, this.refreshToken);

  // Convert a JSON map to an OTPResponse instance
  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      json['message'] as String?,
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );
  }

  // Convert an OTPResponse instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
