import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Center(
        child: Text(
          '"Unlock your cosmic\npotential with astrology"',
          style: StyleUtil.style20DeepPurpleItalic,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
