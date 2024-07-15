import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomePopularServicesWidget extends StatelessWidget {
  const HomePopularServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Popular Services",
                  style: StyleUtil.style16DarkBlueBold),
            ),
            Text(
              "View All",
              style: StyleUtil.style14DarkBlue,
            ),
          ],
        ),
        CustomVerticalSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: ColorUtil.colorOrange),
                  CustomVerticalSpacer(height: 8),
                  Text(
                    "Daily\nHoroscope",
                    style: StyleUtil.style14DarkBlue,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: ColorUtil.colorOrange),
                  CustomVerticalSpacer(height: 8),
                  Text(
                    "Make\nKundali",
                    style: StyleUtil.style14DarkBlue,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: ColorUtil.colorOrange),
                  CustomVerticalSpacer(height: 8),
                  Text(
                    "Kundali\nMatching",
                    style: StyleUtil.style14DarkBlue,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: ColorUtil.colorOrange),
                  CustomVerticalSpacer(height: 8),
                  Text(
                    "Panchanga\nCalendar",
                    style: StyleUtil.style14DarkBlue,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
