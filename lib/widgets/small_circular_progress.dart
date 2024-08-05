import 'package:flutter/material.dart';

class SmallCircularProgess extends StatelessWidget {
  const SmallCircularProgess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
