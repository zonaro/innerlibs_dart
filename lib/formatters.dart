import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;

class NumberInputFormatter extends TextInputFormatter {
  NumberFormat? format;
  String? locale;

  NumberInputFormatter([this.format]);
  NumberInputFormatter.currency({this.locale, String? name, String? symbol, int? decimalDigits, String? customPattern}) : format = NumberFormat.currency(locale: locale, symbol: symbol, name: name, customPattern: customPattern, decimalDigits: decimalDigits);
  NumberInputFormatter.locale([this.locale]);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    locale ??= platformLocaleCode;
    format ??= NumberFormat.decimalPattern(locale);

    String newText = newValue.text;

    var simb = numberFormatSymbols[format!.locale] as NumberSymbols?;
    if (simb != null) {
      newText = newText.removeWhere(
        (x) => x.isNotIn([
          ...StringHelpers.numberChars,
          simb.DECIMAL_SEP,
        ]),
      );
      while (newText.count(simb.DECIMAL_SEP) > 1) {
        newText = newText.replaceFirst(simb.DECIMAL_SEP, '');
      }
      if (newValue.text.startsWith(simb.MINUS_SIGN)) {
        newText = simb.MINUS_SIGN + newText;
      }

      if (!newText.endsWith(simb.DECIMAL_SEP)) {
        format!.format(format!.parse(newText));
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class PercentFormatter extends TextInputFormatter {
  int? decimalDigits;
  final bool autoCalculate;
  string? locale;

  PercentFormatter({this.decimalDigits, this.autoCalculate = false, this.locale});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    locale ??= platformLocaleCode;
    decimalDigits ??= NumberFormat.decimalPattern(locale).decimalDigits ?? 4;
    var simb = numberFormatSymbols[locale] as NumberSymbols?;
    var decimalSeparator = simb?.DECIMAL_SEP ?? ".";
    var minusSign = simb?.MINUS_SIGN ?? "-";
    var percentSign = simb?.PERCENT ?? "%";

    String formattedValue = "";

    // Remove any non-digit characters
    for (int i = 0; i < newValue.text.length; i++) {
      var e = newValue.text.charAt(i);
      if (i == 0 && (e == minusSign)) {
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
      if (e == percentSign && i == newValue.text.length - 1) {
        formattedValue += e;
        continue;
      }
    }

    // Check if the first character is a plus or minus sign
    bool isNegative = false;
    if (formattedValue.isNotEmpty && (formattedValue[0] == minusSign)) {
      isNegative = formattedValue[0] == minusSign;
      formattedValue = formattedValue.substring(1);
    }

    // Check if the last character is a percent sign
    bool hasPercentSign = false;
    if (formattedValue.isNotEmpty && formattedValue[formattedValue.length - 1] == percentSign) {
      hasPercentSign = true;
      formattedValue = formattedValue.substring(0, formattedValue.length - 1);
    }

    // Check if the newText contains a decimal separator
    bool hasDecimalSeparator = formattedValue.contains(decimalSeparator);

    // Split the newText into integer and decimal parts
    List<String> parts = formattedValue.split(decimalSeparator);
    String integerPart = parts[0];
    String decimalPart = (parts.length > 1 ? parts[1] : '').first(decimalDigits!);

    // Format the integer part
    formattedValue = NumberFormat.decimalPattern(locale).format(int.parse(integerPart));

    // Add the decimal separator and decimal part if necessary
    if (hasDecimalSeparator) {
      formattedValue += '$decimalSeparator$decimalPart';
    }

    // Add the percent sign if necessary
    if (hasPercentSign) {
      if (autoCalculate) {
        formattedValue = (double.parse(formattedValue.removeAny([percentSign])) / 100).toStringAsFixed(decimalDigits!);
      } else {
        formattedValue += percentSign;
      }
    }

    // Add the plus or minus sign if necessary
    if (isNegative) {
      formattedValue = '$minusSign$formattedValue';
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: (formattedValue.contains(percentSign) ? formattedValue.indexOf(percentSign) - 1 : formattedValue.length).clamp(0, formattedValue.length - 1)),
    );
  }
}
