import 'package:flutter/services.dart';

class PercentFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-allowed characters
    final filteredText = newValue.text.replaceAll(RegExp(r'[^0-9,\-\+.%]'), '');

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}
