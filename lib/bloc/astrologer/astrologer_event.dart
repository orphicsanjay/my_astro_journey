import 'package:equatable/equatable.dart';

abstract class AstrologerEvent extends Equatable {
  const AstrologerEvent();

  @override
  List<Object?> get props => [];
}

class FetchAstrologersList extends AstrologerEvent {}

class FetchAstrologerDetail extends AstrologerEvent {
  final int id;
  const FetchAstrologerDetail(this.id);
}
