import 'package:astrology/bloc/astrologer/astrologer_bloc.dart';
import 'package:astrology/bloc/astrologer/astrologer_event.dart';
import 'package:astrology/bloc/astrologer/astrologer_state.dart';
import 'package:astrology/dependency_injection.dart';
import 'package:astrology/models/astrologer/astrologer.dart';
import 'package:astrology/pages/astrologer/astrologer_about_me.dart';
import 'package:astrology/pages/astrologer/astrologer_comments.dart';
import 'package:astrology/pages/astrologer/astrologer_intro_card.dart';
import 'package:astrology/pages/astrologer/similar_astrologers.dart';
import 'package:astrology/shimmer/astrologer_shimmer.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AstrologerDetailPage extends StatefulWidget {
  final Astrologer astrologer;
  const AstrologerDetailPage({super.key, required this.astrologer});

  @override
  State<AstrologerDetailPage> createState() => _AstrologerDetailPageState();
}

class _AstrologerDetailPageState extends State<AstrologerDetailPage> {
  @override
  void initState() {
    getIt<AstrologerBloc>().add(FetchAstrologerDetail(widget.astrologer.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppbar(
        title: "${widget.astrologer.fullname}",
      ),
      body: BlocBuilder<AstrologerBloc, AstrologerState>(
          bloc: getIt<AstrologerBloc>(),
          builder: (context, state) {
            if (state.isLoadingAstrologerDetails) {
              return const BuildAstrologerShimmer();
            } else {
              return Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AastrologerIntroCard(astrologer: widget.astrologer),
                      const CustomVerticalSpacer(),
                      AstrologerAboutMe(
                        astrologerBio: widget.astrologer.bio!,
                      ),
                      const CustomVerticalSpacer(),
                      const AstrologerReviews(),
                      const CustomVerticalSpacer(),
                      const SimilarAstrologers()
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
