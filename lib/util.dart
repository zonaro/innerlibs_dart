import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

Size sizeFromAspect({required String aspectRatio, double? width, double? height, String separator = ":"}) {
  if (separator.isEmpty || separator.isNull) {
    separator = ":";
  } else if (separator.isBlank) {
    separator = " ";
  }

  if (width != null && height != null) {
    return Size(width, height);
  }

  var ratioParts = aspectRatio.split(separator).map((e) => double.parse(e)).toList();
  if (ratioParts.length != 2) {
    throw ArgumentError('Invalid aspect ratio format. It should be in the format "width${separator}height".');
  }

  if (width != null) {
    return Size(width, width / max(ratioParts[0], ratioParts[1]) * min(ratioParts[0], ratioParts[1]));
  } else if (height != null) {
    return Size(height / min(ratioParts[0], ratioParts[1]) * max(ratioParts[0], ratioParts[1]), height);
  } else {
    throw ArgumentError('Either width or height must be provided.');
  }
}

mixin SqlUtil {
  static string defaultQuoteChar = '[';

  static string columnsFromList(strings items, [string? quoteChar]) => items.map((e) => e.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)).join(",");

  static string columnsFromMap(Map items, [string? quoteChar]) => columnsFromList(items.keys.map((x) => "$x").toList(), quoteChar);

  static string valuesFromList(Iterable items, [bool nullAsBlank = false]) => items.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(", ");

  static string valuesFromMap(Map items, [bool nullAsBlank = false]) => valuesFromList(items.values, nullAsBlank);

  static string getIdentity(string dataBaseProvider) {
    dataBaseProvider - " ";
    if (dataBaseProvider.flatEqualAny(["mssql", "sqlserver"])) {
      return "SCOPE_IDENTITY()";
    }
    if (dataBaseProvider.flatEqualAny(["mysql", "mariadb"])) {
      return "LAST_INSERT_ID()";
    }
    throw ArgumentError("Cannot identify database provider: $dataBaseProvider", "dataBaseProvider");
  }
}
