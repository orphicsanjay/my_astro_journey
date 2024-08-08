import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AstroProductCategories extends StatelessWidget {
  const AstroProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Categories", onTap: () {}),
          const CustomVerticalSpacer(height: 8),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AstroProductCategory(
                  image: "assets/images/rudraksha.jpg",
                  title: "Rudraksha",
                ),
                CustomHorizontalSpacer(),
                AstroProductCategory(
                  image: "assets/images/astro_ring.jpg",
                  title: "Rings",
                ),
                CustomHorizontalSpacer(),
                AstroProductCategory(
                  image: "assets/images/blue_saphire.jpg",
                  title: "Gems",
                ),
                CustomHorizontalSpacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AstroProductCategory extends StatelessWidget {
  final String image;
  final String title;

  const AstroProductCategory(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorUtil.colorWhite,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: StyleUtil.style14DarkBlue,
            ),
            const CustomVerticalSpacer(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: ColorUtil.colorOrange,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "View",
                style: StyleUtil.style14White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
