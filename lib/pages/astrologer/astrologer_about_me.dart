import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_all_border_container.dart';
import 'package:flutter/material.dart';

class AstrologerAboutMe extends StatelessWidget {
  final String astrologerBio;
  const AstrologerAboutMe({super.key, required this.astrologerBio});

  @override
  Widget build(BuildContext context) {
    return DashedAllBorderContainer(
      borderRadius: 16.0,
      color: ColorUtil.colorLightOrange,
      strokeWidth: 2.0,
      dashWidth: 12.0,
      dashSpace: 4.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorUtil.colorAboutMeBackground),
        child: Column(
          children: [
            const Text(
              "About me",
              style: StyleUtil.style16Black,
            ),
            const CustomVerticalSpacer(height: 8),
            Text(
              astrologerBio,
              style: StyleUtil.style14Black,
            ),
            const CustomVerticalSpacer(height: 8),
            const Text(
              "See more",
              style: StyleUtil.style16BlackBold,
            ),
          ],
        ),
      ),
    );
  }
}
