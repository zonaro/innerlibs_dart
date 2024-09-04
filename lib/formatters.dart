import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;

class NumberInputFormatter extends TextInputFormatter {
  NumberFormat? format;

  NumberInputFormatter([this.format]);
  NumberInputFormatter.currency({String? locale, String? name, String? symbol, int? decimalDigits, String? customPattern})
      : format = NumberFormat.currency(locale: locale, symbol: symbol, name: name, customPattern: customPattern, decimalDigits: decimalDigits);

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

class PercentFormatter extends TextInputFormatter {
  final int decimalDigits;
  final bool autoCalculate;
  final string? locale;

  PercentFormatter({this.decimalDigits = 20, this.autoCalculate = false, this.locale});
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var locale = this.locale ?? Intl.defaultLocale ?? "en_US";

    var decimalSeparator = numberFormatSymbols[locale]?.DECIMAL_SEP ?? ".";

    String formattedValue = "";

    // Remove any non-digit characters
    for (int i = 0; i < newValue.text.length; i++) {
      var e = newValue.text.charAt(i);
      if (i == 0 && (e == '+' || e == '-')) {
        formattedValue += e;
        continue;
      }
      if (e.isNumber) {
        formattedValue += e;
        continue;
      }
      if (e == decimalSeparator && !formattedValue.contains(decimalSeparator)) {
        formattedValue += e;
        continue;
      }
      if (e == '%' && i == newValue.text.length - 1) {
        formattedValue += e;
        continue;
      }
    }

    // Check if the first character is a plus or minus sign
    bool isNegative = false;
    if (formattedValue.isNotEmpty && (formattedValue[0] == '+' || formattedValue[0] == '-')) {
      isNegative = formattedValue[0] == '-';
      formattedValue = formattedValue.substring(1);
    }

    // Check if the last character is a percent sign
    bool hasPercentSign = false;
    if (formattedValue.isNotEmpty && formattedValue[formattedValue.length - 1] == '%') {
      hasPercentSign = true;
      formattedValue = formattedValue.substring(0, formattedValue.length - 1);
    }

    // Check if the newText contains a decimal separator
    bool hasDecimalSeparator = formattedValue.contains(decimalSeparator);

    // Split the newText into integer and decimal parts
    List<String> parts = formattedValue.split(decimalSeparator);
    String integerPart = parts[0];
    String decimalPart = (parts.length > 1 ? parts[1] : '').first(decimalDigits);

    // Format the integer part
    formattedValue = NumberFormat.decimalPattern(locale).format(int.parse(integerPart));

    // Add the decimal separator and decimal part if necessary
    if (hasDecimalSeparator) {
      formattedValue += '$decimalSeparator$decimalPart';
    }

    // Add the percent sign if necessary
    if (hasPercentSign) {
      if (autoCalculate) {
        formattedValue = (double.parse(formattedValue) / 100).toStringAsFixed(decimalDigits);
      } else {
        formattedValue += '%';
      }
    }

    // Add the plus or minus sign if necessary
    if (isNegative) {
      formattedValue = '-$formattedValue';
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
