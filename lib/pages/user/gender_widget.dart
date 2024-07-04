import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const GenderWidget({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      dense: true,
      contentPadding: EdgeInsets.zero,
      activeColor: ColorUtil.colorOrange,
      title: Text(
        title,
        style: StyleUtil.style16DeepPurple,
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
