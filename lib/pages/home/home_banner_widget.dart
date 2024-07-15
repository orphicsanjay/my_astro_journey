import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0XFF931F23),
            Color(0XFF440608),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/astro.jpg",
                height: 120,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const CustomHorizontalSpacer(width: 8),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Astrology is a language. If you want to understand this language, speak to us!",
                  style: StyleUtil.style16White,
                ),
                CustomVerticalSpacer(height: 16),
                Text(
                  "Connect with Astrologer",
                  style: StyleUtil.style16WhiteBold,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
