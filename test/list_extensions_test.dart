import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innerlibs/brazil_tools.dart';
import 'package:innerlibs/util.dart';

void main() {
  test(' ', () {
    var t = const Size(1920, 1080).getAspectRatioString();
    debugPrint(t);
  });

   test(' ', () {
    var t = Brasil.pegarEstado("São Paulo");
    debugPrint(t?.uf);
  });
}
