import 'dart:ui';


extension ColorExtensions on Color {
  
  String get hexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

}
