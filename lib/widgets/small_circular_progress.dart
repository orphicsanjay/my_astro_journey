import 'package:flutter/material.dart';

class SmallCircularProgess extends StatelessWidget {
  const SmallCircularProgess({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(),
    );
  }
}
