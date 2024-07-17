import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: "Search astrologers, astroshop products, services",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        focusColor: ColorUtil.colorOrange,
        hintStyle: StyleUtil.style16Grey,
        prefixIcon: const Icon(Icons.search, color: ColorUtil.colorOrange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorGrey, width: 1.0), // Grey border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorOrange,
              width: 2.0), // Orange border color on focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
              color: ColorUtil.colorGrey,
              width: 1.0), // Grey border color when enabled
        ),
      ),
    );
  }
}
