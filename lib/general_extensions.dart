import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

R _changeTo<R>(value) => changeTo<R>(value);

bool _isvalid<T>(T obj, List<bool> Function(T?)? customValidator) => isValid(obj, customValidator: customValidator);

T? _valid<T>(T obj, List<bool> Function(T?)? validations, [string? throwErrorMessage]) => valid<T>(obj, validations, throwErrorMessage);

/// Extension method that compares two values and swaps them if necessary.
///
/// This extension method can be used on any type that extends the `Comparable` class.
/// It compares the current value with the `other` value and swaps them if the current value is greater.
/// The method returns a tuple containing the updated values.
extension CompareAndSwap<T extends Comparable> on T {
  /// Compares the current value with the `other` value and swaps them if necessary.
  ///
  /// Returns a iterable containing the updated values in order.
  Iterable<T> compareAndSwap(T other) {
    T a = this;
    if (a.compareTo(other) > 0) {
      var temp = a;
      a = other;
      other = temp;
    }
    return [a, other];
  }
}

extension ObjectExtensions<T extends Object?> on T {
  /// Returns flat representation string by removing diacritics, converting to lowercase, and trimming all whitespace.
  string get asFlat => flatString(this);

  /// Checks if [this] is not a Blank value:
  ///(Null, empty or only white spaces for [String], 0 for [num] , [DateTimeExtensions.min] for [DateTime], Call [isNotValid] recursively on [List] or [Map] values. Other class types, call [ToString()] and check ).
  bool get isNotValid => !isValid();

  bool get isNullable {
    try {
      // throws an exception if T is not nullable
      final _ = null as T;
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Converts the current object to a boolean value.
  ///
  /// Recognized keywords (case-insensitive):
  /// - 'NULL', 'CANCEL', 'CANCELAR', '', '!', '0', 'FALSE', 'NOT', 'NAO', 'NO', 'NOP', 'DISABLED', 'DISABLE', 'OFF', 'DESATIVADO', 'DESATIVAR', 'DESATIVO', 'N', 'X': Returns `false`.
  /// - '1', 'S', 'TRUE', 'YES', 'YEP', 'SIM', 'ENABLED', 'ENABLE', 'ON', 'Y', 'ATIVO', 'ATIVAR', 'ATIVADO', 'OK', 'C': Returns `true`.
  ///
  /// If the object doesn't match any of the recognized keywords:
  /// - If [everythingIsTrue] is `true`, returns `true`.
  /// - If [everythingIsTrue] is `false`, throws an [ArgumentError].
  ///
  /// Example usage:
  /// ```dart
  /// bool result = someObject.asNullableBool(everythingIsTrue: false);
  /// ```
  ///
  /// - [everythingIsTrue]: A boolean flag indicating whether to treat all non-null values as `true`.
  ///   If set to `true`, any non-null value (except specific keywords) will be considered `true`.
  ///   If set to `false`, an exception will be thrown for unrecognized values.
  ///
  /// Returns `true` or `false` based on the object's representation.
  /// Throws an [ArgumentError] if the object doesn't represent a valid option and [everythingIsTrue] is `false`.
  bool asBool({bool everythingIsTrue = true}) => asNullableBool(everythingIsTrue: everythingIsTrue) ?? false;

  /// Converts the current object to a nullable boolean value.
  ///
  /// If the object is null, this function returns `null`.///
  /// Recognized keywords (case-insensitive):
  /// - 'NULL', 'CANCEL', 'CANCELAR','ABORT', 'ABORTAR': Returns `null`.
  /// - '', '!', '0', 'FALSE', 'NOT', 'NAO', 'NO', 'NOP', 'DISABLED', 'DISABLE', 'OFF', 'DESATIVADO', 'DESATIVAR', 'DESATIVO', 'N','X','E','ERRADO', 'FALSO', 'MENTIRA' : Returns `false`.
  /// - '1', 'S', 'TRUE', 'YES', 'YEP', 'SIM', 'ENABLED', 'ENABLE', 'ON', 'Y', 'ATIVO', 'ATIVAR', 'ATIVADO', 'OK','C','VERDADE','VERDADEIRO','CORRETO','CERTO': Returns `true`.
  ///
  /// If the object doesn't match any of the recognized keywords:
  /// - If [everythingIsTrue] is `true`, returns `true`.
  /// - If [everythingIsTrue] is `false`, throws an [ArgumentError].
  ///
  /// Example usage:
  /// ```dart
  /// bool? result = someObject.asNullableBool(everythingIsTrue: false);
  /// ```
  ///
  /// - [everythingIsTrue]: A boolean flag indicating whether to treat all non-null values as `true`.
  ///   If set to `true`, any non-null value (except specific keywords) will be considered `true`.
  ///   If set to `false`, an exception will be thrown for unrecognized values.
  ///
  /// Returns `true`, `false`, or `null` based on the object's representation.
  /// Throws an [ArgumentError] if the object doesn't represent a valid option and [everythingIsTrue] is `false`.
  bool? asNullableBool({bool everythingIsTrue = true}) {
    if (this == null) return null;
    if (this is bool) return this as bool;
    var x = '$this'.toUpperCase().removeDiacritics.trimAll;
    switch (x) {
      case 'NULL':
      case 'CANCEL':
      case 'CANCELAR':
      case 'ABORT':
      case 'ABORTAR':
        return null;
      case '':
      case '!':
      case '0':
      case 'FALSE':
      case 'NOT':
      case 'NAO':
      case 'NO':
      case 'NOP':
      case 'DISABLED':
      case 'DISABLE':
      case 'OFF':
      case 'DESATIVADO':
      case 'DESATIVAR':
      case 'DESATIVO':
      case 'N':
      case 'X':
      case 'F':
      case 'FALSO':
      case 'MENTIRA':
      case 'ERRADO':
      case 'E':
        return false;
      case '1':
      case 'S':
      case 'TRUE':
      case 'YES':
      case 'YEP':
      case 'SIM':
      case 'ENABLED':
      case 'ENABLE':
      case 'ON':
      case 'Y':
      case 'ATIVO':
      case 'ATIVAR':
      case 'ATIVADO':
      case 'OK':
      case 'C':
      case 'V':
      case 'VERDADEIRO':
      case 'VERDADE':
      case 'CERTO':
      case 'CORRETO':
        return true;
      default:
        return everythingIsTrue ? true : throw ArgumentError('The object does not represent a valid option and the EverythingIsTrue flag is set to false.');
    }
  }

  /// Converts the object to a nullable [Text] widget with the specified properties.
  ///
  /// If the object is null, it returns null.
  /// If the object is already a [Text] widget, it returns the object itself.
  /// If [validate] is true and the object is not valid (see [isValid()]), it returns null.
  /// Otherwise, it converts the object to a [Text] widget with the string representation of the object.
  ///
  /// The [style], [strutStyle], [textAlign], [textDirection], [locale], [softWrap],
  /// [overflow], [textScaler], [maxLines], [semanticsLabel], and [textWidthBasis]
  /// parameters are used to customize the appearance and behavior of the [Text] widget.
  ///
  /// Returns a nullable [Text] widget with the specified properties.
  Text? asNullableText({
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
    string dateFormat = "",
  }) {
    Text? text;
    
    locale ??= PlatformDispatcher.instance.locale;

    if (this == null && defaultText == null) return null;

    if (this is Text) {
      text = this as Text;
    } else {
      if (validate == false || this.isValid()) {
        if (this is Map || this is List) {
          text = Text(jsonEncode(this));
        } else if (this is DateTime) {
          text = Text((this as DateTime).format(dateFormat, locale.countryCode));
        } else {
          text = Text("$this" | defaultText);
        }
      } else if (defaultText != null) {
        text = Text(defaultText);
      }
    }

    return text?.copyWith(
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
    );
  }

  // return a string of this object as a SQL Value
  String asSqlValue([bool nullAsBlank = false]) {
    return SqlUtil.value(this, nullAsBlank);
  }

  /// Converts the object to a [Text] widget with the specified properties.
  ///
  /// If the object is null, it returns [defaultText] in a [Text] widget.
  /// If the object is already a [Text] widget, it returns the object itself.
  /// If [validate] is true and the object is not valid (see [isValid()]), it returns [defaultText] in a [Text] widget.
  /// Otherwise, it converts the object to a [Text] widget with the default text.
  ///
  /// The [style], [strutStyle], [textAlign], [textDirection], [locale], [softWrap],
  /// [overflow], [textScaler], [maxLines], [semanticsLabel], and [textWidthBasis]
  /// parameters are used to customize the appearance and behavior of the [Text] widget.
  ///
  ///
  /// Returns a [Text] widget with the specified properties.
  Text asText({
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
    String defaultText = "",
    bool validate = true,
  }) =>
      asNullableText(
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
      )!;

  /// Converts a value of type `Object` to a specified type `T`.
  ///
  /// This function can convert between `bool`, `DateTime`, `num`, `int`, `double`, and `String` types.
  /// It assumes that the input is in a format that can be parsed to the desired type.
  ///
  /// return null if the conversion is not possible.
  ///
  /// Usage:
  /// ```dart
  /// print(changeTo<int>('123')); // prints: 123
  /// print(changeTo<double>('123.45')); // prints: 123.45
  /// print(changeTo<DateTime>('2024-05-27 13:18:56')); // prints: 2024-05-27 13:18:56.000
  /// print(changeTo<String>(123)); // prints: '123'
  /// print(changeTo<bool>('y')); // prints: true
  /// ```
  ///
  /// [T] The type to convert the value to.
  /// [value] The value to convert.
  ///
  /// Returns the converted value of type `T`.
  R changeTo<R>() => _changeTo<R>(this);

  /// Checks if the current string contains the given [value] when both are flattened.
  /// If the current string is blank, it returns `true` only if the [value] is also blank.
  /// If the [value] is blank, it returns `true`.
  /// Otherwise, it checks if the current string contains the [value] when both are flattened.
  /// Returns `true` if the current string contains the [value], `false` otherwise.
  bool flatContains<V>(V value) {
    if (asFlat.isBlank) return value.asFlat.isBlank;

    if (value.asFlat.isBlank) {
      return true;
    }
    return asFlat.contains(value!.asFlat);
  }

  /// Checks if the string contains any of the specified texts.
  ///
  /// Returns `true` if the string contains any of the texts in the [values] iterable,
  /// otherwise returns `false`.
  bool flatContainsAny<V>(Iterable<V> values) {
    for (var t in values) {
      if (flatContains(t)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if the current string is equal to the given [value] when both are flattened.
  /// Returns `true` if they are equal, `false` otherwise.
  bool flatEqual<V>(V value) => asFlat == value?.asFlat;

  /// Checks if any of the strings in the given [values] iterable is equal to the current string.
  /// Returns `true` if any string is equal, otherwise returns `false`.
  bool flatEqualAny<V>(Iterable<V> values) {
    for (var t in values) {
      if (flatEqual(t)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if the current object is present in the given list, map or string.
  /// Returns `true` if the current object is not `null` and is present in the list,
  /// otherwise returns `false`.
  bool isIn(dynamic items) {
    if (items == null) return false;
    if (items is Iterable) {
      return this != null && items.contains(this);
    }
    if (items is Map) {
      return this != null && items.containsValue(this);
    }
    if (items is String) {
      return this != null && items.contains(toString());
    }
    return false;
  }

  bool isNotIn(dynamic items) => !isIn(items);

  /// Checks if [Object] has a valid value.
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
  /// Returns `true` if the [Object] is valid, `false` otherwise.
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
  bool isValid([List<bool> Function(T?)? customValidator]) => _isvalid<T>(this, customValidator);

  bool keywordContainsAny(
    Iterable<T> value, {
    bool forceLowerCase = true,
    bool removeDiacritics = true,
    bool removeWordSplitters = true,
    bool splitCamelCase = true,
  }) =>
      generateKeyword(this, forceLowerCase: forceLowerCase, removeDiacritics: removeDiacritics, removeWordSplitters: removeWordSplitters, splitCamelCase: splitCamelCase).containsAny(
          value.map((e) => generateKeyword(e, forceLowerCase: forceLowerCase, removeDiacritics: removeDiacritics, removeWordSplitters: removeWordSplitters, splitCamelCase: splitCamelCase)));

  bool keywordEqual(
    T value, {
    bool forceLowerCase = true,
    bool removeDiacritics = true,
    bool removeWordSplitters = true,
    bool splitCamelCase = true,
  }) =>
      generateKeyword(this, forceLowerCase: forceLowerCase, removeDiacritics: removeDiacritics, removeWordSplitters: removeWordSplitters, splitCamelCase: splitCamelCase) ==
      generateKeyword(value, forceLowerCase: forceLowerCase, removeDiacritics: removeDiacritics, removeWordSplitters: removeWordSplitters, splitCamelCase: splitCamelCase);

  T? valid(List<bool> Function(T?)? validations, [string? throwErrorMessage]) => _valid(this, validations, throwErrorMessage);
}
