import 'package:astrology/utils/color_util.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  // Define a static method to show a snackbar
  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: ColorUtil.colorLightBlue,
      duration: const Duration(
          seconds: 2), // Duration for how long the Snackbar will be shown
    );

    // Show the Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
