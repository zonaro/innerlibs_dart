import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

extension CompareAndSwap<T extends Comparable> on T {
  (T, T) compareAndSwap(T other) {
    T a = this;
    if (a.compareTo(other) > 0) {
      var temp = a;
      a = other;
      other = temp;
    }
    return (a, other);
  }
}

extension ObjectExtensions<T extends Object?> on T {
  /// Converts a value of type `Object` to a specified type `T`.
  ///
  /// This function can convert between `DateTime`, `num`, `int`, `double`, and `String` types.
  /// It assumes that the input is in a format that can be parsed to the desired type.
  ///
  /// Throws an `ArgumentError` if the conversion is not possible.
  ///
  /// Usage:
  /// ```dart
  /// print(parseTo<int>('123')); // prints: 123
  /// print(parseTo<double>('123.45')); // prints: 123.45
  /// print(parseTo<DateTime>('2024-05-27 13:18:56')); // prints: 2024-05-27 13:18:56.000
  /// print(parseTo<String>(123)); // prints: '123'
  /// ```
  ///
  /// [T] The type to convert the value to.
  /// [value] The value to convert.
  ///
  /// Returns the converted value of type `T`.
  R parseTo<R>() {
    if (this == null || T == R) {
      return this as R;
    } else if (R == DateTime) {
      return "$this".toDate() as R;
    } else if (R == num) {
      return num.parse("$this") as R;
    } else if (R == int) {
      return int.parse("$this") as R;
    } else if (R == double) {
      return double.parse("$this") as R;
    } else if (R == String) {
      return "$this" as R;
    } else {
      throw ArgumentError('Cannot convert $T to $R');
    }
  }

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

  bool isIn(List items) => this != null && items.contains(this);

  /// Checks if [this] is a valid value. The following values are considered invalid:
  /// Null, empty or only white spaces for [String], 0 for [num] , [minDate] for [DateTime]. Call [isValid] recursively on [List] items or [Map] values.
  /// Class thats implements [Validator] will be checked using [Validator.validate] function.
  /// Other class types, this method  call [ToString()] and check the result string against [isValid].
  bool get isValid {
    try {
      if (this == null) {
        return false;
      }
      if (this is String) {
        return (this as String).nullIf((s) => s == null || s.flatEqual("null")).isNotBlank;
      }
      if (this is bool) {
        return (this as bool);
      }
      if (this is num) {
        return this != 0;
      }
      if (this is DateTime) {
        return (this as DateTime) > minDate;
      }

      if (this is Validator) {
        return (this as Validator).validate().isEmpty;
      }

      if (this is Iterable) {
        var l = (this as Iterable);
        if (l.isEmpty) return false;
        for (var e in l) {
          if ((e as Object?).isValid) {
            return true;
          }
        }
        return false;
      }
      if (this is Map) {
        var m = (this as Map);
        return m.isNotEmpty && m.values.isValid;
      }

      return toString().isValid;
    } catch (e) {
      consoleLog("IsValid => ", error: e);
      return false;
    }
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
  }) {
    Text? text;

    if (this == null && defaultText == null) return null;

    if (this is Text) {
      text = this as Text;
    } else {
      if (validate == false || this.isValid) {
        text = Text("$this" | defaultText);
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

  /// Returns a [Widget] if the object is not null and is of type [Widget].
  /// Otherwise, it returns the result of the [asNullableText] method.
  Widget? get forceWidget {
    if (this == null) {
      return null;
    }
    if (this is Widget) {
      return this as Widget;
    }

    return asNullableText();
  }
}
