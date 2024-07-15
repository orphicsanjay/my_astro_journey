import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/dashed_all_border_container.dart';
import 'package:flutter/material.dart';

class AstrologerAboutMe extends StatelessWidget {
  const AstrologerAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashedAllBorderContainer(
      borderRadius: 16.0,
      color: ColorUtil.colorLightOrange,
      strokeWidth: 2.0,
      dashWidth: 8.0,
      dashSpace: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
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