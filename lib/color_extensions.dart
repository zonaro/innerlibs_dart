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
  /// Returns the alpha value of the color in hexadecimal format.
  String get alphaHexadecimal => '#${value.toRadixString(16).padLeft(8, '0')}';

  /// Returns a list of analogous colors.
  Iterable<Color> get analogousColors => modColors([30, -30]);

  /// Returns the ARGB value of the color.
  int get argb => value;

  /// Returns the black component of the color in CMYK color model.
  double get black => 1 - hsv.value;

  /// Returns the brightness of the color.
  double get brightness => hsv.value;

  /// Return the closest [NamedColor] to this color.
  NamedColor? get closestColor {
    var min = double.infinity;
    NamedColor? color;
    for (var color in NamedColor.values) {
      var d = color.distanceTo(this);
      if (d < min) {
        min = d;
        color = color;
      }
    }
    return color;
  }

  /// Returns the name of the closest [NamedColor] to this color.
  String get closestColorName => closestColor?.name ?? '';

  /// Returns the complementary color.
  Color get complementaryColor => modColor(180);

  /// Returns the CSS representation of the color.
  String get css => alpha == 255 ? 'rgb($red, $green, $blue)' : 'rgba($red, $green, $blue, $opacity)';

  /// Returns the cyan component of the color in CMYK color model.
  double get cyan => 1 - (red / 255);

  /// Returns the dominant value among the red, green, and blue components.
  int get dominantValue => [red, green, blue].max;

  /// Returns the hexadecimal representation of the color.
  String get hexadecimal => '#${value.toRadixString(16).removeFirst(2).padLeft(6, '0')}';

  /// Returns the HSL representation of the color.
  HSLColor get hsl => HSLColor.fromColor(this);

  /// Returns the HSV representation of the color.
  HSVColor get hsv => HSVColor.fromColor(this);

  /// Returns the hue of the color.
  double get hue => hsl.hue;

  /// Returns true if the color is dark.
  bool get isDark => brightness < 0.5;

  /// Returns true if the color is light.
  bool get isLight => !isDark;

  /// Returns the lightness of the color.
  double get lightness => hsl.lightness;

  /// The Luminance of this color.
  /// The Luminance is a measure of the brightness of a color.
  /// Returns a brightness value between 0 for darkest and 1 for lightest.
  /// This value is computationally expensive to calculate.
  double get luminance => computeLuminance();

  /// Returns the magenta component of the color in CMYK color model.
  double get magenta => 1 - (green / 255);

  /// Returns the opacity of the color.
  double get opacity => alpha / 255.0;

  /// Returns the saturation of the color.
  double get saturation => hsv.saturation;

  /// Returns a list of split-complementary colors.
  Iterable<Color> get splitComplementaryColors => modColors([150, 210]);

  /// Returns a list of tetradic colors.
  Iterable<Color> get tetradicColors => modColors([60, 180, 240]);

  /// Returns a list of triadic colors.
  Iterable<Color> get triadicColors => modColors([120, 240]);

  /// Returns the yellow component of the color in CMYK color model.
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

  /// Compares this color to another color.
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

  /// Returns a contrast color based on the brightness of the first color: A light color if the
  /// first color is dark. A dark color if the first color is light.
  ///
  /// TheColor: First color
  /// Percent: Degree of blending of the dark or light color
  ///
  /// Returns a light color if the first color is dark, a dark color if the first color is light.
  Color getContrastColor([double percent = .8]) => luminance < 0.5 ? this.makeDarker(percent) : this.makeLighter(percent);

  /// Checks if the color is a named color.
  bool isNamedColor(String value) {
    try {
      NamedColor.fromValue(value);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Blends two colors using Lerp
  ///
  /// FromColor: Color
  /// ToColor: Another color
  /// Amount: Blending index
  ///
  /// Returns the blended color

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

  /// Darkens the color by blending it with black
  ///
  /// TheColor: Color
  /// percent: Blending percentage
  ///
  /// Returns the blended color
  Color makeDarker([double percent = .5]) => mergeWith(Colors.black, percent);

  /// Lightens the color by blending it with white
  ///
  /// TheColor: Color
  /// percent: Blending percentage
  ///
  /// Returns the blended color
  Color makeLighter([double percent = .5]) => mergeWith(Colors.white, percent);

  /// Blends two colors based on a percentage
  ///
  /// TheColor: Main color
  /// AnotherColor: Blending color
  /// Percent: Blending percentage
  ///
  /// Returns the blended color
  Color mergeWith(Color anotherColor, double percent) => lerp(anotherColor, percent);

  /// Returns a color modified by the provided [degrees] int the color wheel.
  Color modColor(int degrees) => modColors([degrees]).first;

  /// Returns a list of colors that are modified by the provided [degrees] int the color wheel.
  Iterable<Color> modColors(IntList degrees) => degrees.map((degree) {
        var hsv = HSVColor.fromColor(this);
        return hsv.withHue((hsv.hue + degree) % 360).toColor();
      });
}
