import 'package:astrology/bloc/address/address_event.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_event.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_state.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/repository/gender_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileBloc
    extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  final GenderRepository _genderRepository;

  CompleteProfileBloc({
    required GenderRepository genderRepository,
  })  : _genderRepository = genderRepository,
        super(CompleteProfileState.initial()) {
    on<FetchGenders>(_onFetchGenders);
    on<UpdateGenders>(_onGenderUpdate);
    on<UpdateCountry>(_onCountryUpdate);
  }

  void _onFetchGenders(
    CompleteProfileEvent event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await emit.forEach<ApiResponseStatus<List<Gender>>>(
      _genderRepository.fetchGenders(),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoading: false,
            isFailed: false,
            genders: response.data,
            error: response.error,
          );
        } else {
          return state.copyWith(
            isLoading: false,
            isFailed: true,
            error: response.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoading: false,
          isFailed: true,
          error: error.toString(),
        );
      },
    );
  }

  void _onGenderUpdate(
      UpdateGenders event, Emitter<CompleteProfileState> emit) async {
    emit(state.copyWith(selectedGender: event.gender));
  }

  void _onCountryUpdate(
      UpdateCountry event, Emitter<CompleteProfileState> emit) async {
    emit(state.copyWith(selectedCountry: event.country));
  }
}
