import 'package:astrology/bloc/astrologer/astrologer_event.dart';
import 'package:astrology/bloc/astrologer/astrologer_state.dart';
import 'package:astrology/models/astrologer/astrologer.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/repository/astrologer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AstrologerBloc extends Bloc<AstrologerEvent, AstrologerState> {
  final AstrologerRepository _astrologerRepository;

  AstrologerBloc({
    required AstrologerRepository astrologerRepository,
  })  : _astrologerRepository = astrologerRepository,
        super(AstrologerState.initial()) {
    on<FetchAstrologersList>(_onFetchAstrologersList);
    on<FetchAstrologerDetail>(_onFetchAstrologerDetail);
  }

  void _onFetchAstrologersList(
    FetchAstrologersList event,
    Emitter<AstrologerState> emit,
  ) async {
    emit(state.copyWith(isLoadingAstrologersList: true));

    await emit.forEach<ApiResponseStatus<List<Astrologer>>>(
      _astrologerRepository.fetchAstrologersList(),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoadingAstrologersList: false,
            isFailedAstrologersList: false,
            astrologers: response.data,
            listError: response.error,
          );
        } else {
          return state.copyWith(
            isLoadingAstrologersList: false,
            isFailedAstrologersList: true,
            listError: response.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoadingAstrologersList: false,
          isFailedAstrologersList: true,
          listError: error.toString(),
        );
      },
    );
  }

  void _onFetchAstrologerDetail(
    FetchAstrologerDetail event,
    Emitter<AstrologerState> emit,
  ) async {
    emit(state.copyWith(isLoadingAstrologerDetails: true));

    await emit.forEach<ApiResponseStatus<Astrologer>>(
      _astrologerRepository.fetchAstrologerDetail(event.id),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoadingAstrologerDetails: false,
            isFailedAstrologerDetails: false,
            astrologerDetails: response.data,
            detailError: response.error,
          );
        } else {
          return state.copyWith(
            isLoadingAstrologerDetails: false,
            isFailedAstrologerDetails: true,
            detailError: response.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoadingAstrologerDetails: false,
          isFailedAstrologerDetails: true,
          detailError: error.toString(),
        );
      },
    );
  }
}
