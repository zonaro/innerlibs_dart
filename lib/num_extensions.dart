import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

extension NumExtensions<T extends num> on T {
  Widget get widthBox => SizedBox(width: double.tryParse(toString()));

  Widget get heightBox => SizedBox(height: double.tryParse(toString()));

  ///   print('+ wait for 2 seconds');
  ///   await 2000.delay();
  ///   print('- 2 seconds completed');
  ///   print('+ callback in 1.2sec');
  ///   1000.delay(() => print('- 1.2sec callback called'));
  ///   print('currently running callback 1.2sec');
  Future delay([FutureOr Function()? callback]) async => Future.delayed(
        Duration(milliseconds: round()),
        callback,
      );

  /// print(1.seconds + 200.milliseconds);
  /// print(1.hours + 30.minutes);
  /// print(1.5.hours);
  ///```
  Duration get milliseconds => Duration(microseconds: round());

  Duration get seconds => Duration(milliseconds: round());

  Duration get minutes => Duration(minutes: round());

  Duration get hours => Duration(hours: round());

  Duration get days => Duration(days: round());

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
    if ((round() == 1 || round() == -1)) {
      pre = "$pre ${singular.ifBlank(plural.singularPt)!}";
    } else {
      pre = "$pre $plural";
    }
    return pre;
  }

  String quantityText(String plural, [String singular = "", bool includeNumber = true]) {
    var pre = (includeNumber ? toString() : "");
    if ((round() == 1 || round() == -1)) {
      pre = "$pre ${singular.ifBlank(plural.singular)!}";
    } else {
      pre = "$pre $plural";
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

  /// Checks whether number is 0 or null
  bool get isNullOrZero {
    if (this == 0) {
      return true;
    } else {
      return false;
    }
  }
}
