import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

extension DurationExtensions on Duration {
  String get formatted => getFormatted();

  string getFormatted({
    bool includeMilliseconds = false,
    bool includeMicroseconds = false,
  }) {
    var hours = inHours;
    var minutes = inMinutes.remainder(60);
    var seconds = inSeconds.remainder(60);
    var milliseconds = inMilliseconds.remainder(1000);
    var microseconds = inMicroseconds.remainder(1000);

    var formatted = "";
    if (hours > 0) {
      formatted += "$hours h ";
    }
    if (minutes > 0) {
      formatted += "$minutes min ";
    }
    if (seconds > 0) {
      formatted += "$seconds s ";
    }
    if (includeMilliseconds && milliseconds > 0) {
      formatted += "$milliseconds ms ";
    }
    if (includeMilliseconds && microseconds > 0) {
      formatted += "$microseconds µs";
    }
    return formatted.trim();
  }
}

extension NumExtensions2<T extends num> on T {
  Duration get days => Duration(
      days: floor(),
      hours: ((this % 1) * 24).floor(),
      minutes: (((this % 1) * 24 % 1) * 60).floor(),
      seconds: ((((this % 1) * 24 % 1) * 60 % 1) * 60).floor(),
      milliseconds: (((((this % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(),
      microseconds: ((((((this % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  /// Transform number of days into hours
  double get daysToHours {
    if (isNullOrZero) {
      return 0;
    } else {
      return (this * Duration.hoursPerDay).toDouble();
    }
  }

  /// Returns the value with a negative sign, regardless of its original sign.
  ///
  /// If the value is already negative, it returns the value itself.
  /// If the value is positive, it returns the negation of the value.
  ///
  /// Example:
  /// ```dart
  /// var num = 5;
  /// var result = num.forceNegative; // result is -5
  /// ```
  T get forceNegative => (-1 * this.forcePositive) as T;

  /// Returns the value unsigned, regardless of its original sign.
  ///
  /// If the value is already positive, it returns the value itself.
  /// If the value is negative, it returns the negation of the value.
  ///
  /// Example:
  /// ```dart
  /// var num = -5;
  /// var result = num.forcePositive; // result is 5
  /// ```
  T get forcePositive => this < 0 ? -this as T : this;

  /// Returns a formatted string representation of the file size.
  ///
  /// The file size is represented in bytes and is formatted as follows:
  /// - If the size is less than 1024 bytes, it is returned as is with the suffix "bytes".
  /// - If the size is between 1024 bytes (inclusive) and 1024^2 bytes (exclusive), it is converted to kilobytes (KB) and returned with two decimal places.
  /// - If the size is between 1024^2 bytes (inclusive) and 1024^3 bytes (exclusive), it is converted to megabytes (MB) and returned with two decimal places.
  /// - If the size is between 1024^3 bytes (inclusive) and 1024^4 bytes (exclusive), it is converted to gigabytes (GB) and returned with two decimal places.
  /// - If the size is between 1024^4 bytes (inclusive) and 1024^5 bytes (exclusive), it is converted to terabytes (TB) and returned with two decimal places.
  /// - If the size is greater than or equal to 1024^5 bytes, it is converted to petabytes (PB) and returned with two decimal places.
  ///
  /// Example:
  /// ```dart
  /// int fileSize = 1500;
  /// String formattedSize = fileSize.formatFileSize;
  /// print(formattedSize); // Output: "1.46 KB"
  /// ```
  string get formatFileSize {
    if (this < 1024) {
      return "$this bytes";
    } else if (this < pow(1024, 2)) {
      return "${(this / 1024).toStringAsFixed(2)} KB";
    } else if (this < pow(1024, 3)) {
      return "${(this / pow(1024, 2)).toStringAsFixed(2)} MB";
    } else if (this < pow(1024, 4)) {
      return "${(this / pow(1024, 3)).toStringAsFixed(2)} GB";
    } else if (this < pow(1024, 5)) {
      return "${(this / pow(1024, 4)).toStringAsFixed(2)} TB";
    } else {
      return "${(this / pow(1024, 5)).toStringAsFixed(2)} PB";
    }
  }

  bool get hasDecimal => this % 1 != 0;

  SizedBox get heightBox => SizedBox(height: toDouble());

  Duration get hours => Duration(
      hours: floor(),
      minutes: ((this % 1) * 60).floor(),
      seconds: (((this % 1) * 60 % 1) * 60).floor(),
      milliseconds: ((((this % 1) * 60 % 1) * 60 % 1) * 1000).floor(),
      microseconds: (((((this % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  /// Transform number of hours into days
  double get hoursToDays {
    // 24 hours = 1 day
    if (isNullOrZero) {
      return 0;
    } else {
      return (this * Duration.hoursPerDay).toDouble();
    }
  }

  /// Transform number of hours into minutes
  double get hoursToMinutes {
    if (isNullOrZero) {
      return 0;
    } else {
      return (this * Duration.minutesPerHour).toDouble();
    }
  }

  Duration get microseconds => Duration(microseconds: round());

  Duration get milliseconds => Duration(milliseconds: floor()) + Duration(microseconds: ((this % 1) * 1000).round());

  Duration get minutes =>
      Duration(minutes: floor(), seconds: ((this % 1) * 60).floor(), milliseconds: (((this % 1) * 60 % 1) * 1000).floor(), microseconds: ((((this % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  /// Transform number of minutes into hours
  double get minutesToHours {
    if (isNullOrZero) {
      return 0;
    } else {
      return this / Duration.minutesPerHour;
    }
  }

  Duration get seconds => Duration(seconds: floor(), milliseconds: ((this % 1) * 1000).floor(), microseconds: (((this % 1) * 1000 % 1) * 1000).round());

  /// Transform number of seconds into hours
  double get secondsToHours {
    if (isNullOrZero) {
      return 0;
    } else {
      return this / Duration.secondsPerHour;
    }
  }

  /// Transform number of seconds into minutes
  double get secondsToMinutes {
    if (isNullOrZero) {
      return 0;
    } else {
      return this / Duration.secondsPerMinute;
    }
  }

  SizedBox get squareBox => SizedBox.square(dimension: toDouble());

  Duration get weeks => Duration(
      days: (this * 7).floor(),
      hours: (((this * 7) % 1) * 24).floor(),
      minutes: ((((this * 7) % 1) * 24 % 1) * 60).floor(),
      seconds: (((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60).floor(),
      milliseconds: ((((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(),
      microseconds: (((((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  SizedBox get widthBox => SizedBox(width: toDouble());

  Duration get years => Duration(
      days: (this * 365.25).floor(),
      hours: (((this * 365.25) % 1) * 24).floor(),
      minutes: ((((this * 365.25) % 1) * 24 % 1) * 60).floor(),
      seconds: (((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60).floor(),
      milliseconds: ((((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(),
      microseconds: (((((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  /// Returns the smaller value between this value and [maxValue].
  ///
  /// If this value is smaller than [maxValue], it is returned.
  /// Otherwise, [maxValue] is returned.
  T clampMax(T maxValue) => ([this, maxValue]).min();

  /// Returns the larger value between this value and [minValue].
  ///
  /// If this value is larger than [minValue], it is returned.
  /// Otherwise, [minValue] is returned.
  T clampMin(T minValue) => ([this, minValue]).max();

  /// Clamps the value between [minValue] and [maxValue] and rotates it if necessary.
  ///
  /// If the value is greater than [maxValue], it will be rotated back to [minValue] and continue counting up.
  /// If the value is less than [minValue], it will be rotated forward to [maxValue] and continue counting down.
  /// If the value is within the range, it will be returned as is.
  ///
  /// Returns the clamped and rotated value.

  T clampRotate(T minValue, T maxValue) {
    var correct = minValue.compareAndSwap(maxValue);
    minValue = correct.first;
    maxValue = correct.last;
    var v = this;
    while (v > maxValue) {
      v = minValue + (v - maxValue) - 1 as T;
    }
    while (v < minValue) {
      v = maxValue - (minValue - v) + 1 as T;
    }
    return v;
  }

  Future delay([FutureOr Function()? callback]) async => Duration(milliseconds: round()).delay(callback);

  /// Finds the greatest common divisor between this integer and the given integer [other].
  ///
  /// The greatest common divisor is the largest positive integer that divides both this integer and [other] without leaving a remainder.
  ///
  /// Returns the greatest common divisor.
  int findGreatestCommonDivisor(int other) {
    int a = round();
    while (other != 0) {
      var t = other;
      other = a % other;
      a = t;
    }
    return a;
  }

  bool isBetween(num start, num end) => isGreaterThan(start) && isLowerThan(end);

  bool isBetweenOrEqual(num start, num end) => isBetween(start, end) || this.isEqual(start) || this.isEqual(end);

  bool isEqual(num b) => this == b;

 
  bool isGreaterThan(num b) => this > b;

 
  bool isLowerThan(num b) => this < b;

  /// Returns a formatted quantity text based on the provided parameters.
  ///
  /// The [plural] parameter represents the plural form of the quantity.
  /// The [singular] parameter represents the singular form of the quantity. It is optional and defaults to an empty string.
  /// The [includeNumber] parameter determines whether to include the quantity number in the text. It is optional and defaults to true.
  ///
  /// The method returns a string representing the formatted quantity text.
  String quantityText(String plural, [String singular = "", bool includeNumber = true]) {
    var pre = (includeNumber ? toString() : "");
    if (plural.length > 1) {
      if ((round() == 1 || round() == -1)) {
        pre = "$pre ${singular.ifBlank(plural.singular)}";
      } else {
        pre = "$pre $plural";
      }
    }
    return pre;
  }

  /// Returns a formatted quantity text based on the provided parameters.
  ///
  /// The [plural] parameter represents the plural form of the quantity.
  /// The [singular] parameter represents the singular form of the quantity. It is optional and defaults to an empty string.
  /// The [includeNumber] parameter determines whether to include the quantity number in the text. It is optional and defaults to true.
  ///
  /// The method returns a string representing the formatted quantity text.
  String quantityTextPt(String plural, [String singular = "", bool includeNumber = true]) {
    var pre = (includeNumber ? toString() : "");
    if (plural.length > 1) {
      if ((round() == 1 || round() == -1)) {
        pre = "$pre ${singular.ifBlank(plural.singularPt)}";
      } else {
        pre = "$pre $plural";
      }
    }
    return pre;
  }

  /// Num to locale currency with symbol or not
  String? toCurrency({bool? withSymbol, string? locale}) {
    if (withSymbol == false) {
      return NumberFormat.simpleCurrency(name: '', locale: locale).format(this).trim();
    } else {
      return NumberFormat.simpleCurrency(locale: locale).format(this).trim();
    }
  }

  /// Num to locale compact currency with symbol or not
  String? toCurrencyCompact({bool? withSymbol}) {
    if (isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false) {
        return NumberFormat.compactSimpleCurrency(name: '').format(this).trim();
      } else {
        return NumberFormat.compactSimpleCurrency().format(this).trim();
      }
    }
  }

  /// Num with specific fraction digits
  double toPrecision(int fractionDigits) {
    if (isNullOrZero) {
      return -1.0;
    } else {
      var mod = pow(10, fractionDigits.toDouble()).toDouble();
      return ((this * mod).round().toDouble() / mod);
    }
  }
}

/// Extension methods for nullable numbers.
extension NumNullExtensions<T extends num?> on T {
  /// Checks whether the number is a non-zero negative number.
  bool get isNonZeroNegative => this != null && this! < 0;

  /// Checks whether the number is a non-zero positive number.
  bool get isNonZeroPositive => this != null && this! > 0;

  /// Checks whether the number is 0 or null.
  bool get isNullOrZero => this == null || this == 0;

  /// Returns null if the number is 0, otherwise returns the number itself.
  T? get nullIfZero => this == 0 ? null : this;

  /// Returns a string representation of the number with a fixed length, including the decimal separator if needed.
  ///
  /// The [length] parameter specifies the total length of the resulting string.
  /// The [fill] parameter specifies the character used to fill the remaining space.
  /// The [fractionDigits] parameter specifies the number of digits after the decimal point.
  String? fixedLength(int length, {String fill = "0", int fractionDigits = 0}) => this?.toStringAsFixed(fractionDigits).padLeft(length, fill);

  /// Get the color of a number based on a map of color steps.
  /// if the number is less than the minimum key, the color of the minimum key is returned.
  /// if the number is greater than the maximum key, the color of the maximum key is returned.
  /// if the number is between two keys, the color is interpolated between the two colors.
  /// if the number is equal to a key, the color of the key is returned.
  /// if the number is null, the color is transparent.
  /// if the color step is empty, the color is computed by converting the int value into [Color] using the default constuctor .
  Color getColor([Map<T, Color> colorStep = const {}]) {
    if (this == null) {
      return Colors.transparent;
    }

    if (colorStep.isEmpty) {
      return Color(this!.round());
    }

    T x = this!;
    if (colorStep.containsKey(x)) {
      return colorStep[x]!;
    }

    if (x <= colorStep.keys.min()!) {
      return colorStep[colorStep.keys.min()]!;
    }

    if (x >= colorStep.keys.max()!) {
      return colorStep[colorStep.keys.max()]!;
    }

    num lowerKey = -1 as num;
    num upperKey = -1 as num;

    for (var key in colorStep.keys) {
      if (key! < x && (lowerKey == -1 || key > lowerKey)) {
        lowerKey = key;
      }
      if (key > x && (upperKey == -1 || key < upperKey)) {
        upperKey = key;
      }
    }

    Color lowerColor = colorStep[lowerKey]!;
    Color upperColor = colorStep[upperKey]!;

    double proportion = (x - lowerKey) / (upperKey - lowerKey);

    int mixChannel(int lower, int upper) => (lower + ((upper - lower) * proportion)).round();

    return Color.fromARGB(
      mixChannel(lowerColor.alpha, upperColor.alpha),
      mixChannel(lowerColor.red, upperColor.red),
      mixChannel(lowerColor.green, upperColor.green),
      mixChannel(lowerColor.blue, upperColor.blue),
    );
  }

  T percentOf(T total) {
    if (total == null || total == 0) {
      return 0 as T;
    } else {
      return (this! / total) as T;
    }
  }


  /// Returns the integer part of a decimal number into a Roman number.
  string toRoman() {
    if (this == null) {
      return "";
    }
    var n = this!.round();
    if (n < 1 || n > 3999) {
      return "";
    }
    var roman = "";
    var romanNumerals = {
      1000: "M",
      900: "CM",
      500: "D",
      400: "CD",
      100: "C",
      90: "XC",
      50: "L",
      40: "XL",
      10: "X",
      9: "IX",
      5: "V",
      4: "IV",
      1: "I",
    };
    for (var value in romanNumerals.keys) {
      while (n >= value) {
        roman += romanNumerals[value]!;
        n -= value;
      }
    }
    return roman;
  }
}
