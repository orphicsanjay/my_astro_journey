import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final int currentIndex;
  final bool isLoading;
  // final String? error;

  const AuthState({
    required this.currentIndex,
    this.isLoading = false,
    // this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      currentIndex: 0,
      isLoading: false,
      // error: null,
    );
  }

  @override
  List<Object?> get props => [currentIndex, isLoading];

  AuthState copyWith({
    int? currentIndex,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      // error: error ?? this.error,
    );
  }
}
