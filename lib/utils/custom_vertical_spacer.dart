import 'package:flutter/material.dart';

class CustomVerticalSpacer extends StatelessWidget {
  final double height;

  // Set the default value for height to 100
  const CustomVerticalSpacer({super.key, this.height = 32});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
