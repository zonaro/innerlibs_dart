import 'dart:ui';

import 'package:string_extensions/string_extensions.dart';

extension ColorExt on Color {
  String get hexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

}
