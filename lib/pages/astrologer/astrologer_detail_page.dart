import 'package:astrology/pages/astrologer/astrologer_about_me.dart';
import 'package:astrology/pages/astrologer/astrologer_comments.dart';
import 'package:astrology/pages/astrologer/astrologer_intro_card.dart';
import 'package:astrology/pages/astrologer/similar_astrologers.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class AstrologerDetailPage extends StatefulWidget {
  const AstrologerDetailPage({super.key});

  @override
  State<AstrologerDetailPage> createState() => _AstrologerDetailPageState();
}

class _AstrologerDetailPageState extends State<AstrologerDetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Astrologers detail",
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: const SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              AastrologerIntroCard(),
              CustomVerticalSpacer(),
              AstrologerAboutMe(),
              CustomVerticalSpacer(),
              AstrologerReviews(),
              CustomVerticalSpacer(),
              SimilarAstrologers()
            ],
          ),
        ),
      ),
    );
  }
}
