import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      splashColor: ColorUtil.colorAboutMeBackground,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: ColorUtil.colorOrange,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            title,
            style: StyleUtil.style14White,
          ),
        ),
      ),
    );
  }
}
