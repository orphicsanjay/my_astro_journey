import 'package:astrology/address/country.dart';

class District {
  int? id;
  String? name;
  Country? country;

  District(this.id, this.name, this.country);

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      json['id'] as int?,
      json['name'] as String?,
      json['country'] != null ? Country.fromJson(json['country']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country?.toJson(),
    };
  }
}
