import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/address/district.dart';
import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object?> get props => [];
}

class FetchCountries extends AddressEvent {}

class FetchDistricts extends AddressEvent {}

class UpdateSelectedCountry extends AddressEvent {
  final Country country;
  const UpdateSelectedCountry(this.country);
}

class UpdateSelectedDistrict extends AddressEvent {
  final District district;
  const UpdateSelectedDistrict(this.district);
}
