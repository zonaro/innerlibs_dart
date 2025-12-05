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
  String get alphaHexadecimal => '#${argb.toRadixString(16).padLeft(8, '0')}';

  /// Returns a list of analogous colors.
  Iterable<Color> get analogousColors => modColors([30, -30]);

  /// A 32 bit value representing this color.
  ///
  /// The bits are assigned as follows:
  ///
  /// * Bits 24-31 are the alpha value.
  /// * Bits 16-23 are the red value.
  /// * Bits 8-15 are the green value.
  /// * Bits 0-7 are the blue value.
  int get argb => a.floatToInt8 << 24 | r.floatToInt8 << 16 | g.floatToInt8 << 8 | b.floatToInt8 << 0;

  /// Returns the black component of the color in CMYK color model.
  double get b => cmyk[3];

  /// Returns the brightness of the color.
  double get brightness => hsv.value;

  /// Returns the cyan component of the color in CMYK color model.
  double get c => cmyk[0];

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

  List<double> get cmyk {
    double c = 1 - (r / 255);
    double m = 1 - (g / 255);
    double y = 1 - (b / 255);
    double k = 1;
    if (c < k) k = c;
    if (m < k) k = m;
    if (y < k) k = y;
    if (k < 1) {
      c = (c - k) / (1 - k);
      m = (m - k) / (1 - k);
      y = (y - k) / (1 - k);
    } else {
      c = 0;
      m = 0;
      y = 0;
    }
    return [c, m, y, k];
  }

  /// Returns the complementary color.
  Color get complementaryColor => modColor(180);

  /// Returns the CSS representation of the color.
  String get css => a == 1 ? 'rgb($r, $g, $b)' : 'rgba($r, $g, $b, $a)';

  /// Returns the dominant value among the red, green, and blue components.
  double get dominantValue => [r, g, b].max;

  /// Returns the hexadecimal representation of the color.
  String get hexadecimal => '#${argb.toRadixString(16).removeFirst(2).padLeft(6, '0')}';

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
  double get m => cmyk[1];

  Color get readableColor => isLight ? Colors.black : Colors.white;

  Iterable<double> get rgb => [r, g, b];

  Iterable<double> get rgba => [r, g, b, a];

  /// Returns the saturation of the color.
  double get saturation => hsv.saturation;

  /// Returns a list of split-complementary colors.
  Iterable<Color> get splitComplementaryColors => modColors([150, 210]);

  /// Returns a list of tetradic colors.
  Iterable<Color> get tetradicColors => modColors([60, 180, 240]);

  /// Returns a list of triadic colors.
  Iterable<Color> get triadicColors => modColors([120, 240]);

  /// Returns the yellow component of the color in CMYK color model.
  double get y => cmyk[2];

  Color operator *(other) {
    double red = 0;
    double green = 0;
    double blue = 0;
    double alpha = 0;

    if (other is num) {
      red = (r * other).clamp(0, 255);
      green = (g * other).clamp(0, 255);
      blue = (b * other).clamp(0, 255);
      alpha = (a * other).clamp(0, 255);
    } else {
      var c = flatString(other).asColor;
      red = (r * c.r).clamp(0, 255);
      green = (g * c.g).clamp(0, 255);
      blue = (b * c.b).clamp(0, 255);
      alpha = (a * c.a).clamp(0, 255);
    }

    return Color.from(alpha: alpha, red: red, green: green, blue: blue);
  }

  Color operator +(other) {
    double red = 0;
    double green = 0;
    double blue = 0;
    double alpha = 0;

    if (other is num) {
      red = (r + other).clamp(0, 255);
      green = (g + other).clamp(0, 255);
      blue = (b + other).clamp(0, 255);
      alpha = (a + other).clamp(0, 255);
    } else {
      var c = flatString(other).asColor;
      red = (r + c.r).clamp(0, 255);
      green = (g + c.g).clamp(0, 255);
      blue = (b + c.b).clamp(0, 255);
      alpha = (a + c.a).clamp(0, 255);
    }

    return Color.from(alpha: alpha, red: red, green: green, blue: blue);
  }

  operator -(other) {
    double red = 0;
    double green = 0;
    double blue = 0;
    double alpha = 0;

    if (other is num) {
      red = (r - other).clamp(0, 255);
      green = (g - other).clamp(0, 255);
      blue = (b - other).clamp(0, 255);
      alpha = (a - other).clamp(0, 255);
    } else {
      var c = flatString(other).asColor;
      red = (r - c.r).clamp(0, 255);
      green = (g - c.g).clamp(0, 255);
      blue = (b - c.b).clamp(0, 255);
      alpha = (a - c.a).clamp(0, 255);
    }

    return Color.from(alpha: alpha, red: red, green: green, blue: blue);
  }

  /// Change the color opacity
  Color changeOpacity(double opacity) => withAlpha((opacity.clamp(0, 1) * 255).round());
  
  Color changeOpacityPercent(int opacity) => changeOpacity(opacity.clamp(0, 100) / 100);

  /// Compares this color to another color.
  int compareColor(dynamic other) {
    if (other is int) {
      return argb.compareTo(other);
    } else if (other is Color) {
      return argb.compareTo(other.argb);
    } else if (other is String) {
      return argb.compareTo(other.asColor.argb);
    } else if (other is HSLColor) {
      return other.toColor().argb.compareTo(argb);
    } else if (other is HSVColor) {
      return other.toColor().argb.compareTo(argb);
    } else {
      throw ArgumentError('Cannot compare $Color with ${other.runtimeType}');
    }
  }

  /// Returns a color that is a darker version of this color.
  Color darken([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final darker = withLightness((lightness - amount).clamp(0.0, 1.0));
    return darker;
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
  Color getContrastColor([double percent = .8]) => isLight ? darken(percent) : lighten(percent);

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
    double sr = this.r.toDouble();
    double sg = this.g.toDouble();
    double sb = this.b.toDouble();
    // end colours as lerp-able floats
    double er = toColor.r.toDouble();
    double eg = toColor.g.toDouble();
    double eb = toColor.b.toDouble();
    // lerp the colours to get the difference
    int r = (sr + (er - sr) * amount).round();
    int g = (sg + (eg - sg) * amount).round();
    int b = (sb + (eb - sb) * amount).round();
    // return the new colour
    return Color.fromRGBO(r, g, b, 1.0);
  }

  /// Returns a color that is a lighter version of this color.
  Color lighten([double amount = .5]) {
    assert(amount >= 0 && amount <= 1);
    final lighter = withLightness((lightness + amount).clamp(0.0, 1.0));
    return lighter;
  }

  /// Blends two colors based on a percentage
  ///
  /// TheColor: Main color
  /// AnotherColor: Blending color
  /// Percent: Blending percentage
  ///
  /// Returns the blended color
  Color mergeWith(Color anotherColor, double percent) => lerp(anotherColor, percent);

  Color mixChannel(Color other, double proportion) {
    double mixChannel(double lower, double upper) => (lower + ((upper - lower) * proportion));
    return Color.from(
      alpha: mixChannel(a, other.a),
      red: mixChannel(r, other.r),
      green: mixChannel(g, other.g),
      blue: mixChannel(b, other.b),
    );
  }

  /// Returns a color modified by the provided [degrees] int the color wheel.
  Color modColor(int degrees) => modColors([degrees]).first;

  /// Returns a list of colors that are modified by the provided [degrees] int the color wheel.
  Iterable<Color> modColors(IntList degrees) => degrees.map((degree) {
        var hsv = HSVColor.fromColor(this);
        return hsv.withHue((hsv.hue + degree) % 360).toColor();
      });

  /// Returns a color with the specified lightness value.
  ///
  /// The value should be between 0 and 1, where 0 is black and 1 is white.
  /// Values outside this range will throw an assertion error.
  ///
  /// Example:
  /// ```dart
  /// final color = Colors.blue;
  /// final lighterColor = color.withLightness(0.8);
  /// ```
  Color withLightness(double value) {
    assert(value >= 0 && value <= 1);
    return hsl.withLightness(value).toColor();
  }
}
