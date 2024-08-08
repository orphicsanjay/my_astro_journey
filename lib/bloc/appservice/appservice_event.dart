import 'package:equatable/equatable.dart';

abstract class AppServiceEvent extends Equatable {
  const AppServiceEvent();

  @override
  List<Object?> get props => [];
}

class FetchAppServices extends AppServiceEvent {}
