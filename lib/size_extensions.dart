import 'package:flutter/material.dart';
import 'package:innerlibs/num_extensions.dart';

extension SizeExtensions on Size {
  String getAspectRatioString([String separator = ":"]) {
    var h = height;
    var w = width;
    while (w.hasDecimal) {
      w = w * 10;
    }
    while (h.hasDecimal) {
      h = h * 10;
    }

    var gcd = w.findGreatestCommonDivisor(h.floor());
    return '${w ~/ gcd}$separator${h ~/ gcd}';
  }
}
