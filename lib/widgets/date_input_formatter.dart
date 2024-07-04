import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length == 2 || text.length == 5) {
      if (oldValue.text.length < newValue.text.length) {
        return TextEditingValue(
          text: '$text/',
          selection: TextSelection.collapsed(offset: text.length + 1),
        );
      }
    }
    return newValue;
  }
}
