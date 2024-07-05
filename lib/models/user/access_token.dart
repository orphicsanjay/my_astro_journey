class AccessToken {
  String? accessToken;
  String? refreshToken;

  AccessToken(this.accessToken, this.refreshToken);

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
