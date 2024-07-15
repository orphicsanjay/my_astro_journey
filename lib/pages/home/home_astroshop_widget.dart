import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeAstroShopWidget extends StatelessWidget {
  const HomeAstroShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Astro Shop", style: StyleUtil.style16DarkBlueBold),
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
              AstroShopCard(),
              CustomHorizontalSpacer(),
              AstroShopCard(),
              CustomHorizontalSpacer(),
              AstroShopCard(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class AstroShopCard extends StatelessWidget {
  const AstroShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/astro_ring.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Astro Ring",
              style: StyleUtil.style16DarkBlue,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Buy",
                style: StyleUtil.style14White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
