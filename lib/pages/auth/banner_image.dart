import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final double height;
  const BannerImage({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.asset(
        "assets/images/login_astro_logo.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
