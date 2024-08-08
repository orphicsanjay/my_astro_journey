import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangedTab extends AuthEvent {
  final int index;

  ChangedTab(this.index);

  @override
  List<Object?> get props => [index];
}

class SubmitLogin extends AuthEvent {
  final String phoneNumber;
  final String email;

  SubmitLogin({required this.phoneNumber, required this.email});

  @override
  List<Object?> get props => [phoneNumber, email];
}
