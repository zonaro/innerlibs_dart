import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ColorUtils {
  static Iterable<Color> createColors(List<dynamic> values) => values.map((color) => "$color".asColor);

  static Color fromCMYK(int c, int m, int y, int k, [int a = 1]) {
    var r = 255 * (1 - c) * (1 - k);
    var g = 255 * (1 - m) * (1 - k);
    var b = 255 * (1 - y) * (1 - k);
    return Color.fromARGB(a, r.round(), g.round(), b.round());
  }
}

extension ColorExtensions<T extends Color> on T {
  String get alphaHexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

  Iterable<Color> get analogousColors => modColors([30, -30]);

  int get argb => value;
  double get black => 1 - hsv.value;

  double get brightness => hsv.value;

  NamedColor? get closestColor {
    var min = double.infinity;
    NamedColor? color;
    for (var color in NamedColor.values) {
      var d = color.color.distanceTo(this);
      if (d < min) {
        min = d;
        color = color;
      }
    }
    return color;
  }

  string get closestColorName => closestColor?.name ?? '';

  Color get complementaryColor => modColor(180);

  String get css => alpha == 255 ? 'rgb($red, $green, $blue)' : 'rgba($red, $green, $blue, $opacity)';

  double get cyan => 1 - (red / 255);

  int get dominantValue => [red, green, blue].max;

  String get hexadecimal => '#${value.toRadixString(16).removeFirst(2).padLeft(6, '0')}';

  HSLColor get hsl => HSLColor.fromColor(this);

  HSVColor get hsv => HSVColor.fromColor(this);

  double get hue => hsl.hue;

  double get lightness => hsl.lightness;

  /// The Luminance of this color.
  /// The Luminance is a measure of the brightness of a color.
  double get luminance => 0.2126 * red + 0.7152 * green + 0.0722 * blue;

  double get magenta => 1 - (green / 255);

  double get opacity => alpha / 255.0;

  double get saturation => hsv.saturation;

  /// The Split-Complementary colors of this color.
  Iterable<Color> get splitComplementaryColors => modColors([150, 210]);

  Iterable<Color> get triadicColors => modColors([120, 240]);

  double get yellow => 1 - (blue / 255);

  Color operator *(other) {
    if (other is num) {
      var red = (this.red * other).clamp(0, 255).round();
      var green = (this.green * other).clamp(0, 255).round();
      var blue = (this.blue * other).clamp(0, 255).round();
      var alpha = (this.alpha * other).clamp(0, 255).round();
      return Color.fromARGB(alpha, red, green, blue);
    }

    var c = "$other".asColor;
    var red = (this.red * c.red).clamp(0, 255);
    var green = (this.green * c.green).clamp(0, 255);
    var blue = (this.blue * c.blue).clamp(0, 255);
    var alpha = (this.alpha * c.alpha).clamp(0, 255);
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color operator +(other) {
    if (other is num) {
      var red = (this.red + other).clamp(0, 255).round();
      var green = (this.green + other).clamp(0, 255).round();
      var blue = (this.blue + other).clamp(0, 255).round();
      var alpha = (this.alpha + other).clamp(0, 255).round();
      return Color.fromARGB(alpha, red, green, blue);
    }

    var c = "$other".asColor;
    var red = (this.red + c.red).clamp(0, 255);
    var green = (this.green + c.green).clamp(0, 255);
    var blue = (this.blue + c.blue).clamp(0, 255);
    var alpha = (this.alpha + c.alpha).clamp(0, 255);
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color operator -(other) {
    if (other is num) {
      var red = (this.red - other).clamp(0, 255).round();
      var green = (this.green - other).clamp(0, 255).round();
      var blue = (this.blue - other).clamp(0, 255).round();
      var alpha = (this.alpha - other).clamp(0, 255).round();
      return Color.fromARGB(alpha, red, green, blue);
    }

    var c = "$other".asColor;
    var red = (this.red - c.red).clamp(0, 255);
    var green = (this.green - c.green).clamp(0, 255);
    var blue = (this.blue - c.blue).clamp(0, 255);
    var alpha = (this.alpha - c.alpha).clamp(0, 255);
    return Color.fromARGB(alpha, red, green, blue);
  }

  int compareColor(dynamic other) {
    if (other is int) {
      return argb.compareTo(other);
    } else if (other is NamedColor) {
      return argb.compareTo(other.argb);
    } else if (other is Color) {
      return argb.compareTo(other.value);
    } else if (other is String) {
      return argb.compareTo(other.asColor.argb);
    } else if (other is HSLColor) {
      return other.toColor().value.compareTo(argb);
    } else if (other is HSVColor) {
      return other.toColor().value.compareTo(argb);
    } else {
      throw ArgumentError('Cannot compare $Color with ${other.runtimeType}');
    }
  }

  /// Calculates the distance between this HSVColor and the provided [color].
  ///
  /// The distance is calculated by taking the absolute difference between the hue,
  /// saturation, and brightness values of this color and the provided [color],
  /// and summing them up.
  ///
  /// Returns the calculated distance.
  double distanceTo(Color color) {
    var h = (hue - color.hue).abs();
    var s = (saturation - color.saturation).abs();
    var v = (brightness - color.brightness).abs();
    return h + s + v;
  }

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
    if (amount.isNaN) return this;
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

  Color modColor(int degrees) => modColors([degrees]).first;

  /// Returns a list of colors that are modified by the provided [degrees] int the color wheel.
  Iterable<Color> modColors(IntList degrees) => degrees.map((degree) {
        var hsv = HSVColor.fromColor(this);
        return hsv.withHue((hsv.hue + degree) % 360).toColor();
      });
}
