import 'package:astrology/bloc/auth/auth_event.dart';
import 'package:astrology/bloc/auth/auth_state.dart';
import 'package:astrology/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthState.initial()) {
    // on<FetchAppServices>(_onFetchAppServices);
    on<ChangedTab>(_onChangedTab);
  }

  void _onChangedTab(ChangedTab event, Emitter<AuthState> emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }

  // void _onFetchAppServices(
  //   AppServiceEvent event,
  //   Emitter<AppServiceState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true));

  //   await emit.forEach<ApiResponseStatus<List<AppService>>>(
  //     _appServiceRepository.fetchAppServices(),
  //     onData: (response) {
  //       if (response.isSuccessful) {
  //         return state.copyWith(
  //           isLoading: false,
  //           isFailed: false,
  //           appServices: response.data,
  //           error: response.error,
  //         );
  //       } else {
  //         return state.copyWith(
  //           isLoading: false,
  //           isFailed: true,
  //           error: response.error,
  //         );
  //       }
  //     },
  //     onError: (error, stackTrace) {
  //       return state.copyWith(
  //         isLoading: false,
  //         isFailed: true,
  //         error: error.toString(),
  //       );
  //     },
  //   );
  // }
}
