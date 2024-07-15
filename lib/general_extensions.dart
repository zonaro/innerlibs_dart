import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

/// Extension method that compares two values and swaps them if necessary.
///
/// This extension method can be used on any type that extends the `Comparable` class.
/// It compares the current value with the `other` value and swaps them if the current value is greater.
/// The method returns a tuple containing the updated values.
extension CompareAndSwap<T extends Comparable> on T {
  /// Compares the current value with the `other` value and swaps them if necessary.
  ///
  /// Returns a tuple containing the updated values.
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

bool _valid(dynamic obj) => isValid(obj);
R? _parseTo<R>(value) => parseTo<R>(value);

extension ObjectExtensions<T extends Object?> on T {
  bool get isNullable {
    try {
      // throws an exception if T is not nullable
      final _ = null as T;
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Converts a value of type `Object` to a specified type `T`.
  ///
  /// This function can convert between `bool`, `DateTime`, `num`, `int`, `double`, and `String` types.
  /// It assumes that the input is in a format that can be parsed to the desired type.
  ///
  /// return null if the conversion is not possible.
  ///
  /// Usage:
  /// ```dart
  /// print(parseTo<int>('123')); // prints: 123
  /// print(parseTo<double>('123.45')); // prints: 123.45
  /// print(parseTo<DateTime>('2024-05-27 13:18:56')); // prints: 2024-05-27 13:18:56.000
  /// print(parseTo<String>(123)); // prints: '123'
  /// print(parseTo<bool>('y')); // prints: true
  /// ```
  ///
  /// [T] The type to convert the value to.
  /// [value] The value to convert.
  ///
  /// Returns the converted value of type `T`.
  R? parseTo<R>() => _parseTo<R>(this);

  // return a string of this object as a SQL Value
  String asSqlValue([bool nullAsBlank = false]) {
    if (this == null) {
      return nullAsBlank ? "''" : "NULL";
    } else if (this is Map) {
      return jsonEncode(this).asSqlValue(nullAsBlank);
    } else if (this is Iterable) {
      return (this as Iterable).map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(",").wrap("(");
    } else if (this is num) {
      return toString();
    } else if (this is bool) {
      return this == true ? "1" : "0";
    } else if (this is DateTime) {
      return "'${(this as DateTime).toIso8601String()}'";
    } else {
      string s = "$this";
      if (s.isBlank && nullAsBlank == false) {
        return 'NULL';
      } else {
        return "'${this!.toString().replaceAll("'", "''")}'";
      }
    }
  }

  /// Checks if the current object is present in the given list.
  /// Returns `true` if the current object is not `null` and is present in the list,
  /// otherwise returns `false`.
  bool isIn(List items) => this != null && items.contains(this);

  /// Checks if [this] is a valid value. The following values are considered invalid:
  /// Null, empty or only white spaces for [String], 0 for [num] , [minDate] for [DateTime]. Call [isValid] recursively on [List] items or [Map] values.
  /// Class thats implements [Validator] will be checked using [Validator.validate] function.
  /// Other class types, this method  call [ToString()] and check the result string against [isValid].
  bool get isValid => _valid(this);

  /// Checks if the current string is equal to the given [text] when both are flattened.
  /// Returns `true` if they are equal, `false` otherwise.
  bool flatEqual(T text) => asFlat == text?.asFlat;

  /// Checks if the current string contains the given [text] when both are flattened.
  /// If the current string is blank, it returns `true` only if the [text] is also blank.
  /// If the [text] is blank, it returns `true`.
  /// Otherwise, it checks if the current string contains the [text] when both are flattened.
  /// Returns `true` if the current string contains the [text], `false` otherwise.
  bool flatContains(T text) {
    if (asFlat.isBlank) return text.asFlat.isBlank;

    if (text.asFlat.isBlank) {
      return true;
    }
    return asFlat.contains(text!.asFlat);
  }

  /// Returns flat representation string by removing diacritics, converting to lowercase, and trimming all whitespace.
  string get asFlat => flatString(this);

  /// Checks if any of the strings in the given [texts] iterable is equal to the current string.
  /// Returns `true` if any string is equal, otherwise returns `false`.
  bool flatEqualAny(Iterable<T> texts) {
    for (var t in texts) {
      if (flatEqual(t)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if the string contains any of the specified texts.
  ///
  /// Returns `true` if the string contains any of the texts in the [texts] iterable,
  /// otherwise returns `false`.
  bool flatContainsAny(Iterable<T> texts) {
    for (var t in texts) {
      if (flatContains(t)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if [this] is not a Blank value:
  ///(Null, empty or only white spaces for [String], 0 for [num] , [DateTimeExtensions.min] for [DateTime], Call [isNotValid] recursively on [List] or [Map] values. Other class types, call [ToString()] and check ).
  bool get isNotValid => !isValid;

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
  /// - 'NULL', 'CANCEL', 'CANCELAR': Returns `null`.
  /// - '', '!', '0', 'FALSE', 'NOT', 'NAO', 'NO', 'NOP', 'DISABLED', 'DISABLE', 'OFF', 'DESATIVADO', 'DESATIVAR', 'DESATIVO', 'N','X': Returns `false`.
  /// - '1', 'S', 'TRUE', 'YES', 'YEP', 'SIM', 'ENABLED', 'ENABLE', 'ON', 'Y', 'ATIVO', 'ATIVAR', 'ATIVADO', 'OK','C': Returns `true`.
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
        return true;
      default:
        return everythingIsTrue ? true : throw ArgumentError('The object does not represent a valid option and the EverythingIsTrue flag is set to false.');
    }
  }

  /// Converts the object to a [Text] widget with the specified properties.
  ///
  /// If the object is null, it returns [defaultText] in a [Text] widget.
  /// If the object is already a [Text] widget, it returns the object itself.
  /// If [validate] is true and the object is not valid (see [isValid]), it returns [defaultText] in a [Text] widget.
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

  /// Converts the object to a nullable [Text] widget with the specified properties.
  ///
  /// If the object is null, it returns null.
  /// If the object is already a [Text] widget, it returns the object itself.
  /// If [validate] is true and the object is not valid (see [isValid]), it returns null.
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

    if (this == null && defaultText == null) return null;

    if (this is Text) {
      text = this as Text;
    } else {
      if (validate == false || this.isValid) {
        if (this is Map || this is List) {
          text = Text(jsonEncode(this));
        } else if (this is DateTime) {
          text = Text((this as DateTime).format(dateFormat, locale?.countryCode));
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
  Widget? forceWidget({
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
    if (this != null && this is Widget) {
      return this as Widget;
    }

    return asNullableText(
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
}
