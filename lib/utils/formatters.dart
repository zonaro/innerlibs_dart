import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

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

class NumberInputFormatter extends TextInputFormatter {
  NumberFormat? format;

  NumberInputFormatter.currency({String? locale, String? name, String? symbol, int? decimalDigits, String? customPattern}) : format = NumberFormat.currency(locale: locale, symbol: symbol, name: name, customPattern: customPattern, decimalDigits: decimalDigits);
  NumberInputFormatter([this.format]);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    format ??= NumberFormat.decimalPattern();
    String newText = newValue.text.onlyNumbers;
    var n = double.parse(newText.padLeft((format!.decimalDigits ?? 2) + 1, '0')) / "1${"0".repeat(format!.decimalDigits ?? 2)}".toInt!;
    String formattedValue = format!.format(n);
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
