import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class ShopSpecialOffers extends StatelessWidget {
  const ShopSpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text("Special Offers",
                    style: StyleUtil.style16DarkBlueBold),
              ),
              Text(
                "View All",
                style: StyleUtil.style14DarkBlue,
              ),
            ],
          ),
          CustomVerticalSpacer(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildOfferWidget(
                  image: "assets/images/astro_ring.jpg",
                  color: ColorUtil.colorOrange,
                ),
                CustomHorizontalSpacer(),
                BuildOfferWidget(
                  image: "assets/images/astro_ring.jpg",
                  color: ColorUtil.colorDarkBlue,
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

class BuildOfferWidget extends StatelessWidget {
  final String image;

  final Color color;

  const BuildOfferWidget({super.key, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(text: '20', style: StyleUtil.style24WhiteBold),
                    TextSpan(text: '% \n', style: StyleUtil.style20White),
                    TextSpan(text: 'OFF \n', style: StyleUtil.style20White),
                    TextSpan(text: 'Rings', style: StyleUtil.style20White),
                  ],
                ),
              ),
            ),
            const CustomVerticalSpacer(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
