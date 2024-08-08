class Country {
  int? id;
  String? countryCode;
  String? countryName;
  String? countryShortName;
  String? countryFlag;
  Country(this.id, this.countryCode, this.countryName, this.countryShortName,
      this.countryFlag);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['id'],
      json['country_code'],
      json['country_name'],
      json['country_short_name'],
      json['country_flag'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'country_short_name': countryShortName,
      'country_flag': countryFlag,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          countryCode == other.countryCode &&
          countryName == other.countryName;

  @override
  int get hashCode => countryCode.hashCode ^ countryName.hashCode;
}
