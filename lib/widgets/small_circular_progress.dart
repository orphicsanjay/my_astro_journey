import 'package:flutter/material.dart';

class SmallCircularProgess extends StatelessWidget {
  const SmallCircularProgess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      padding: const EdgeInsets.all(16),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
