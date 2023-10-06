import 'dart:ui';

import 'package:string_extensions/string_extensions.dart';

extension ColorExt on Color {
  String get hexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

  static Color fromHex(String hexString) => Color(int.parse(hexString.ifBlank("#00000000")!.replaceFirst('#', ''), radix: 16));
}
