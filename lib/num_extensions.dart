

import 'package:innerlibs/string_extensions.dart';
import 'package:string_extensions/string_extensions.dart';

extension NumExtensions on num {
  String quantityText(String plural, [String singular = ""]) => (round() == 1 || round() == -1) ? singular.ifBlank(plural.singular)! : plural;
  String quantityTextPt(String plural, [String singular = ""]) => (round() == 1 || round() == -1) ? singular.ifBlank(plural.singularPt)! : plural;

  int findGreatestCommonDivisor(int b) {
    int a = round();
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  bool get hasDecimal => this != floor();
}
