import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
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

/// Logs a message to the console if the app is running in debug mode.
///
/// The [message] parameter is the message to be logged.
/// The [time] parameter is an optional timestamp for the log message.
/// The [sequenceNumber] parameter is an optional sequence number for the log message.
/// The [level] parameter is an optional level for the log message.
/// The [name] parameter is an optional name for the log message.
/// The [zone] parameter is an optional zone for the log message.
/// The [error] parameter is an optional error object associated with the log message.
/// The [stackTrace] parameter is an optional stack trace associated with the log message.
void consoleLog(
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
    log(message, time: time ?? now, sequenceNumber: sequenceNumber, level: level, name: name, zone: zone, error: error);
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

/// Checks if [object] has a valid value.
///
/// The following values are considered not valid:
/// - `objects` thats fail against a custom validation function (if provided);
/// - `NULL` objects, independent of type;
/// - [String]s that are empty, equal to "null" or have only white spaces;
/// - [num]s that are equal to `0`;
/// - [DateTime]s that are equal to `minDate`;
/// - [bool]s that are equal to `false`;
/// - [Iterable]s that are empty or have only invalid values;
/// - [Map]s that are empty or have only invalid values;
/// - Classes that implement [Validator]s that have validation errors;
/// - For other types, this method calls `toString()` and checks the result string against [isValid].
///
/// Returns `true` if the [object] is valid, `false` otherwise.
///
/// ### Example 1:
/// ```dart
/// var value = "Hello";
/// var isValid = isValid(value);
/// print(isValid); // Output: true
/// ```
///
/// ### Example 2:
/// ```dart
/// var number = 0;
/// var isValidNumber = isValid(number);
/// print(isValidNumber); // Output: false
/// ```
///
/// ### Example 3:
/// ```dart
/// var date = DateTime.now();
/// var isValidDate = isValid(date);
/// print(isValidDate); // Output: true
/// ```
///
/// ### Example 4:
/// ```dart
/// var list = [1, 2, 3];
/// var isValidList = isValid(list);
/// print(isValidList); // Output: true
/// ```
///
/// ### Example 5:
/// ```dart
/// var map = {'name': 'John', 'age': 30};
/// var isValidMap = isValid(map);
/// print(isValidMap); // Output: true
/// ```
/// ### Example 6:
/// ```dart
/// class Person implements Validator {
///  String name;
/// int age;
/// Person(this.name, this.age);
/// @override
/// List<String> validate() {
/// var errors = <String>[];
/// if (name.isEmpty) {
///   errors.add('Name is required');
/// }
/// if (age <= 0) {
///   errors.add('Age must be greater than 0');
/// }
///  return errors;
/// }
/// }
/// var person = Person('John', 30);
/// var isValidPerson = isValid(person);
/// print(isValidPerson); // Output: true
/// ```
///
bool isValid<T>(T? object, {bool Function(T?)? customValidator}) {
  try {
    if (customValidator != null) {
      return customValidator(object);
    }

    if (object == null) {
      return false;
    }
    if (object is String) {
      return object.nullIf((s) => s == null || s.trimAll.flatEqual("null")).isNotBlank;
    }
    if (object is bool) {
      return object;
    }
    if (object is num) {
      return object != 0;
    }
    if (object is DateTime) {
      return object > minDate;
    }

    if (object is Validator) {
      return object.validate().isEmpty;
    }

    if (object is Iterable) {
      var l = object;
      if (l.isEmpty) return false;
      for (var e in l) {
        if (isValid(e)) {
          return true;
        }
      }
      return false;
    }
    if (object is Map) {
      return object.isNotEmpty && object.values.isValid;
    }

    return object.toString().isValid;
  } catch (e) {
    consoleLog("IsValid => ", error: e);
    return false;
  }
}

/// Checks if the given [object] is not valid (see [isValid] function).
///
/// Returns `true` if the [object] is not valid, `false` otherwise.
bool isNotValid(dynamic object, {bool Function(dynamic)? customValidator}) => !isValid(object, customValidator: customValidator);

/// Converts a dynamic value to a flat string representation.
///
/// If the value is null, an empty string is returned.
/// If the value is a number, it is converted to a string.
/// If the value is a DateTime object, it is formatted as a string.
/// If the value is a boolean, it is converted to a string.
/// If the value is a Map or an Iterable, the values are joined with a comma.
/// The resulting string is then processed to remove diacritics,
/// convert to lowercase, and remove leading/trailing whitespace.
///
/// Returns the flat string representation of the value.
String flatString(dynamic value) {
  if (value == null) return '';
  if (value is num) value = value.toString();
  if (value is DateTime) value = value.format();
  if (value is bool) value = value.toString();
  if (value is Map) value = value.values.join(", ");
  if (value is Iterable) value = value.join(", ");
  return "$value".removeDiacritics.toLowerCase().trimAll;
}

/// Parses a value of type [T] to a value of type [R].
///
/// - If the value is `null`, returns `null`.
/// - If [value] is [R] returns the value as [R].
/// - If [R] is [DateTime], converts the value to a [DateTime] using the `toDate()` method.
/// - If [R] is [num], parses the value as a [num] using the `num.parse()` method.
/// - If [R] is [int], parses the value as an [int] using the `int.parse()` method.
/// - If [R] is [double], parses the value as a [double] using the `double.parse()` method.
/// - If [R] is [String], returns the value as a [String].
/// - If [R] is [bool], converts the value to a [bool] using the `asBool()` method.
/// - If [R] is [Widget], converts the value to a [Widget] using the `forceWidget()` method.
/// - If [R] is [Text], converts the value to a [Text] using the `asText()` method.
/// - If [R] is [List], converts the value to a [List] containing the value.
/// - if [R] is another type, returns the value as [R].
/// - If none of the above conditions are met, logs an error message and returns `null`.
R? parseTo<R>(dynamic value) {
  if (value == null) {
    return null;
  }
  consoleLog("Parsing from ${value.runtimeType} to $R");
  if (value is R) {
    return value as R?;
  } else if (R == DateTime) {
    return "$value".toDate() as R;
  } else if (R == num) {
    return num.parse("$value") as R;
  } else if (R == int) {
    return int.parse("$value") as R;
  } else if (R == double) {
    return double.parse("$value") as R;
  } else if (R == String) {
    return "$value" as R;
  } else if (R == bool) {
    return "$value".asBool() as R;
  } else if (R == Widget) {
    return (value as Object?).forceWidget() as R;
  } else if (R is Text) {
    return (value as Object?).asText() as R;
  } else if (R == List) {
    return [value] as R;
  } else {
    try {
      return value as R;
    } catch (e) {
      consoleLog("Cannot parse $value into $R", error: e);
    }
  }
  return null;
}
