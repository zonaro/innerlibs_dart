import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

class LicensePlateFormatter extends TextInputFormatter {
  final bool includeHiphen;

  final bool allowThreeLetters;
  final bool allowTwoLetters;
  final bool allowMercosul;

  LicensePlateFormatter({
    this.includeHiphen = true,
    this.allowThreeLetters = true,
    this.allowTwoLetters = true,
    this.allowMercosul = true,
  });

  bool get isThreeLettersFirst => allowThreeLetters || allowMercosul;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (allowMercosul == false && allowThreeLetters == false && allowTwoLetters == false) return newValue;

    var plate = newValue.text.toUpperCase().onlyLettersOrNumbers.first(7);

    var arr = plate.toArray;
    if (arr.isEmpty) return newValue;

    arr[0] = arr[0].isLettersOnly ? arr[0] : '';
    if (arr.length >= 2) arr[1] = arr[1].isLettersOnly ? arr[1] : '';

    if (isThreeLettersFirst && allowTwoLetters) {
      if (arr.length >= 3) arr[2] = arr[2].isLettersOnly || arr[2].isNumericOnly ? arr[2] : '';
    } else if (isThreeLettersFirst) {
      if (arr.length >= 3) arr[2] = arr[2].isLettersOnly ? arr[2] : '';
    } else {
      if (arr.length >= 3) arr[2] = arr[2].isNumericOnly ? arr[2] : '';
    }
    bool isTwoLetterNow = (arr[0].isLettersOnly && arr[1].isLettersOnly && arr[2].isNumericOnly) || !allowMercosul && !allowThreeLetters;

    if (isTwoLetterNow) {
      if (arr.length >= 4) arr[3] = arr[3].isNumericOnly ? arr[3] : '';
      if (arr.length >= 5) arr[4] = arr[4].isNumericOnly ? arr[4] : '';
      if (arr.length >= 6) arr[5] = arr[5].isNumericOnly ? arr[5] : '';
      if (arr.length >= 7) arr[6] = '';
    } else {
      if (arr.length >= 4) arr[3] = arr[3].isNumericOnly ? arr[3] : '';
      if (allowMercosul && !allowThreeLetters) {
        if (arr.length >= 5) arr[4] = arr[4].isLettersOnly ? arr[4] : '';
      } else if (!allowMercosul && allowThreeLetters) {
        if (arr.length >= 5) arr[4] = arr[4].isNumericOnly ? arr[4] : '';
      } else if (allowMercosul && allowThreeLetters) {
        if (arr.length >= 5) arr[4] = (arr[4].isNumericOnly || arr[4].isLettersOnly) ? arr[4] : '';
      }
      if (arr.length >= 6) arr[5] = arr[5].isNumericOnly ? arr[5] : '';
      if (arr.length >= 7) arr[6] = arr[6].isNumericOnly ? arr[6] : '';
    }

    plate = arr.join();

    if (includeHiphen && TwoLettersPlate.isValidPlate(plate)) {
      plate = plate.insertAt(2, '-');
    }

    if (includeHiphen && ThreeLettersPlate.isValidPlate(plate)) {
      plate = plate.insertAt(3, '-');
    }

    return TextEditingValue(
      text: plate,
      selection: TextSelection.collapsed(offset: plate.length),
    );
  }
}

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

    var simb = Get.localeNumberSymbols(locale!);
    if (simb != null) {
      newText = newText.removeWhere(
        (x) => x.isNotIn([
          ...Get.numberChars,
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
    var simb = Get.localeNumberSymbols(locale!);
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

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
