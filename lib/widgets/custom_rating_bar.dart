import 'package:astrology/utils/color_util.dart';
import 'package:flutter/material.dart';

class CustomRatingBar extends StatelessWidget {
  final double width;
  final double height;
  final double progress;

  const CustomRatingBar(
      {super.key,
      required this.width,
      required this.height,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorUtil.colorGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
              color: ColorUtil.colorOrange,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
