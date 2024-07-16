import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_horizontal_spacer.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeServicesWidget extends StatelessWidget {
  const HomeServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Services", style: StyleUtil.style16DarkBlueBold),
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
              ServiceCard(),
              CustomHorizontalSpacer(),
              ServiceCard(),
              CustomHorizontalSpacer(),
              ServiceCard(),
              CustomHorizontalSpacer(),
            ],
          ),
        )
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

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
                "assets/images/pooja.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ghar Santi Poja",
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
