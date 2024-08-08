import 'package:astrology/bloc/appservice/appservice_event.dart';
import 'package:astrology/bloc/appservice/appservice_state.dart';
import 'package:astrology/models/services/app_service.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/repository/appservice_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppServiceBloc extends Bloc<AppServiceEvent, AppServiceState> {
  final AppServiceRepository _appServiceRepository;

  AppServiceBloc({
    required AppServiceRepository appServiceRepository,
  })  : _appServiceRepository = appServiceRepository,
        super(AppServiceState.initial()) {
    on<FetchAppServices>(_onFetchAppServices);
  }

  void _onFetchAppServices(
    AppServiceEvent event,
    Emitter<AppServiceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await emit.forEach<ApiResponseStatus<List<AppService>>>(
      _appServiceRepository.fetchAppServices(),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoading: false,
            isFailed: false,
            appServices: response.data,
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
}
