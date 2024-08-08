import 'package:equatable/equatable.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object?> get props => [];
}

class FetchCountries extends AddressEvent {}

class FetchDistricts extends AddressEvent {}
