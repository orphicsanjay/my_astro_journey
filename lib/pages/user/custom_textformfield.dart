import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String validatorMessage;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {super.key,
      required this.onChanged,
      required this.labelText,
      required this.hintText,
      required this.validatorMessage,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      onChanged: onChanged,
      cursorColor: ColorUtil.colorDarkBlue,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}
