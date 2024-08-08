import 'package:astrology/models/services/app_service.dart';
import 'package:equatable/equatable.dart';

class AppServiceState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final List<AppService>? appServices;
  final String? error;

  const AppServiceState({
    required this.isLoading,
    required this.isFailed,
    this.appServices,
    this.error,
  });

  AppServiceState.initial()
      : isLoading = false,
        isFailed = false,
        appServices = [],
        error = null;

  AppServiceState copyWith({
    bool? isLoading,
    bool? isFailed,
    List<AppService>? appServices,
    String? error,
  }) {
    return AppServiceState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      appServices: appServices ?? this.appServices,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isFailed, appServices, error];
}
