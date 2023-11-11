import 'dart:math';
import 'dart:ui';

import 'package:innerlibs/num_extensions.dart';

Size sizeFromAspect({required String aspectRatio, double? width, double? height}) {
  if (width != null && height != null) {
    return Size(width, height);
  }

  var ratioParts = aspectRatio.split(':').map((e) => double.parse(e)).toList();
  if (ratioParts.length != 2) {
    throw ArgumentError('Invalid aspect ratio format. It should be in the format "width:height".');
  }

  if (width != null) {
    return Size(width, width / max(ratioParts[0], ratioParts[1]) * min(ratioParts[0], ratioParts[1]));
  } else if (height != null) {
    return Size(height / min(ratioParts[0], ratioParts[1]) * max(ratioParts[0], ratioParts[1]), height);
  } else {
    throw ArgumentError('Either width or height must be provided.');
  }
}

extension SizeExt on Size {
  String get getAspectratioString {
    var h = height;
    var w = width;
    while (w.hasDecimal) {
      w = w * 10;
    }
    while (h.hasDecimal) {
      h = h * 10;
    }

    var gcd = w.findGreatestCommonDivisor(h.round());
    return '${w ~/ gcd}:${h ~/ gcd}';
  }
}
