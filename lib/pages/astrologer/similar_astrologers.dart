import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class SimilarAstrologers extends StatelessWidget {
  const SimilarAstrologers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Check Similar Astrologers",
                  style: StyleUtil.style16DarkBlueBold),
            ),
            Text(
              "View All",
              style: StyleUtil.style14DarkBlue,
            ),
          ],
        ),
        CustomVerticalSpacer(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
              SimilarAstrologerCard(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class SimilarAstrologerCard extends StatelessWidget {
  const SimilarAstrologerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            SizedBox(
              height: 160,
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorUtil.colorProfileGrey,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                            color: ColorUtil.colorProfileLightGrey, width: 8),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/astrologer1.png",
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          color: ColorUtil.colorWhite,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: ColorUtil.colorOrange),
                            Text("5"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              "Vedic/Vastu",
              style: StyleUtil.style16DarkBlue,
            ),
            const Text(
              "Rs.30/min",
              style: StyleUtil.style12Grey,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Connect",
                style: StyleUtil.style14White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
