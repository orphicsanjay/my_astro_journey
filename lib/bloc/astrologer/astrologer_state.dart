// astrologer_state.dart
import 'package:equatable/equatable.dart';
import 'package:astrology/models/astrologer/astrologer.dart';

class AstrologerState extends Equatable {
  final bool isLoadingAstrologersList;
  final bool isLoadingAstrologerDetails;
  final bool isFailedAstrologersList;
  final bool isFailedAstrologerDetails;
  final List<Astrologer> astrologers;
  final Astrologer? astrologerDetails;
  final String? listError;
  final String? detailError;

  const AstrologerState({
    required this.isLoadingAstrologersList,
    required this.isLoadingAstrologerDetails,
    required this.isFailedAstrologersList,
    required this.isFailedAstrologerDetails,
    required this.astrologers,
    this.astrologerDetails,
    this.listError,
    this.detailError,
  });

  factory AstrologerState.initial() {
    return const AstrologerState(
      isLoadingAstrologersList: false,
      isLoadingAstrologerDetails: false,
      isFailedAstrologersList: false,
      isFailedAstrologerDetails: false,
      astrologers: [],
      astrologerDetails: null,
      listError: null,
      detailError: null,
    );
  }

  AstrologerState copyWith({
    bool? isLoadingAstrologersList,
    bool? isLoadingAstrologerDetails,
    bool? isFailedAstrologersList,
    bool? isFailedAstrologerDetails,
    List<Astrologer>? astrologers,
    Astrologer? astrologerDetails,
    String? listError,
    String? detailError,
  }) {
    return AstrologerState(
      isLoadingAstrologersList:
          isLoadingAstrologersList ?? this.isLoadingAstrologersList,
      isLoadingAstrologerDetails:
          isLoadingAstrologerDetails ?? this.isLoadingAstrologerDetails,
      isFailedAstrologersList:
          isFailedAstrologersList ?? this.isFailedAstrologersList,
      isFailedAstrologerDetails:
          isFailedAstrologerDetails ?? this.isFailedAstrologerDetails,
      astrologers: astrologers ?? this.astrologers,
      astrologerDetails: astrologerDetails ?? this.astrologerDetails,
      listError: listError ?? this.listError,
      detailError: detailError ?? this.detailError,
    );
  }

  @override
  List<Object?> get props => [
        isLoadingAstrologersList,
        isLoadingAstrologerDetails,
        isFailedAstrologersList,
        isFailedAstrologerDetails,
        astrologers,
        astrologerDetails,
        listError,
        detailError,
      ];
}
