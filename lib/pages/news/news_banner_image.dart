import 'package:flutter/material.dart';

class NewsBannerImage extends StatelessWidget {
  const NewsBannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/pooja.jpg",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
