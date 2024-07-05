import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/utils/constants.dart';

void main() {
  test(' ', () {
    "a,b c;d".splitAny([",", ";", " "]).forEach((x) => consoleLog(x));
  });

  test('Camel', () {
    for (var x in "TesteDeUppercaseComUFPresente".camelSplit) {
      consoleLog(x);
    }
  });

  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    consoleLog(t);
  });

  test(' ', () {
    for (var m in DateConstants.months) {
      consoleLog(m.month);
    }
  });
}
