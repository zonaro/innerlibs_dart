import 'dart:ui';

import 'package:flutter/material.dart' show Colors;
import 'package:innerlibs/hsv_color.dart';
import 'package:innerlibs/string_extensions.dart';

extension ColorExtensions on Color {
  String get alphaHexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';
  String get hexadecimal => '#${value.toRadixString(16).removeFirst(2).padLeft(6, '0')}';

  HSVColor get hsv => HSVColor(this);

  /// Retorna uma cor de contraste baseado na iluminacao da primeira cor: Uma cor clara se a
  /// primeira for escura. Uma cor escura se a primeira for clara
  ///
  /// TheColor: Primeira cor
  /// Percent: Grau de mesclagem da cor escura ou clara
  ///
  /// Retorna uma cor clara se a primeira cor for escura, uma cor escura se a primeira for clara
  Color getContrastColor(double percent) {
    double a = 1 - (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    int d = a < 0.5 ? 0 : 255;
    return mergeWith(Color.fromRGBO(d, d, d, 1), percent);
  }

  /// Mescla duas cores usando Lerp
  ///
  /// FromColor: Cor
  /// ToColor: Outra cor
  /// Amount: Indice de mesclagem
  ///
  /// Retorna a cor mesclada
  Color lerp(Color toColor, double amount) {
    // start colours as lerp-able floats
    double sr = red.toDouble();
    double sg = green.toDouble();
    double sb = blue.toDouble();
    // end colours as lerp-able floats
    double er = toColor.red.toDouble();
    double eg = toColor.green.toDouble();
    double eb = toColor.blue.toDouble();
    // lerp the colours to get the difference
    int r = (sr + (er - sr) * amount).round();
    int g = (sg + (eg - sg) * amount).round();
    int b = (sb + (eb - sb) * amount).round();
    // return the new colour
    return Color.fromRGBO(r, g, b, 1.0);
  }

  /// Escurece a cor misturando ela com preto
  ///
  /// TheColor: Cor
  /// percent: Porcentagem de mesclagem
  ///
  /// Retorna a cor mesclada
  Color makeDarker([double percent = .5]) => mergeWith(Colors.black, percent);

  /// Clareia a cor misturando ela com branco
  ///
  /// TheColor: Cor
  /// percent: Porcentagem de mesclagem
  ///
  /// Retorna a cor mesclada
  Color makeLighter([double percent = .5]) => mergeWith(Colors.white, percent);

  /// Mescla duas cores a partir de uma porcentagem
  ///
  /// TheColor: Cor principal
  /// AnotherColor: Cor de mesclagem
  /// Percent: Porcentagem de mescla
  ///
  /// Retorna a cor mesclada
  Color mergeWith(Color anotherColor, double percent) => lerp(anotherColor, percent);
}
