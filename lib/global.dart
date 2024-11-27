import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math' show Random, min, max;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

final _random = Random();

bool get isAndroid => GetPlatform.isAndroid;
bool get isApple => (isIOS || isMacOS);
bool get isDesktop => (isMacOS || isWindows || isLinux);
bool get isFuchsia => GetPlatform.isFuchsia;
bool get isGoogle => (isAndroid || isFuchsia);
bool get isIOS => GetPlatform.isIOS;
bool get isLinux => GetPlatform.isLinux;
bool get isMacOS => GetPlatform.isMacOS;
bool get isMobile => (isIOS || isAndroid);
bool get isNativeAndroid => isAndroid && !isWeb;
bool get isNativeApple => isApple && !isWeb;
bool get isNativeDesktop => isDesktop && !isWeb;
bool get isNativeFuchsia => isFuchsia && !isWeb;
bool get isNativeGoogle => isGoogle && !isWeb;
bool get isNativeIOS => isIOS && !isWeb;
bool get isNativeLinux => isLinux && !isWeb;
bool get isNativeMacOS => isMacOS && !isWeb;
bool get isNativeMobile => isMobile && !isWeb;
bool get isNativeWindows => isWindows && !isWeb;
bool get isPlatformDarkMode => platformBrightness == Brightness.dark;
bool get isPlatformLightMode => platformBrightness == Brightness.light;
bool get isWeb => GetPlatform.isWeb;
bool get isWindows => GetPlatform.isWindows;

/// Returns a date representing the last week.
date get lastWeek => now.lastDayOfWeek - 7.days;

/// Returns the maximum date value.
date get maxDate => DateTime.utc(9999, 12, 31, 23, 59, 59);

/// Returns the minimum date value.
date get minDate => DateTime.fromMicrosecondsSinceEpoch(0);

/// Returns the current date and time.
date get now => DateTime.now();

/// Returns the platform brightness of the device.
Brightness get platformBrightness => platformDispatcher.platformBrightness;

/// Returns the platform dispatcher of the device.
PlatformDispatcher get platformDispatcher => PlatformDispatcher.instance;

/// Returns the locale of the platform.
Locale get platformLocale => platformDispatcher.locale;

/// Returns the language code of the platform locale.
String get platformLocaleCode => platformLocale.toLanguageTag();

// Returns the list of locales that user defined in the system settings.
Iterable<Locale> get platformLocales => platformDispatcher.locales;

/// Returns the current year
int get thisYear => now.year;

/// Returns the date representing today.
date get today => now.beginOfDay;

/// Returns the date representing tomorrow.
date get tomorrow => today.add(1.days);

/// Returns the date representing yesterday.
date get yesterday => today.subtract(1.days);

/// Returns the [IconData] associated with the given app [category].
IconData categoryIcon(String category) {
  final Map<String, IconData> categoryIcons = {
    "audio": Icons.audiotrack,
    "book": Icons.book,
    "books": Icons.book,
    "business": Icons.business,
    "communication": Icons.chat,
    "drink": Icons.local_drink,
    "education": Icons.school,
    "entertainment": Icons.movie,
    "finance": Icons.monetization_on,
    "fitness": Icons.fitness_center,
    "food": Icons.fastfood,
    "game": Icons.games,
    "games": Icons.games,
    "health": Icons.fitness_center,
    "home": Icons.home,
    "house": Icons.home,
    "image": Icons.image,
    "images": Icons.image,
    "lifestyle": Icons.favorite,
    "local": Icons.map,
    "magazines": Icons.article,
    "magazine": Icons.article,
    "map": Icons.map,
    "maps": Icons.map,
    "medical": Icons.local_hospital,
    "message": Icons.chat,
    "messages": Icons.chat,
    "music": Icons.music_note,
    "navigation": Icons.map,
    "nature": Icons.nature,
    "news": Icons.article,
    "personalization": Icons.palette,
    "photography": Icons.camera,
    "picture": Icons.image,
    "pictures": Icons.image,
    "productivity": Icons.work,
    "settings": Icons.settings,
    "shopping": Icons.shopping_cart,
    "social": Icons.people,
    "sports": Icons.sports,
    "tools": Icons.build,
    "travel": Icons.airplanemode_active,
    "utilities": Icons.settings,
    "video": Icons.video_library,
    "weather": Icons.wb_sunny,
    "work": Icons.work,
  };
  return category.getUniqueWords.whereValid.map((x) => categoryIcons[x.toLowerCase()]).mostFrequent ?? Icons.category;
}

/// Try change a value of any type into a value of type [R].
///
/// - If the value is `null`, returns `null` if R is nullable otherwise throws an exception.
/// - If [value] is [R] returns the value as is.
/// - If [R] is [DateTime], converts the value to a [DateTime] using the `toDate()` method.
/// - If [R] is [num], parses the value as a [num] using the `num.parse()` method.
/// - If [R] is [int], parses the value as an [int] using the `int.parse()` method.
/// - If [R] is [double], parses the value as a [double] using the `double.parse()` method.
/// - If [R] is [String], returns the value as a [String] using `jsonEncode()`.
/// - If [R] is [bool], converts the value to a [bool] using the `asBool()` method.
/// - If [R] is [Widget], converts the value to a [Widget] using the `forceWidget()` method.
/// - If [R] is [Text], converts the value to a [Text] using the `asText()` method.
/// - If [R] is [List], converts the value to a [List] containing the value.
/// - if [R] is another type, try returns the value as [R].
/// - If none of the above conditions are met, throws an exception.
///
/// if [locale] is provided, it is used to format and parse numbers and dates.
R changeTo<R>(dynamic value, [String? locale]) {
  locale = locale?.nullIfBlank;
  if (value is R) return value;
  if (value != null) {
    // consoleLog("Changing $value from ${value.runtimeType} to $R");
    NumberFormat? nf = locale == null ? null : NumberFormat(null, locale);
    if (isSameType<R, DateTime>()) {
      if (value is num) return DateTime.fromMillisecondsSinceEpoch(value.round()) as R;
      if (locale == null) return date.parse("$value") as R;
      return "$value".toDate(null, locale) as R;
    } else if (isSameType<R, int>()) {
      if (value is DateTime) {
        return changeTo(value.millisecondsSinceEpoch, locale);
      } else if (value is num) {
        return value.toInt() as R;
      } else {
        return int.parse("$value".ifBlank("0").onlyNumbers) as R;
      }
    } else if (isSameType<R, double>()) {
      if (value is DateTime) {
        return changeTo(value.millisecondsSinceEpoch, locale);
      } else if (value is num) {
        return value.toDouble() as R;
      } else {
        return (nf?.tryParse(changeTo(value, locale))?.toDouble() ?? double.parse(changeTo<string>(value, locale).ifBlank("0").removeLetters)) as R;
      }
    } else if (isSameType<R, num>()) {
      if (value is DateTime) {
        return changeTo(value.millisecondsSinceEpoch, locale);
      } else {
        return (nf?.tryParse(changeTo(value, locale)) ?? num.parse(changeTo<string>(value, locale).ifBlank("0").removeLetters)) as R;
      }
    } else if (isSameType<R, Color>()) {
      if (value is num) {
        return Color(value.round()) as R;
      }
      if (value is NamedColor) {
        return value as R;
      }
      return changeTo<string>(value).asColor as R;
    } else if (isSameType<R, String>()) {
      if (value is DateTime) {
        return value.format() as R;
      } else if (value is Duration) {
        return value.formatted as R;
      } else if (value is num) {
        return (nf?.format(value) ?? "$value") as R;
      } else if (value is Color) {
        return value.hexadecimal as R;
      } else if (value is Uri) {
        return value.toString() as R;
      } else if (value is Widget) {
        return value.text as R;
      } else if (value is List) {
        return jsonEncode(value) as R;
      } else if (value is Map) {
        return jsonEncode(value) as R;
      } else {
        return "$value" as R;
      }
    } else if (isSameType<R, bool>()) {
      return "$value".asBool() as R;
    } else if (isSameType<R, Uri>()) {
      return Uri.parse("$value") as R;
    } else if (isSameType<R, Widget>()) {
      return forceWidget(value) as R;
    } else if (isSameType<R, Text>()) {
      return (value as Object?).asNullableText() as R;
    } else if (isSameType<R, List>()) {
      return forceList(value) as R;
    }
  } else {
    if (isNullable<R>()) {
      return null as R;
    } else if (isSameType<R, string>()) {
      return "" as R;
    } else if (isSameType<R, bool>()) {
      return false as R;
    } else if (isSameType<R, int>()) {
      return 0 as R;
    } else if (isSameType<R, num>()) {
      return 0.0 as R;
    } else if (isSameType<R, double>()) {
      return 0.0 as R;
    } else if (isSameType<R, DateTime>()) {
      return minDate as R;
    } else if (isSameType<R, List>()) {
      return [] as R;
    } else if (isSameType<R, Text>()) {
      return const Text("") as R;
    } else if (isSameType<R, Widget>()) {
      return nil as R;
    } else if (isSameType<R, Color>()) {
      return Colors.transparent as R;
    } else if (isSameType<R, Uri>()) {
      return Uri.parse("http://localhost:80") as R;
    }
  }
  throw Exception("Incompatible conversion");
}

/// Logs a object to the console if the app is running in debug mode.
///
/// The [message] parameter is a object or the message to be logged.
/// The [time] parameter is an optional timestamp for the log message.
/// The [sequenceNumber] parameter is an optional sequence number for the log message.
/// The [level] parameter is an optional level for the log message.
/// The [name] parameter is an optional name for the log message.
/// The [zone] parameter is an optional zone for the log message.
/// The [error] parameter is an optional error object associated with the log message.
/// The [stackTrace] parameter is an optional stack trace associated with the log message.
T consoleLog<T>(
  T message, {
  DateTime? time,
  int? sequenceNumber,
  int level = 0,
  String name = '',
  Zone? zone,
  Object? error,
  StackTrace? stackTrace,
}) {
  if (kDebugMode) {
    if (T == Exception && error == null) error = message;
    log(changeTo(message), time: time ?? now, sequenceNumber: sequenceNumber, level: level, name: name, zone: zone, error: error);
  }
  return message;
}

/// Converts a dynamic value to a flat string representation.
///
/// - If the value is null, an empty string is returned.
/// - If the value is a number, it is converted to a string.
/// - If the value is a DateTime object, it is formatted as a string.
/// - If the value is a boolean, it is converted to a string.
/// - If the value is a Map or an Iterable, the values are joined with a comma.
///
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
  if (value is Widget) value = value.text;
  return "$value".removeDiacritics.toLowerCase().trimAll;
}

/// Ensure the given [item] is a List.
///
/// If [item] is `null`, an empty list is returned.
/// If [item] is already a Iterable, a copy of items is returned in list.
/// Otherwise, [item] is wrapped in a list and returned.
List<dynamic> forceList(dynamic item) {
  return [
    if (item != null)
      if (item is Iterable) ...item else item
  ];
}

/// Ensure the given [item] is a List of type [T].
///
/// If [item] is `null`, an empty list is returned.
/// If [item] is already a List, a copy of items converted into [T] is returned.
/// Otherwise, return [item] converted into [T] and wrapped in a list.
List<T> forceListOf<T>(dynamic item) => forceList(item).map((e) => changeTo<T>(e)).toList();

/// Ensure the given [item] is a List.
///
/// If [item] is `null`, an empty list is returned.
/// If [item] is already a Iterable, a copy of items is returned in list.
/// If any item in the [item] is an Iterable, it is expanded into the list recursively.
/// Otherwise, [item] is wrapped in a list and returned.
List<dynamic> forceRecursiveList(dynamic item) {
  var list = <dynamic>[];
  if (item != null) {
    if (item is Iterable) {
      for (var e in item) {
        list.addAll(forceRecursiveList(e));
      }
      return list;
    } else {
      list.add(item);
    }
  }
  return list;
}

List<T> forceRecursiveListOf<T>(dynamic item) => forceRecursiveList(item).map((e) => changeTo<T>(e)).toList();

Set forceRecursiveSet(dynamic item) => forceRecursiveList(item).toSet();

Set<T> forceRecursiveSetOf<T>(dynamic item) => forceRecursiveListOf<T>(item).toSet();

/// Converts a dynamic value to a [Set].
Set forceSet(dynamic item) => forceList(item).toSet();

/// Converts a dynamic value to a [Set] of type [T].
Set<T> forceSetOf<T>(dynamic item) => forceListOf<T>(item).toSet();

/// A utility extension method that allows forcing a widget to be returned,
/// with optional customization of its properties.
///
/// This method can be used on any object, and it will return a [Widget] if the object
/// is already a widget, or it will convert the object to a [Text] widget with the provided
/// customizations if the object is a [Text]. If the object is neither a [Widget] nor a [Text],
/// it will be converted to a [Text] widget using the [asNullableText] method.
///
/// The optional parameters can be used to customize the properties of the returned widget,
/// such as the [style], [textAlign], [maxLines], etc.
///
/// ## Example 1:
/// ```dart
/// Text myText = Text('Hello');
/// Widget myWidget = myText.forceWidget(style: TextStyle(fontSize: 16));
/// ```
/// ## Example 2:
/// ```dart
/// Text anotherText = Text('Welcome');
/// Widget anotherWidget = anotherText.forceWidget(
///   style: TextStyle(fontSize: 20),
///   textAlign: TextAlign.center,
/// );
/// ```
/// ## Example 3:
/// ```dart
/// String myString = 'Hello World';
/// Widget myStringWidget = myString.forceWidget(
///   style: TextStyle(color: Colors.blue),
///   defaultText: 'No text provided',
/// );
/// ```
/// ## Example 4:
/// ```dart
/// int myNumber = 42;
/// Widget myNumberWidget = myNumber.forceWidget(
///   style: TextStyle(fontWeight: FontWeight.bold),
///   defaultText: 'No number provided',
/// );
/// ```
/// ## Example 5:
/// ```dart
/// bool myBool = true;
/// Widget myBoolWidget = myBool.forceWidget(
///   style: TextStyle(fontStyle: FontStyle.italic),
///   defaultText: 'No boolean provided',
/// );
/// ```
/// ## Example 6:
/// ```dart
/// double myDouble = 3.14;
/// Widget myDoubleWidget = myDouble.forceWidget(
///   style: TextStyle(color: Colors.red),
///   defaultText: 'No double provided',
/// );
/// ```
/// ## Example 7:
/// ```dart
/// List<String> myList = ['Apple', 'Banana', 'Orange'];
/// Widget myListWidget = myList.forceWidget(
///   style: TextStyle(color: Colors.green),
///   defaultText: 'No list provided',
/// );
/// ```
/// ## Example 8:
/// ```dart
/// Map<String, int> myMap = {'Apple': 1, 'Banana': 2, 'Orange': 3};
/// Widget myMapWidget = myMap.forceWidget(
///   style: TextStyle(color: Colors.orange),
///   defaultText: 'No map provided',
/// );
/// ```
/// ## Example 9:
/// ```dart
/// DateTime myDateTime = DateTime.now();
/// Widget myDateTimeWidget = myDateTime.forceWidget(
///   style: TextStyle(color: Colors.purple),
///   defaultText: 'No date provided',
/// );
/// ```
/// ## Example 10:
/// ```dart
/// Object myObject = Object();
/// Widget myObjectWidget = myObject.forceWidget(
///   style: TextStyle(color: Colors.yellow),
///   defaultText: 'No object provided',
/// );
/// ```
Widget? forceWidget(dynamic item, {TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, TextScaler? textScaler, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, bool validate = true, String? defaultText, BoxFit? fit, AlignmentGeometry? alignment, ResponsiveColumn? columnSizes}) {
  if (item == null) return null;
  if (item is Widget) return item;
  if (item is ResponsiveColumn) return item.child;

  if (item is Iterable) {
    return ResponsiveRow.withAutoColumns(
      children: item.map((e) {
        dynamic w = forceWidget(e, style: style, strutStyle: strutStyle, textAlign: textAlign, textDirection: textDirection, locale: locale, softWrap: softWrap, overflow: overflow, textScaler: textScaler, maxLines: maxLines, semanticsLabel: semanticsLabel, textWidthBasis: textWidthBasis, validate: validate, defaultText: defaultText, fit: fit, alignment: alignment);
        if (columnSizes != null) w = ResponsiveColumn.copy(columnSizes, child: w);
        return w;
      }).toList(),
    );
  }

  if (item is IconData) {
    return (item).asIcon(
      size: style?.fontSize,
      color: style?.color,
      applyTextScaling: textScaler != null,
      weight: style?.fontWeight?.value.toDouble(),
      semanticLabel: semanticsLabel ?? defaultText,
      shadows: style?.shadows,
      textDirection: textDirection,
    );
  }

  if (item is ImageProvider) {
    return Image(
      image: item,
      fit: fit,
      semanticLabel: semanticsLabel,
      alignment: alignment ?? Alignment.center,
      color: style?.color,
    );
  }

  textAlign ??= alignment?.toTextAlign;

  return (item as Object?).asNullableText(
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaler: textScaler,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    validate: validate,
    defaultText: defaultText,
  );
}

/// Generates a keyword from the given [value].
///
/// The generated keyword is based on the [value] and can be customized using optional parameters.
///
/// Optional Parameters:
/// - [splitCamelCase]: Whether to split camel case words in the generated keyword. Default is `true`.
/// - [removeWordSplitters]: Whether to remove word splitters in the generated keyword. Default is `true`.
/// - [removeDiacritics]: Whether to remove diacritics in the generated keyword. Default is `true`.
/// - [forceLowerCase]: Whether to force the generated keyword to be in lowercase. Default is `true`.
///
/// Returns the generated keyword as a [String].

String generateKeyword(
  dynamic value, {
  bool splitCamelCase = true,
  bool removeWordSplitters = true,
  bool removeDiacritics = true,
  bool forceLowerCase = true,
}) {
  if (value == null) return "";

  if (value is DateTime) value = value.format();
  if (value is Map) value = value.values.join(", ");
  if (value is Iterable) value = value.join(", ");

  String keyword = value.toString();

  if (splitCamelCase) {
    keyword = keyword.camelSplitString;
  }

  if (removeWordSplitters) {
    keyword = keyword.removeWordSplitters;
  }

  if (removeDiacritics) {
    keyword = keyword.removeDiacritics;
  }

  if (forceLowerCase) {
    keyword = keyword.toLowerCase();
  }

  return keyword;
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

/// Generates a arrow or ident string with a specified length and pattern.
///
/// - The `length` parameter specifies the lenght of arrow (in characters).
/// - The `pattern` parameter specifies the pattern of the arrows.
/// - If the `pattern` is empty, an empty string is returned.
/// - If the `length` is 0, an empty string is returned.
/// - If the `length` is negative, the positive value of `length` is used and the pattern is reversed.
/// - If the `pattern` has a length of 1, the pattern is repeated `length` times.
/// - If the `pattern` has a length of 2, the first character is repeated `length - 1` times, followed by the second character.
/// - If the `pattern` has a length greater than 2, the first and last characters are preserved, and the middle characters are repeated until the length is reached.
/// - The default pattern is a space character (ident).
/// Returns the generated arrow or ident string.
String identArrow({required int length, String pattern = " "}) {
  if (pattern.isEmpty) {
    return "";
  }
  if (length == 0) {
    return "";
  }
  bool reverse = length < 0;

  length = length.forcePositive;

  if (pattern.length == 1) {
    pattern = pattern * (length);
  } else {
    String first = pattern.first();
    String last = pattern.last();
    if (pattern.length == 2) {
      pattern = (first * (length - 1)) + last;
    } else {
      var middle = pattern.removeFirst().removeLast();
      var i = 0;
      while (middle.length < length - 2) {
        if (i >= middle.length) i = 0;
        middle += middle.charAt(i);
        i++;
      }
      pattern = first + middle + last;
    }
  }
  if (reverse) pattern = pattern.toArray.map((x) => x.getOppositeWrap).reverse().join();
  return pattern;
}

/// Initializes the inner libraries.
/// - Ensures that the Flutter binding is initialized.
/// - Finds the system locale.
/// - Initializes date formatting using the system locale.
Future<void> innerLibsInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  var location = await findSystemLocale();
  await initializeDateFormatting(location);
}

/// Checks if the given [object] is not valid (see [isValid] function).
///
/// Returns `true` if the [object] is not valid, `false` otherwise.
bool isNotValid<T>(T object, {Iterable<bool> Function(T?)? customValidator}) => !isValid(object, customValidator: customValidator);

/// Checks if the types `T` is nullable (equal T?)
bool isNullable<T>() => typeOf<T?>() == typeOf<T>();

/// Checks if the types `T` and `S` are equal. Ignore nullability.
///
/// Returns `true` if the types `T` and `S` are equal, otherwise returns `false`.
bool isSameType<T, S>() => typeOf<T>() == typeOf<S?>() || typeOf<T>() == typeOf<S>() || typeOf<T?>() == typeOf<S?>() || typeOf<T?>() == typeOf<S>();

/// Checks if [object] has a valid value.
///
/// The following values are considered not valid:
/// - `objects` thats fail against a custom validation functions (if provided). The custom validation function must return a list of booleans. If at least one of the booleans is `true`, the object is considered valid.;
/// - `NULL` objects, independent of type;
/// - [String]s that are empty, equal to "null" or have only white spaces;
/// - [num]s that are equal to `0`;
/// - [DateTime]s that are equal to `minDate`;
/// - [LatLng]s that are null or equal to (0,0);
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
bool isValid<T>(T? object, {Iterable<bool> Function(T?)? customValidator}) {
  try {
    if (customValidator != null) {
      return customValidator(object).contains(true);
    }
    if (object == null) {
      return false;
    }
    if (object is Validator) {
      return object.validate().isEmpty;
    }
    if (object is String) {
      return object.nullIf((s) => "$s".trimAll.flatEqualAny(["null", ""])) != null;
    }
    if (object is bool) {
      return object;
    }
    if (object is num) {
      return object != 0 && object.isNaN == false;
    }
    if (object is DateTime) {
      return object > minDate;
    }

    if (object is LatLng) {
      return object.latitude.isValid() && object.longitude.isValid();
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
      return object.isNotEmpty && object.values.isValid();
    }

    return object.toString().isValid();
  } catch (e) {
    consoleLog("IsValid => $e", error: e);
    return false;
  }
}

bool randomBool() => _random.nextBool();

/// Generates a random boolean value based on the specified [trueFactor].
/// The [trueFactor] is a percentage value between 1 and 100 that determines the likelihood of the boolean being true.
bool randomBoolWithFactor([int trueFactor = 50]) => trueFactor <= 0 ? false : randomInt(1, 100) <= trueFactor.clamp(1, 100);

/// Generates a random double between the specified [min] and [max] values.
double randomDouble([double min = 0, double max = 999999]) {
  var n = min.compareAndSwap(max);
  min = n.first;
  max = n.last;
  return min + _random.nextDouble() * (max - min);
}

/// Generates a random integer between the specified [min] and [max] values.
int randomInt([int min = 0, int max = 999999]) {
  var n = min.compareAndSwap(max);
  min = n.first;
  max = n.last;
  return min + _random.nextInt(max - min + 1);
}

/// Generates a random double between the specified [min] and [max] percent values.
double randomPercent([int min = 0, int max = 100]) => randomInt(min.clamp(0, 100), max.clamp(0, 100)) / 100;

/// Generates a random string of the specified [length].
/// The generated string consists of random alphanumeric and special characters.
String randomString([int length = 10]) {
  var chars = [...Get.alphaNumericChars, Get.specialChars];
  return List.generate(length, (index) => [randomInt(0, chars.length - 1)]).join();
}

/// Generates a random string of the specified [length].
/// If the [length] is not provided, a random length between 2 and 15 is used.
/// The generated string consists of random consonants and vowels in a pronounceable order.
String randomWord([int length = 0]) {
  length = length < 1 ? randomInt(2, 15) : length;
  String word = '';

  if (length == 1) {
    return Get.lowerVowels.randomItem!;
  }

  while (word.length < length) {
    String consonant = Get.lowerConsonants.randomItem!;
    if (consonant == 'q' && word.length + 3 <= length) {
      word += 'qu';
    } else {
      while (consonant == 'q') {
        consonant = Get.lowerConsonants.randomItem!;
      }
      if (word.length + 1 <= length) {
        word += consonant;
      }
    }

    if (word.length + 1 <= length) {
      word += Get.lowerVowels.randomItem!;
    }
  }

  return word;
}

///Shows a [SnackBar] with the given [content] in the current [Scaffold].
///If the [content] is a [String], it will be converted to a [Text] widget. If the [content] is not a [SnackBar] and is a [Widget], it will be wrapped in a [SnackBar] widget. If the [content] is a [SnackBar], it will be shown. If none of the above conditions are met, the [content] will be converted to a [String] and shown as a [SnackBar].
///Returns the [ScaffoldFeatureController] for the shown [SnackBar].
ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBar(dynamic content) => Get.context?.showSnackBar(content);

/// Calculates the size based on the aspect ratio and optional width and height.
///
/// If both [width] and [height] are provided, it returns a [Size] object with the specified width and height.
/// If only [width] is provided, it calculates the height based on the aspect ratio and returns a [Size] object with the specified width and calculated height.
/// If only [height] is provided, it calculates the width based on the aspect ratio and returns a [Size] object with the calculated width and specified height.
/// If neither [width] nor [height] is provided, it returns a [Size] object based on the aspect ratio.
///
/// Throws an [ArgumentError] if the aspect ratio format is invalid.
///
/// - `aspectRatio`: The aspect ratio in string format.
/// - `width`: The optional width.
/// - `height`: The optional height.
///
/// Returns a [Size] object representing the calculated size.
Size sizeFromAspect({required String aspectRatio, double? width, double? height}) {
  if (width != null && height != null) {
    return Size(width, height);
  }

  Size size = aspectRatio.toSize;

  if (size.width <= 0 && size.height <= 0) {
    throw ArgumentError('Invalid aspect ratio format.');
  }

  if (width != null) {
    return Size(width, width / max(size.width, size.height) * min(size.width, size.height));
  } else if (height != null) {
    return Size(height / min(size.width, size.height) * max(size.width, size.height), height);
  } else {
    return size;
  }
}

/// Returns the type of [T].
Type typeOf<T>() => T;

/// Validates a value of type [T] using a list of validation functions.
/// The [value] is considered valid if at least one of the validation functions returns `true`.
/// If the value is valid, it is returned; otherwise, `null` is returned.
T? valid<T>(T value, List<bool> Function(T?)? validations, [string? throwErrorMessage]) => isValid(value, customValidator: validations)
    ? value
    : throwErrorMessage.isNotBlank
        ? throw Exception(throwErrorMessage)
        : null;

typedef KeyCharSearches<T> = Map<string, bool Function(string search, T item)>;

/// A mixin that provides various filter functions for searching and filtering data.
///
/// This mixin contains static methods that can be used to transform strings, count search results,
/// perform Levenshtein distance calculations, and apply filters based on search terms.
extension FilterFunctions on GetInterface {
  /// Calculates the Jaro similarity score between an item and a list of search terms.
  ///
  /// The Jaro similarity score is a measure of the similarity between two strings.
  /// This function takes an item, a list of search terms, and various options to customize the comparison.
  /// It returns the sum of the Jaro similarity scores between the item and each search term.
  ///
  /// - The [searchTerms] parameter is an iterable of search terms to compare against the item.
  /// - The [searchOn] parameter is a function that takes the item and returns an iterable of values to search on.
  /// - The [ignoreCase] parameter specifies whether to ignore case when comparing strings (default is true).
  /// - The [ignoreDiacritics] parameter specifies whether to ignore diacritics when comparing strings (default is true).
  /// - The [ignoreWordSplitters] parameter specifies whether to ignore word splitters when comparing strings (default is true).
  /// - The [splitCamelCase] parameter specifies whether to split camel case words when comparing strings (default is true).
  ///
  /// Returns the sum of the Jaro similarity scores between the item and each search term.
  double countJaro({
    required dynamic searchTerms,
    required Iterable searchOn,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
  }) {
    var terms = [...searchOn];
    var searches = forceRecursiveList(searchTerms);
    return terms
        .expand((e) {
          return e == null
              ? <double>[for (var _ in searches) 0]
              : e.toString().getUniqueWords.map((keyword) {
                  decimal jaro = 0.0;
                  for (var searchTerm in searches) {
                    keyword = generateKeyword(
                      keyword,
                      forceLowerCase: ignoreCase,
                      removeDiacritics: ignoreDiacritics,
                      removeWordSplitters: ignoreWordSplitters,
                      splitCamelCase: splitCamelCase,
                    );
                    var searchword = generateKeyword(
                      searchTerm,
                      forceLowerCase: ignoreCase,
                      removeDiacritics: ignoreDiacritics,
                      removeWordSplitters: ignoreWordSplitters,
                      splitCamelCase: splitCamelCase,
                    );
                    jaro += searchword.getJaro(keyword, !ignoreCase);
                  }
                  return jaro;
                });
        })
        .sum
        .toDouble();
  }

  /// Calculates the Levenshtein distance between an [searchOnItems] items and a list of search terms.
  ///
  /// The Levenshtein distance is a measure of the difference between two strings. It represents the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into another.
  ///
  /// The [searchOnItems] function is used to extract the relevant terms from the [item] for comparison.
  /// The [levenshteinDistance] is the maximum allowed Levenshtein distance for a match to be considered.
  /// The optional parameters [ignoreCase], [ignoreDiacritics], [ignoreWordSplitters], [splitCamelCase], and [useWildcards] control various aspects of the comparison.
  ///
  /// Returns the count of [searchTerms] that have a Levenshtein distance less than or equal to [levenshteinDistance].

  int countLevenshtein({
    required dynamic searchTerms,
    required Iterable searchOnItems,
    required int levenshteinDistance,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
  }) {
    if (levenshteinDistance <= 0) {
      return 0;
    } else {
      var terms = <dynamic>[...searchOnItems];
      var searches = forceRecursiveList(searchTerms);
      return [
        for (var searchTerm in searches)
          ...terms.expand((e) {
            if (e == null) return [];
            return e.toString().getUniqueWords.map((keyword) {
              keyword = generateKeyword(
                keyword,
                forceLowerCase: ignoreCase,
                removeDiacritics: ignoreDiacritics,
                removeWordSplitters: ignoreWordSplitters,
                splitCamelCase: splitCamelCase,
              );
              var searchword = generateKeyword(
                searchTerm,
                forceLowerCase: ignoreCase,
                removeDiacritics: ignoreDiacritics,
                removeWordSplitters: ignoreWordSplitters,
                splitCamelCase: splitCamelCase,
              );
              return searchword.getLevenshtein(keyword, !ignoreCase);
            });
          })
      ].count((e) {
        return e <= levenshteinDistance;
      });
    }
  }

  /// Counts the number of occurrences of search terms in a given item.
  ///
  /// The [countSearch] function takes the following parameters:
  /// - [searchTerms]: The search terms to count in the item. Can be a string or a list of strings.
  /// - [searchOn]: A function that takes an item and returns a list of dynamic values to search on.
  /// - [ignoreCase]: A boolean indicating whether to ignore case sensitivity (default is true).
  /// - [ignoreDiacritics]: A boolean indicating whether to ignore diacritics (default is true).
  /// - [ignoreWordSplitters]: A boolean indicating whether to ignore word splitters (default is true).
  /// - [splitCamelCase]: A boolean indicating whether to split camel case words (default is true).
  /// - [useWildcards]: A boolean indicating whether to use wildcards (*) for matching (true) or a standard `string.contains()` (false) (default is false).
  ///
  /// The function returns the count of occurrences of the search terms in the item.
  int countSearch({
    required dynamic searchTerms,
    required Iterable searchOnItems,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) {
    var terms = <dynamic>[...searchOnItems];
    var searches = forceRecursiveList(searchTerms);
    return [
      for (var searchTerm in searches)
        ...terms.where((v) {
          if (v == null) return false;
          var searchword = generateKeyword(
            searchTerm,
            forceLowerCase: ignoreCase,
            removeDiacritics: ignoreDiacritics,
            removeWordSplitters: ignoreWordSplitters,
            splitCamelCase: splitCamelCase,
          );
          dynamic keyword = v;
          if (keyword is num) {
            if (useWildcards) {
              keyword = keyword.toString();
            } else {
              return keyword.asFlat.startsWith(searchword);
            }
          }

          keyword = generateKeyword(
            keyword,
            forceLowerCase: ignoreCase,
            removeDiacritics: ignoreDiacritics,
            removeWordSplitters: ignoreWordSplitters,
            splitCamelCase: splitCamelCase,
          );
          consoleLog("SearchWord: $searchword, Keyword: $keyword");
          return useWildcards ? keyword.toString().isLike(searchword, !ignoreCase) : keyword.toString().contains(searchword);
        })
    ].length;
  }

  /// A function that performs a full filter on an item based on search terms.
  ///
  /// The [fullFilterFunction] takes in various parameters including the item to be filtered,
  /// the search terms to filter on, the function to extract search terms from the item,
  /// and several optional parameters to customize the filtering behavior.
  ///
  /// - The [searchTerms] parameter contains search terms to filter on. If [searchTerms] is a Iterable, the function will return `true` if any of the search terms match the item.
  /// - The [searchOnItems] parameter is a function that takes in an item and returns an iterable of search terms extracted from the item.
  /// - The [levenshteinDistance] parameter is an optional parameter that specifies the maximum Levenshtein distance allowed for a match.
  /// - The [ignoreCase] parameter is an optional parameter that specifies whether to ignore case when performing the filter.
  /// - The [ignoreDiacritics] parameter is an optional parameter that specifies whether to ignore diacritics when performing the filter.
  /// - The [ignoreWordSplitters] parameter is an optional parameter that specifies whether to ignore word splitters when performing the filter.
  /// - The [splitCamelCase] parameter is an optional parameter that specifies whether to split camel case words when performing the filter.
  /// - The [useWildcards] parameter is an optional parameter that specifies whether to use wildcards when performing the filter.
  ///
  /// The function returns `true` if the item passes the filter, and `false` otherwise.
  bool fullFilterFunction({
    required dynamic searchTerms,
    required Iterable searchOnItems,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) =>
      searchFunction(
        searchTerms: searchTerms,
        searchOnItems: searchOnItems,
        ignoreCase: ignoreCase,
        ignoreDiacritics: ignoreDiacritics,
        ignoreWordSplitters: ignoreWordSplitters,
        splitCamelCase: splitCamelCase,
        useWildcards: useWildcards,
      ) ||
      levenshteinFunction(
        searchTerms: searchTerms,
        searchOnItems: searchOnItems,
        levenshteinDistance: levenshteinDistance,
        ignoreCase: ignoreCase,
      );

  /// Searches for items in the provided [items] iterable based on the given [searchTerms].
  ///
  /// The [keyCharSearches] parameter is a map where the keys are strings representing search prefixes,
  /// and the values are functions that take a search term and an item, and return a boolean indicating
  /// whether the item matches the search term.
  ///
  /// The [items] parameter is the iterable of items to search through.
  ///
  /// The [searchTerms] parameter is the term or terms to search for. It can be a single term or a list of terms.
  ///
  /// The [maxResults] parameter specifies the maximum number of results to return. If it is 0, all matching items are returned.
  ///
  /// Returns an iterable of items that match the search criteria.
  Iterable<T> keySearch<T>({
    required KeyCharSearches<T> keyCharSearches,
    required Iterable<T> items,
    required dynamic searchTerms,
    int maxResults = 0,
  }) {
    var searches = forceRecursiveList(searchTerms);
    keyCharSearches[""] ??= (String search, T item) => false;
    var l = [
      ...items.where((item) {
        for (var s in searches) {
          var searchWord = changeTo<string>(s);
          if (searchWord.startsWithAny(keyCharSearches.keys.whereNot((e) => e.isEmpty))) {
            for (var entry in keyCharSearches.entries.where((e) => e.key.isNotEmpty)) {
              if (searchWord.startsWith(entry.key)) {
                return entry.value(
                  searchWord.removeFirstEqual(entry.key),
                  item,
                );
              }
            }
          } else {
            return keyCharSearches[""]!(searchWord, item);
          }
        }
        return false;
      })
    ];

    if (maxResults > 0) return l.take(maxResults);
    return l;
  }

  /// Calculates the Levenshtein distance between an item and a collection of search terms.
  ///
  /// The Levenshtein distance is a measure of the difference between two strings.
  /// This function takes an item, a collection of search terms, a function to extract search terms from the item,
  /// and a maximum allowed Levenshtein distance. It returns `true` if there is at least one search term that is within
  /// the specified Levenshtein distance of the item, and `false` otherwise.
  ///
  /// The [searchTerms] parameter is the collection of search terms to compare against the item.
  /// The [searchOnItems] parameter is a list of search terms to compare against.
  /// The [levenshteinDistance] parameter is the maximum allowed Levenshtein distance.
  /// The [ignoreCase] parameter specifies whether to ignore case when comparing strings. It is `true` by default.
  ///
  /// Returns `true` if there is at least one search term within the specified Levenshtein distance of the item,
  /// and `false` otherwise.
  bool levenshteinFunction({
    required dynamic searchTerms,
    required Iterable searchOnItems,
    required int levenshteinDistance,
    bool ignoreCase = true,
  }) =>
      countLevenshtein(
        searchTerms: searchTerms,
        searchOnItems: searchOnItems,
        levenshteinDistance: levenshteinDistance,
        ignoreCase: ignoreCase,
      ) >
      0;

  /// Searches the iterable for items that match the specified search criteria.
  ///
  /// - The [searchTerms] parameter specifies the term to search for. Can be a string or a list of strings.
  /// - The [searchOn] parameter is a function that returns a list of strings to search on for each item.
  /// - The [levenshteinDistance] parameter specifies the maximum Levenshtein distance allowed for fuzzy matching.
  /// - The [ignoreCase], [ignoreDiacritics], [ignoreWordSplitters], [splitCamelCase], [useWildcards], and [allIfEmpty] parameters control various search options.
  ///
  /// Returns an iterable of items that match the search criteria, ordered by relevance.
  /// The relevance is determined by the number of matches and the Levenshtein distance (if applicable).

  Iterable<T> search<T>({
    required Iterable<T> items,
    required dynamic searchTerms,
    SearchOnFunction<T>? searchOn,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
    bool allIfEmpty = true,
    int maxResults = 0,
    int minChars = 0,
  }) {
    if (items.isEmpty) return <T>[].orderBy((e) => true);

    var searches = forceRecursiveList(searchTerms).whereNotBlank;

    if (minChars > 0) {
      searches = searches.where((e) => flatString(e).length >= minChars);
      allIfEmpty = false;
    }

    if (searches.isEmpty) {
      if (allIfEmpty) {
        return items;
      } else {
        return <T>[];
      }
    }

    searchOn ??= (T item) => [changeTo<string>(item)];

    var l = [
      ...items.where(
        (item) {
          return Get.searchFunction(
            searchTerms: searches,
            searchOnItems: searchOn!(item),
            ignoreCase: ignoreCase,
            ignoreDiacritics: ignoreDiacritics,
            ignoreWordSplitters: ignoreWordSplitters,
            splitCamelCase: splitCamelCase,
            useWildcards: useWildcards,
            levenshteinDistance: levenshteinDistance,
          );
        },
      )
    ];

    if (l.isEmpty && levenshteinDistance > 0) {
      l = [
        ...items.where(
          (item) => levenshteinFunction(
            searchTerms: searches,
            searchOnItems: searchOn!(item),
            levenshteinDistance: levenshteinDistance,
            ignoreCase: ignoreCase,
          ),
        )
      ];
    }

    l = [
      ...l.orderByDescending(
        (item) => countJaro(
          searchTerms: searches,
          searchOn: searchOn!(item),
          ignoreCase: ignoreCase,
          ignoreDiacritics: ignoreDiacritics,
          ignoreWordSplitters: ignoreWordSplitters,
          splitCamelCase: splitCamelCase,
        ),
      ),
    ];

    if (maxResults > 0) l = [...l.take(maxResults)];
    return l;
  }

  /// Searches for a specific item in an iterable based on given search terms and criteria.
  ///
  /// The [searchFunction] function takes in the following parameters:
  /// - [searchTerms]: The search terms to match against.
  /// - [searchOn]: An iterable of values to search on for each item.
  /// - [levenshteinDistance]: The maximum allowed Levenshtein distance for fuzzy matching. Defaults to 0.
  /// - [ignoreCase]: Whether to ignore case sensitivity when matching. Defaults to true.
  /// - [ignoreDiacritics]: Whether to ignore diacritics (accented characters) when matching. Defaults to true.
  /// - [ignoreWordSplitters]: Whether to ignore word splitters (e.g. spaces, hyphens) when matching. Defaults to true.
  /// - [splitCamelCase]: Whether to split camel case words when matching. Defaults to true.
  /// - [useWildcards]: Whether to use wildcards (*) for partial matching. Defaults to false.
  ///
  /// Returns `true` if the item matches any of the search terms based on the given criteria, `false` otherwise.
  bool searchFunction({
    required dynamic searchTerms,
    required Iterable searchOnItems,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) =>
      countSearch(
        searchTerms: searchTerms,
        searchOnItems: searchOnItems,
        ignoreCase: ignoreCase,
        ignoreDiacritics: ignoreDiacritics,
        ignoreWordSplitters: ignoreWordSplitters,
        splitCamelCase: splitCamelCase,
        useWildcards: useWildcards,
      ) >
      0;

  /// Searches for [JsonRow] objects in the iterable based on a search term and specified keys.
  ///
  /// The [searchTerms] parameter is the term to search for. Can be a string or a list of strings.
  /// The [keys] parameter is a list of keys to search on. If empty, all keys in the [JsonRow] objects will be used.
  /// The [levenshteinDistance] parameter is the maximum allowed Levenshtein distance between the search term and a value in the [JsonRow] objects.
  /// The [allIfEmpty] parameter determines whether to return all [JsonRow] objects if the search term is empty.
  ///
  /// Returns an iterable of [JsonRow] objects that match the search criteria.
  Iterable<Map<K, V>> searchMap<K, V>({
    required Iterable<Map<K, V>> items,
    required dynamic searchTerms,
    Iterable<K> keys = const [],
    int levenshteinDistance = 0,
    bool allIfEmpty = true,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
    int maxResults = 0,
    int minChars = 0,
  }) {
    if (keys.isEmpty) {
      keys = items.expand((e) => e.keys).distinct().toList();
    }
    return search(
      items: items,
      searchTerms: searchTerms,
      searchOn: (row) => [
        for (var k in keys)
          if (row[k] != null) row[k]!
      ],
      levenshteinDistance: levenshteinDistance,
      allIfEmpty: allIfEmpty,
      ignoreCase: ignoreCase,
      ignoreDiacritics: ignoreDiacritics,
      ignoreWordSplitters: ignoreWordSplitters,
      maxResults: maxResults,
      minChars: minChars,
      splitCamelCase: splitCamelCase,
      useWildcards: useWildcards,
    );
  }
}
