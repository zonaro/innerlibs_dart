import 'dart:math';
import 'dart:ui';

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
