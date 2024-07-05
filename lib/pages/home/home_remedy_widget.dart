import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeRemedyWidget extends StatelessWidget {
  const HomeRemedyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Remedy", style: StyleUtil.style20DarkBlueBold),
            ),
            Text(
              "View All",
              style: StyleUtil.style16DarkBlue,
            ),
          ],
        ),
        CustomVerticalSpacer(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RemedyCard(),
              CustomHorizontalSpacer(),
              RemedyCard(),
              CustomHorizontalSpacer(),
              RemedyCard(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class RemedyCard extends StatelessWidget {
  const RemedyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_astro_logo.png",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            const Text(
              "Ghar Santi Poja",
              style: StyleUtil.style16BlackBold,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Connect",
                style: StyleUtil.style16White,
              ),
            )
          ],
        ),
      ),
    );
  }
}
