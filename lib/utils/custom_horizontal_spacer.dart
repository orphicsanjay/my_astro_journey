import 'package:flutter/material.dart';

class CustomHorizontalSpacer extends StatelessWidget {
  final double width;

  // Set the default value for width to 100
  const CustomHorizontalSpacer({super.key, this.width = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
