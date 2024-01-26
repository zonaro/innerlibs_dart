import 'dart:ui';


extension ColorExt on Color {
  
  String get hexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

}
