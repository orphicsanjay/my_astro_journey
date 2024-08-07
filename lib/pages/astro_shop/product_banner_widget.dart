import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class ProductBannerWudget extends StatelessWidget {
  const ProductBannerWudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0XFF0ACF83),
            Color(0XFF0ACF83),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blue Saphire",
                    style: StyleUtil.style16WhiteBold,
                  ),
                  Text(
                    "Blue Sapphire (Neelam) is the gem stone that is associated with the biggest planet of the zodiac sign that is Saturn. ",
                    style: StyleUtil.style14White,
                  ),
                  CustomVerticalSpacer(height: 16),
                  Row(
                    children: [
                      Text(
                        "Shop now",
                        style: StyleUtil.style14WhiteBold,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        size: 24.0,
                        color: ColorUtil.colorWhite,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const CustomHorizontalSpacer(width: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/blue_saphire.jpg",
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
