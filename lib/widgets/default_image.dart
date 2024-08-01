import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/astro_ring.jpg",
      height: 120,
      width: 120,
      fit: BoxFit.cover,
    );
  }
}
