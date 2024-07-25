import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

extension NumExtensions<T extends num> on T {
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

  SizedBox get widthBox => SizedBox(width: toDouble());

  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get squareBox => SizedBox.square(dimension: toDouble());

  Future delay([FutureOr Function()? callback]) async => Duration(milliseconds: round()).delay(callback);

  Duration get milliseconds => Duration(milliseconds: floor()) + Duration(microseconds: ((this % 1) * 1000).round());

  Duration get microseconds => Duration(microseconds: round());

  Duration get seconds => Duration(seconds: floor(), milliseconds: ((this % 1) * 1000).floor(), microseconds: (((this % 1) * 1000 % 1) * 1000).round());

  Duration get minutes => Duration(minutes: floor(), seconds: ((this % 1) * 60).floor(), milliseconds: (((this % 1) * 60 % 1) * 1000).floor(), microseconds: ((((this % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  Duration get hours => Duration(hours: floor(), minutes: ((this % 1) * 60).floor(), seconds: (((this % 1) * 60 % 1) * 60).floor(), milliseconds: ((((this % 1) * 60 % 1) * 60 % 1) * 1000).floor(), microseconds: (((((this % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  Duration get days => Duration(days: floor(), hours: ((this % 1) * 24).floor(), minutes: (((this % 1) * 24 % 1) * 60).floor(), seconds: ((((this % 1) * 24 % 1) * 60 % 1) * 60).floor(), milliseconds: (((((this % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(), microseconds: ((((((this % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  Duration get weeks => Duration(days: (this * 7).floor(), hours: (((this * 7) % 1) * 24).floor(), minutes: ((((this * 7) % 1) * 24 % 1) * 60).floor(), seconds: (((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60).floor(), milliseconds: ((((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(), microseconds: (((((((this * 7) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  Duration get years => Duration(days: (this * 365.25).floor(), hours: (((this * 365.25) % 1) * 24).floor(), minutes: ((((this * 365.25) % 1) * 24 % 1) * 60).floor(), seconds: (((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60).floor(), milliseconds: ((((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000).floor(), microseconds: (((((((this * 365.25) % 1) * 24 % 1) * 60 % 1) * 60 % 1) * 1000 % 1) * 1000).round());

  T get forcePositive => this < 0 ? -this as T : this;
  T get forceNegative => (-1 * this.forcePositive) as T;

  T lockMin(T minValue) => ([this, minValue]).max();
  T lockMax(T maxValue) => ([this, maxValue]).min();

  T lockBetween(T minValue, T maxValue) => lockMin(minValue).lockMax(maxValue);

  bool isLowerThan(num b) => this < b;

  bool isGreaterThan(num b) => this > b;

  bool isEqual(num b) => this == b;

  bool isBetween(num start, num end) => isGreaterThan(start) && isLowerThan(end);

  bool isBetweenOrEqual(num start, num end) => isBetween(start, end) || this == start || this == end;

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

  int findGreatestCommonDivisor(int b) {
    int a = round();
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  bool get hasDecimal => this % 1 != 0;

  /// Num to locale currency with symbol or not
  String? toCurrency({bool? withSymbol}) {
    if (isNullOrZero) {
      return null;
    } else {
      if (withSymbol == false) {
        return NumberFormat.simpleCurrency(name: '').format(this).trim();
      } else {
        return NumberFormat.simpleCurrency().format(this).trim();
      }
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

  /// Transform number of days into hours
  double get daysToHours {
    if (isNullOrZero) {
      return -1;
    } else {
      return (this * Duration.hoursPerDay).toDouble();
    }
  }

  /// Transform number of minutes into hours
  double get minutesToHours {
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.minutesPerHour;
    }
  }

  /// Transform number of seconds into hours
  double get secondsToHours {
    // 3600 seconds = 1 hour
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.secondsPerHour;
    }
  }

  /// Transform number of hours into days
  double get hoursToDays {
    // 24 hours = 1 day
    if (isNullOrZero) {
      return -1;
    } else {
      return (this * Duration.hoursPerDay).toDouble();
    }
  }

  /// Transform number of seconds into minutes
  double get secondsToMinutes {
    // 60 seconds = 1 minute
    if (isNullOrZero) {
      return -1;
    } else {
      return this / Duration.secondsPerMinute;
    }
  }

  /// Transform number of hours into minutes
  double get hoursToMinutes {
    // 60 seconds = 1 minute
    if (isNullOrZero) {
      return -1;
    } else {
      return (this * Duration.minutesPerHour).toDouble();
    }
  }
}

/// Extension methods for nullable numbers.
extension NumNullExtensions<T extends num?> on T {
  /// Checks whether the number is 0 or null.
  bool get isNullOrZero => this == null || this == 0;

  /// Returns null if the number is 0, otherwise returns the number itself.
  T? get nullIfZero => this == 0 ? null : this;

  /// Checks whether the number is a non-zero positive number.
  bool get isNonZeroPositive => this != null && this! > 0;

  /// Checks whether the number is a non-zero negative number.
  bool get isNonZeroNegative => this != null && this! < 0;

  /// Returns a string representation of the number with a fixed length.
  ///
  /// The [length] parameter specifies the total length of the resulting string.
  /// The [fill] parameter specifies the character used to fill the remaining space.
  /// The [fractionDigits] parameter specifies the number of digits after the decimal point.
  String? fixedLength(int length, {String fill = "0", int fractionDigits = 0}) => this?.toStringAsFixed(fractionDigits).padLeft(length, fill);
}

extension DurationExtensions on Duration {
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

  String get formatted => getFormatted();

  /// Delay a function for the duration
  Future delay([FutureOr Function()? callback]) async => Future.delayed(
        this,
        callback,
      );
}
