import 'package:astrology/models/services/app_service.dart';
import 'package:equatable/equatable.dart';

class AppServiceState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final List<AppService>? apiServices;
  final String? error;

  const AppServiceState({
    required this.isLoading,
    required this.isFailed,
    this.apiServices,
    this.error,
  });

  AppServiceState.initial()
      : isLoading = false,
        isFailed = false,
        apiServices = [],
        error = null;

  AppServiceState copyWith({
    bool? isLoading,
    bool? isFailed,
    List<AppService>? apiServices,
    String? error,
  }) {
    return AppServiceState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      apiServices: apiServices ?? this.apiServices,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isFailed, apiServices, error];
}
