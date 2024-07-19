// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/innerlibs.dart';

void main() {
  test(' ', () {
    "a,b c;d".splitAny([",", ";", " "]).forEach((x) => print(x));
  });

  test('Camel', () {
    for (var x in "TesteDeUppercaseComUFPresente".camelSplit) {
      print(x);
    }
  });

  test(' ', () {
    var t = " isso é um ! teste [r],[ aaaaa         ] ( fixo )\r\n    nova linha nos esquema\r\nai a gente usa' aspas'   tudo'cagado   '".fixText;
    print(t);
  });

  test(' ', () {
    for (var x in [
      identArrow(length: 8, pattern: ">"),
      identArrow(length: -8, pattern: ">"),
      identArrow(length: 8, pattern: "=>"),
      identArrow(length: -8, pattern: "=>"),
      identArrow(length: -8, pattern: "=>"),
    ]) {
      print(x);
    }
  });

  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    print(t);
  });

  test(' ', () async {
    var t = await OEmbed.fromUri(Uri.parse("https://music.youtube.com/watch?v=_-5WRZniBYE&si=dIlBFN_VlGaV8m47"));
    print(t.html);
  });
}
