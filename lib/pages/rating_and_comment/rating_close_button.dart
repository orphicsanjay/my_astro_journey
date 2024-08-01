import 'package:flutter/material.dart';

class RatingCloseButton extends StatelessWidget {
  const RatingCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          size: 24,
        ),
      ),
    );
  }
}
