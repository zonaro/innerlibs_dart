import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';

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
    var t = " isso é um ! teste [r],[ aaaaa         ] ( fixo )\r\n    nova linha nos esquema\r\nai a gente usa' aspas'   tudo'cagado   '".fixText;
    consoleLog(t);
  });

  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    consoleLog(t);
  });
}
