import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:equatable/equatable.dart';

class CompleteProfileState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final List<Gender>? genders;
  final String? error;
  final Gender? selectedGender;
  final Country? selectedCountry;

  const CompleteProfileState({
    required this.isLoading,
    required this.isFailed,
    this.genders,
    this.error,
    this.selectedGender,
    this.selectedCountry,
  });

  CompleteProfileState.initial()
      : isLoading = false,
        isFailed = false,
        genders = [],
        error = null,
        selectedGender = null,
        selectedCountry = null;

  CompleteProfileState copyWith({
    bool? isLoading,
    bool? isFailed,
    List<Gender>? genders,
    String? error,
    Gender? selectedGender,
    Country? selectedCountry,
  }) {
    return CompleteProfileState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      genders: genders ?? this.genders,
      error: error ?? this.error,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, isFailed, genders, error, selectedGender, selectedCountry];
}
