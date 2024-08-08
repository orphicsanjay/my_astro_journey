import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/address/district.dart';
import 'package:equatable/equatable.dart';

class AddressState extends Equatable {
  final bool isLoadingCountries;
  final bool isLoadingDistricts;
  final bool isFailedCountries;
  final bool isFailedDistricts;
  final List<Country>? countries;
  final List<District>? districts;
  final String? countriesError;
  final String? districtsError;
  final Country? selectedCountry;
  final District? selectedDistrict;

  const AddressState({
    required this.isLoadingCountries,
    required this.isLoadingDistricts,
    required this.isFailedCountries,
    required this.isFailedDistricts,
    this.countries,
    this.districts,
    this.countriesError,
    this.districtsError,
    this.selectedCountry,
    this.selectedDistrict,
  });

  factory AddressState.initial() {
    return const AddressState(
      isLoadingCountries: false,
      isLoadingDistricts: false,
      isFailedCountries: false,
      isFailedDistricts: false,
      countries: [],
      districts: [],
      countriesError: null,
      districtsError: null,
      selectedCountry: null,
      selectedDistrict: null,
    );
  }

  AddressState copyWith({
    bool? isLoadingCountries,
    bool? isLoadingDistricts,
    bool? isFailedCountries,
    bool? isFailedDistricts,
    List<Country>? countries,
    List<District>? districts,
    String? countriesError,
    String? districtsError,
    Country? selectedCountry,
    District? selectedDistrict,
  }) {
    return AddressState(
      isLoadingCountries: isLoadingCountries ?? this.isLoadingCountries,
      isLoadingDistricts: isLoadingDistricts ?? this.isLoadingDistricts,
      isFailedCountries: isFailedCountries ?? this.isFailedCountries,
      isFailedDistricts: isFailedDistricts ?? this.isFailedDistricts,
      countries: countries ?? this.countries,
      districts: districts ?? this.districts,
      countriesError: countriesError ?? this.countriesError,
      districtsError: districtsError ?? this.districtsError,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingCountries,
        isLoadingDistricts,
        isFailedCountries,
        isFailedDistricts,
        countries,
        districts,
        countriesError,
        districtsError,
        selectedCountry,
        selectedDistrict,
      ];
}
