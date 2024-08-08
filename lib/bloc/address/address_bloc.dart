import 'package:astrology/bloc/address/address_event.dart';
import 'package:astrology/bloc/address/address_state.dart';
import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/address/district.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/network/api_response_with_country.dart';
import 'package:astrology/repository/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository _addressRepository;

  AddressBloc({
    required AddressRepository addressRepository,
  })  : _addressRepository = addressRepository,
        super(AddressState.initial()) {
    on<FetchCountries>(_onFetchCountries);
    on<FetchDistricts>(_onFetchDistricts);
    on<UpdateSelectedCountry>(_onUpdateSelectedCountry);
  }

  void _onFetchCountries(
    AddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(isLoadingCountries: true));

    await emit.forEach<ApiResponseWithSelectedCountry<List<Country>>>(
      _addressRepository.fetchCountries(),
      onData: (response) {
        if (response.apiResponse.isSuccessful) {
          return state.copyWith(
              isLoadingCountries: false,
              isFailedCountries: false,
              countries: response.apiResponse.data,
              countriesError: response.apiResponse.error,
              selectedCountry: response.selectedCountry);
        } else {
          return state.copyWith(
            isLoadingCountries: false,
            isFailedCountries: false,
            countriesError: response.apiResponse.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoadingCountries: false,
          isFailedCountries: false,
          countriesError: error.toString(),
        );
      },
    );
  }

  void _onFetchDistricts(
    AddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(isLoadingDistricts: true));

    await emit.forEach<ApiResponseStatus<List<District>>>(
      _addressRepository.fetchDistricts(),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoadingDistricts: false,
            isFailedDistricts: false,
            districts: response.data,
            districtsError: response.error,
          );
        } else {
          return state.copyWith(
            isLoadingDistricts: false,
            isFailedDistricts: false,
            districtsError: response.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoadingDistricts: false,
          isFailedDistricts: false,
          districtsError: error.toString(),
        );
      },
    );
  }

  void _onUpdateSelectedCountry(
    UpdateSelectedCountry event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(selectedCountry: event.country));
  }

  void _onUpdateSelectedDistrict(
    UpdateSelectedDistrict event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(selectedDistrict: event.district));
  }
}
