import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/time_formatter.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const TimeWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Time of Birth',
        hintText: 'HH:MM:SS',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [TimeInputFormatter()],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the time';
        }
        if (!RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(value)) {
          return 'Enter a valid time in HH:MM:SS format';
        }
        return null;
      },
    );
  }
}
