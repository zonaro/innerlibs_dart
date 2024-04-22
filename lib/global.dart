import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:innerlibs/innerlibs.dart';

bool get isDesktop => (isMacOS || isWindows || isLinux);

bool get isMobile => (isIOS || isAndroid);

bool get isGoogle => (isAndroid || isFuchsia);

bool get isApple => (isIOS || isMacOS);

bool get isWeb => kIsWeb;
bool get isMacOS => !isWeb && Platform.isMacOS;
bool get isIOS => !isWeb && Platform.isIOS;
bool get isWindows => !isWeb && Platform.isWindows;
bool get isAndroid => !isWeb && Platform.isAndroid;
bool get isFuchsia => !isWeb && Platform.isFuchsia;
bool get isLinux => !isWeb && Platform.isLinux;

Brightness get brightness => SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool get isDarkMode => brightness == Brightness.dark;
bool get isLightMode => brightness == Brightness.light;

DateTime get minDate => DateTime.utc(1970, 1, 1);
DateTime get maxDate => DateTime.utc(9999, 12, 31, 23, 59, 59);

date get now => DateTime.now();
date get today => DateTime(thisYear, now.month, now.day);
date get tomorrow => now.add(1.days);
date get yesterday => now.subtract(1.days);

date get lastWeek => now.lastDayOfWeek - 7.days;
int get thisYear => now.year;

consoleLog(
  String message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
}) {
  if (kDebugMode) {
    log(message, time: time, sequenceNumber: sequenceNumber, level: level, name: name, zone: zone, error: error);
  }
}

/// Returns the value associated with the highest breakpoint that is less than or equal to the given [value].
///
/// The [breakpoints] map contains key-value pairs where the keys are comparable values (e.g., numeric values)
/// representing breakpoints, and the corresponding values are the associated values for those breakpoints.
///
/// If the [breakpoints] map is empty, an [ArgumentError] is thrown with a descriptive message.
///
/// Example usage:
/// ```dart
/// final breakpoints = {
///   0: 'Small',
///   768: 'Medium',
///   1024: 'Large',
/// };
///
/// final screenWidth = 800;
/// final breakpointValue = getBreakpointValue(screenWidth, breakpoints);
/// print('Screen size: $breakpointValue'); // Output: 'Screen size: Medium'
/// ```
///
/// Throws an [ArgumentError] if [breakpoints] is empty.
T getBreakpointValue<V extends Comparable, T>(V value, Map<V, T> breakpoints) {
  if (breakpoints.isEmpty) throw ArgumentError.value(breakpoints, "breakpoints", "You need to provide ate least one value");
  var items = breakpoints.entries.toList();
  items.sort((a, b) => a.key.compareTo(b.key));
  T? highestValue;
  for (final entry in items) {
    if (entry.key.compareTo(value) < 0) {
      highestValue = entry.value;
    } else {
      break;
    }
  }
  return highestValue ?? items.first.value;
}
