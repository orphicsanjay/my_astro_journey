class RequestOTP {
  String? email;
  String? phonenumber;
  int? countryCode;

  RequestOTP({this.email, this.phonenumber, this.countryCode});

  // Convert an instance of RequestOTP to a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['country_code'] = countryCode;
    return data;
  }

  // Create an instance of RequestOTP from a JSON map
  factory RequestOTP.fromJson(Map<String, dynamic> json) {
    return RequestOTP(
      email: json['email'] as String?,
      phonenumber: json['phonenumber'] as String?,
      countryCode: json['country_code'] as int?,
    );
  }
}
