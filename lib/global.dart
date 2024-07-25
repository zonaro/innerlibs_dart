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
/// - `objects` thats fail against a custom validation functions (if provided). The custom validation function must return a list of booleans. If at least one of the booleans is `true`, the object is considered valid.;
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
bool isValid<T>(T? object, {List<bool> Function(T?)? customValidator}) {
  try {
    if (customValidator != null) {
      return customValidator(object).any((x) => true);
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
      return object.isNotEmpty && object.values.isValid();
    }

    return object.toString().isValid();
  } catch (e) {
    consoleLog("IsValid => ", error: e);
    return false;
  }
}

/// Checks if the given [object] is not valid (see [isValid] function).
///
/// Returns `true` if the [object] is not valid, `false` otherwise.
bool isNotValid<T>(T object, {List<bool> Function(T?)? customValidator}) => !isValid(object, customValidator: customValidator);

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
  } else if (R == Uri) {
    return Uri.parse("$value") as R;
  } else if (R == Widget) {
    return forceWidget(value) as R;
  } else if (R is Text) {
    return (value as Object?).asNullableText() as R;
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
Widget? forceWidget(
  dynamic item, {
  TextStyle? style,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  TextScaler? textScaler,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  bool validate = true,
  String? defaultText,
}) {
  if (item != null && item is Widget) {
    return item;
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

  if (item is IconData?) {
    return (item).asNullableIcon(
      size: style?.fontSize,
      color: style?.color,
      applyTextScaling: textScaler != null,
      weight: style?.fontWeight?.value.toDouble(),
      semanticLabel: semanticsLabel ?? defaultText,
      shadows: style?.shadows,
      textDirection: textDirection,
    );
  }

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

/// Validates a value of type [T] using a list of validation functions.
/// The [value] is considered valid if at least one of the validation functions returns `true`.
/// If the value is valid, it is returned; otherwise, `null` is returned.
T? valid<T>(T value, List<bool> Function(T?)? validations, [string? throwErrorMessage]) => isValid(value, customValidator: validations)
    ? value
    : throwErrorMessage.isNotBlank
        ? throw Exception(throwErrorMessage)
        : null;

/// Generates a arrow or ident string with a specified length and pattern.
///
/// - The `length` parameter specifies the number of arrows to generate.
/// - The `pattern` parameter specifies the pattern of the arrows.
/// - If the `pattern` is empty, an empty string is returned.
/// - If the `length` is 0, an empty string is returned.
/// - If the `length` is negative, the absolute value of `length` is used and the pattern is reversed.
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

/// A mixin that provides various filter functions for searching and filtering data.
///
/// This mixin contains static methods that can be used to transform strings, count search results,
/// perform Levenshtein distance calculations, and apply filters based on search terms.
///
/// The mixin provides the following functions:
/// - `transformString`: Transforms a given value into a keyword for searching.
/// - `countSearch`: Counts the number of search terms that match a given item.
/// - `countLevenshtein`: Counts the number of search terms that have a Levenshtein distance
///   less than or equal to a specified threshold from a given item.
/// - `searchFunction`: Checks if a given item matches any of the search terms.
/// - `levenshteinFunction`: Checks if a given item has any search terms with a Levenshtein distance
///   less than or equal to a specified threshold.
/// - `filterFunction`: Checks if a given item matches any of the search terms or has any search terms
///   with a Levenshtein distance less than or equal to a specified threshold.
///
/// Example usage:
/// ```dart
/// var searchTerms = ['apple', 'banana'];
/// var item = 'I like apples';
///
/// var matches = FilterFunctions.searchFunction(
///   item: item,
///   searchTerms: searchTerms,
///   searchOn: (String item) => [item],
/// );
///
/// print(matches); // Output: true
/// ```

mixin FilterFunctions {
  /// Searches the iterable for items that match the specified search criteria.
  ///
  /// The [searchTerm] parameter specifies the term to search for.
  /// The [searchOn] parameter is a function that returns a list of strings to search on for each item.
  /// The [levenshteinDistance] parameter specifies the maximum Levenshtein distance allowed for fuzzy matching.
  /// The [ignoreCase], [ignoreDiacritics], [ignoreWordSplitters], [splitCamelCase], [useWildcards], and [allIfEmpty] parameters control various search options.
  ///
  /// Returns an iterable of items that match the search criteria, ordered by relevance.
  /// The relevance is determined by the number of matches and the Levenshtein distance (if applicable).

  static Iterable<T> search<T, O>({
    required Iterable<T> items,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
    bool allIfEmpty = true,
  }) {
    if (items.isEmpty) return <T>[].orderBy((e) => true);

    if (searchTerms.whereValid.isEmpty) {
      if (allIfEmpty) {
        return items.orderBy((e) => true);
      } else {
        return <T>[].orderBy((e) => true);
      }
    }

    var l = items.where(
      (item) => FilterFunctions.searchFunction(
        item: item,
        searchTerms: searchTerms,
        searchOn: searchOn,
        ignoreCase: ignoreCase,
        ignoreDiacritics: ignoreDiacritics,
        ignoreWordSplitters: ignoreWordSplitters,
        splitCamelCase: splitCamelCase,
        useWildcards: useWildcards,
      ),
    );

    if (l.isEmpty && levenshteinDistance > 0) {
      l = items.where(
        (item) => FilterFunctions.levenshteinFunction(
          item: item,
          searchTerms: searchTerms,
          searchOn: searchOn,
          levenshteinDistance: levenshteinDistance,
        ),
      );
    }

    return l
        .orderByDescending(
          (item) => FilterFunctions.countSearch(
            item: item,
            searchTerms: searchTerms,
            searchOn: searchOn,
            ignoreCase: ignoreCase,
            ignoreDiacritics: ignoreDiacritics,
            ignoreWordSplitters: ignoreWordSplitters,
            splitCamelCase: splitCamelCase,
            useWildcards: useWildcards,
          ),
        )
        .thenBy(
          (item) => FilterFunctions.countLevenshtein(
            item: item,
            searchTerms: searchTerms,
            searchOn: searchOn,
            levenshteinDistance: levenshteinDistance,
          ),
        );
  }

  /// Searches for [JsonRow] objects in the iterable based on a search term and specified keys.
  ///
  /// The [searchTerm] parameter is the term to search for.
  /// The [keys] parameter is a list of keys to search on. If empty, all keys in the [JsonRow] objects will be used.
  /// The [levenshteinDistance] parameter is the maximum allowed Levenshtein distance between the search term and a value in the [JsonRow] objects.
  /// The [allIfEmpty] parameter determines whether to return all [JsonRow] objects if the search term is empty.
  ///
  /// Returns an iterable of [JsonRow] objects that match the search criteria.
  static Iterable<Map<K, V>> searchMap<K, V>({required Iterable<Map<K, V>> items, required Iterable<V> searchTerms, Iterable<K> keys = const [], int levenshteinDistance = 0, bool allIfEmpty = true}) {
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
        allIfEmpty: allIfEmpty);
  }

  /// Transforms a given value into a keyword string.
  ///
  /// The transformation can include various options such as ignoring case,
  /// ignoring diacritics, ignoring word splitters, splitting camel case,
  /// and using wildcards.
  ///
  /// If the value is null, an empty string is returned.
  ///
  /// Example usage:
  /// ```dart
  /// String result = transformString("Hello World",
  ///   ignoreCase: true,
  ///   ignoreDiacritics: true,
  ///   ignoreWordSplitters: true,
  ///   splitCamelCase: true,
  ///   useWildcards: false,
  /// );
  /// ```
  ///
  /// The above example will transform the string "Hello World" into "hello_world".
  ///
  /// Parameters:
  /// - `value`: The value to be transformed into a keyword string.
  /// - `ignoreCase`: Whether to ignore the case of the resulting keyword. Default is `true`.
  /// - `ignoreDiacritics`: Whether to ignore diacritics (accented characters) in the resulting keyword. Default is `true`.
  /// - `ignoreWordSplitters`: Whether to ignore word splitters (e.g., spaces, hyphens) in the resulting keyword. Default is `true`.
  /// - `splitCamelCase`: Whether to split camel case words in the resulting keyword. Default is `true`.
  /// - `useWildcards`: Whether to use wildcards in the resulting keyword. Default is `false`.
  ///
  /// Returns:
  /// The transformed keyword string.
  static String transformString(
    dynamic value, {
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
  }) {
    if (value == null) return "";

    String keyword = value.toString();

    if (splitCamelCase) {
      keyword = keyword.camelSplitString;
    }

    if (ignoreWordSplitters) {
      keyword = keyword.removeWordSplitters;
    }

    if (ignoreDiacritics) {
      keyword = keyword.removeDiacritics;
    }

    if (ignoreCase) {
      keyword = keyword.toLowerCase();
    }

    return keyword;
  }

  /// Counts the number of occurrences of search terms in a given item.
  ///
  /// The [countSearch] function takes the following parameters:
  /// - [searchTerms]: A list of strings representing the search terms.
  /// - [item]: The item to search on.
  /// - [searchOn]: A function that takes an item and returns a list of dynamic values to search on.
  /// - [ignoreCase]: A boolean indicating whether to ignore case sensitivity (default is true).
  /// - [ignoreDiacritics]: A boolean indicating whether to ignore diacritics (default is true).
  /// - [ignoreWordSplitters]: A boolean indicating whether to ignore word splitters (default is true).
  /// - [splitCamelCase]: A boolean indicating whether to split camel case words (default is true).
  /// - [useWildcards]: A boolean indicating whether to use wildcards for matching (default is false).
  ///
  /// The function returns the count of occurrences of the search terms in the item.
  static int countSearch<T, O>({
    required T item,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) {
    return [
      for (var searchTerm in searchTerms)
        ...searchOn(item).where((v) {
          if (v == null) return false;
          var searchword = transformString(
            searchTerm,
            ignoreCase: ignoreCase,
            ignoreDiacritics: ignoreDiacritics,
            ignoreWordSplitters: ignoreWordSplitters,
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

          keyword = transformString(
            keyword,
            ignoreCase: ignoreCase,
            ignoreDiacritics: ignoreDiacritics,
            ignoreWordSplitters: ignoreWordSplitters,
            splitCamelCase: splitCamelCase,
          );
          if (useWildcards) return keyword.toString().isLike(searchword, !ignoreCase);
          return keyword.toString().contains(searchword);
        })
    ].length;
  }

  static int countLevenshtein<T, O>({
    required T item,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    required int levenshteinDistance,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) {
    if (levenshteinDistance <= 0) {
      return 0;
    } else {
      return [
        for (var searchTerm in searchTerms)
          ...searchOn(item).selectMany((e, i) {
            if (e == null) return [];
            return e.toString().getUniqueWords.map((keyword) {
              keyword = transformString(
                keyword,
                ignoreCase: ignoreCase,
                ignoreDiacritics: ignoreDiacritics,
                ignoreWordSplitters: ignoreWordSplitters,
                splitCamelCase: splitCamelCase,
              );
              var searchword = transformString(
                searchTerm,
                ignoreCase: ignoreCase,
                ignoreDiacritics: ignoreDiacritics,
                ignoreWordSplitters: ignoreWordSplitters,
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

  static bool searchFunction<T, O>({
    required T item,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) =>
      countSearch(item: item, searchTerms: searchTerms, searchOn: searchOn, ignoreCase: ignoreCase, ignoreDiacritics: ignoreDiacritics, ignoreWordSplitters: ignoreWordSplitters, splitCamelCase: splitCamelCase, useWildcards: useWildcards) > 0;

  static bool levenshteinFunction<T, O>({
    required T item,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    required int levenshteinDistance,
    bool ignoreCase = true,
  }) =>
      countLevenshtein(item: item, searchTerms: searchTerms, searchOn: searchOn, levenshteinDistance: levenshteinDistance, ignoreCase: ignoreCase) > 0;

  static bool filterFunction<T, O>({
    required T item,
    required Iterable<O> searchTerms,
    required Iterable<O> Function(T) searchOn,
    int levenshteinDistance = 0,
    bool ignoreCase = true,
    bool ignoreDiacritics = true,
    bool ignoreWordSplitters = true,
    bool splitCamelCase = true,
    bool useWildcards = false,
  }) {
    return searchFunction(item: item, searchTerms: searchTerms, searchOn: searchOn, ignoreCase: ignoreCase, ignoreDiacritics: ignoreDiacritics, ignoreWordSplitters: ignoreWordSplitters, splitCamelCase: splitCamelCase, useWildcards: useWildcards) || levenshteinFunction(item: item, searchTerms: searchTerms, searchOn: searchOn, levenshteinDistance: levenshteinDistance, ignoreCase: ignoreCase);
  }
}
