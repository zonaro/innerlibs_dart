import 'dart:ui';

import 'package:innerlibs/string_extensions.dart';

extension ColorExtensions on Color {
  String get hexadecimal => '#${value.toRadixString(16).removeFirst(2).padLeft(6, '0')}';
  String get alphaHexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';
}
