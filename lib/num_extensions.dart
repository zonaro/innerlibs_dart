library innerlibs;

import 'package:innerlibs/string_extensions.dart';
import 'package:string_extensions/string_extensions.dart';

extension NumExtensions on num {
  
  String quantityText(String plural, [String singular = ""]) => (round() == 1 || round() == -1) ? singular.ifBlank(plural.singular)! : plural;
}
