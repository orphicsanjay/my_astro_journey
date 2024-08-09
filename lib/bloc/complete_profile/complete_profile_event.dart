import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:equatable/equatable.dart';

abstract class CompleteProfileEvent extends Equatable {
  const CompleteProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchGenders extends CompleteProfileEvent {}

class UpdateGenders extends CompleteProfileEvent {
  final Gender? gender;
  const UpdateGenders(this.gender);
}

class UpdateCountry extends CompleteProfileEvent {
  final Country? country;
  const UpdateCountry(this.country);
}
