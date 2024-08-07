import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TitleWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            style: StyleUtil.style16DarkBlueBold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            "View All",
            style: StyleUtil.style14DarkBlue,
          ),
        ),
      ],
    );
  }
}
