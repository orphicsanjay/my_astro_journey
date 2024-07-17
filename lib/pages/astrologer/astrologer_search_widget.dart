import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class AstrologerSearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onTap;
  const AstrologerSearchWidget(
      {super.key, required this.onChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter astrologer";
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search Astrologer",
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.search,
              color: ColorUtil.colorOrange,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          labelStyle: StyleUtil.style16DarkBlue,
          focusColor: ColorUtil.colorOrange,
          hintStyle: StyleUtil.style16Grey,
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
      ),
    );
  }
}
