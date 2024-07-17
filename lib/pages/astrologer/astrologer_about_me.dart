import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_all_border_container.dart';
import 'package:flutter/material.dart';

class AstrologerAboutMe extends StatelessWidget {
  const AstrologerAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return DashedAllBorderContainer(
      borderRadius: 16.0,
      color: ColorUtil.colorLightOrange,
      strokeWidth: 2.0,
      dashWidth: 12.0,
      dashSpace: 4.0,
      // backgroundColor: ColorUtil.colorAboutMeBackground,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorUtil.colorAboutMeBackground),
        child: const Column(
          children: [
            Text(
              "About me",
              style: StyleUtil.style16Black,
            ),
            CustomVerticalSpacer(height: 8),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Massa cras in dictum tempus scelerisque elit. Lectus lectus morbi aliquam nam faucibus vulputate. Tristique dictumst nunc felis bibendum nunc facilisis in ullamcorper vivamus. Sed venenatis sapien mattis vulputate tempor. Scelerisque..",
              style: StyleUtil.style14Black,
            ),
            CustomVerticalSpacer(height: 8),
            Text(
              "See more",
              style: StyleUtil.style16BlackBold,
            ),
          ],
        ),
      ),
    );
  }
}
