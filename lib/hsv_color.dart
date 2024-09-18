import 'package:flutter/material.dart';
import 'package:innerlibs/colornames.dart';
import 'package:innerlibs/innerlibs.dart';

/// A class that represents a color with a name and description.
class NamedColor implements Color, Comparable<NamedColor> {
  late double _h, _s, _v;
  late String _name;
  late Color _scolor;

  String description = "";

  NamedColor([Color color = Colors.transparent, String? name, string description = ""]) {
    _loadColor(color);
    _name = name ?? color.alphaHexadecimal;
    description = description;
  }

  @override
  NamedColor.fromARGB(int a, int r, int g, int b) : this(Color.fromARGB(a, r, g, b));

  NamedColor.fromInt(int argb) : this(Color(argb));

  NamedColor.fromRGB(int r, int g, int b) : this.fromInt(255 << 24 | r << 16 | g << 8 | b);

  NamedColor.fromString(String color, [string? name, string description = ""]) {
    if (name == null && ColorNames.isNamedColor(color)) {
      var named = ColorNames.fromValue(color);
      color = named.hexadecimal;
      name ??= named.name;
    }

    _loadColor(color.asColor);
    _name = name ?? color;
    description = description;
  }

  factory NamedColor.fromValue(dynamic value) {
    if (value is NamedColor) {
      return NamedColor.fromString(value.hexadecimal, value.name, value.description);
    } else if (value is Color) {
      return NamedColor(value);
    } else if (value is String) {
      return NamedColor.fromString(value);
    } else if (value is num) {
      return NamedColor.fromInt(value.round());
    } else {
      return NamedColor.fromString(flatString(value));
    }
  }

  @override
  int get alpha => _scolor.alpha;
  set alpha(int value) => _loadColor(_scolor.withAlpha(value));

  Iterable<NamedColor> get analogousColors => modColors([30, -30]);
  int get argb => _scolor.value;

  set argb(int value) => _loadColor(Color(value));
  @override
  int get blue => _scolor.blue;

  set blue(int value) => _loadColor(_scolor.withBlue(value));

  double get brightness => _v;

  set brightness(double value) {
    value = value.clamp(0.0, 1.0);
    if (_v != value) {
      _v = value;
      _setColor();
    }
  }

  NamedColor? get closestColor {
    var min = double.infinity;
    NamedColor? color;
    for (var color in ColorNames.values) {
      var d = color.color.distanceTo(this);
      if (d < min) {
        min = d;
        color = color;
      }
    }
    return color;
  }

  string get closestColorName {
    var min = double.infinity;
    String? name;
    for (var color in ColorNames.values) {
      var d = color.color.distanceTo(this);
      if (d < min) {
        min = d;
        name = color.name;
      }
    }
    return name ?? "";
  }

  NamedColor get complementaryColor => modColor(180);

  String get css => alpha == 255 ? 'rgb($red, $green, $blue)' : 'rgba($red, $green, $blue, $opacity)';

  /// The Dominant value of this color.
  int get dominantValue => [red, green, blue].max;

  @override
  int get green => _scolor.green;
  set green(int value) => _loadColor(_scolor.withGreen(value));

  String get hexadecimal => _scolor.hexadecimal;

  set hexadecimal(String value) => value.isHexadecimalColor ? _loadColor(value.asColor) : throw ArgumentError('Invalid hexadecimal color: $value');

  double get hue => _h;

  set hue(double value) {
    if (_h != value) {
      _h = value;
      while (_h < 0.0) {
        _h += 360.0;
      }
      while (_h > 360.0) {
        _h -= 360.0;
      }
      _h = _h.clampRotate(0.0, 360.0);
      _setColor();
    }
  }

  /// The Luminance of this color.
  /// The Luminance is a measure of the brightness of a color.
  double get luminance => 0.2126 * red + 0.7152 * green + 0.0722 * blue;

  /// The Name of this color.
  /// If the name is not set, it will return the closest color name from the [ColorNames] list.
  String get name => _name.isEmpty ? closestColorName : _name;

  set name(String value) => _name = value;
  @override
  double get opacity => alpha / 255.0;

  set opacity(double value) => alpha = (value * 255).toInt();

  @override
  int get red => _scolor.red;

  set red(int value) => _loadColor(_scolor.withRed(value));
  double get saturation => _s;

  set saturation(double value) {
    value = value.clamp(0.0, 1.0);
    if (_s != value) {
      _s = value;
      _setColor();
    }
  }

  /// The Split-Complementary colors of this color.
  Iterable<NamedColor> get splitComplementaryColors => modColors([150, 210]);

  Iterable<NamedColor> get triadicColors => modColors([120, 240]);

  @override
  int get value => _scolor.value;

  set value(int value) => _loadColor(Color(value));

  NamedColor operator *(other) {
    if (other is num) {
      var red = (this.red * other).clamp(0, 255).round();
      var green = (this.green * other).clamp(0, 255).round();
      var blue = (this.blue * other).clamp(0, 255).round();
      var alpha = (this.alpha * other).clamp(0, 255).round();
      return NamedColor.fromARGB(alpha, red, green, blue);
    }

    var c = NamedColor.fromValue(other);
    var red = (this.red * c.red).clamp(0, 255);
    var green = (this.green * c.green).clamp(0, 255);
    var blue = (this.blue * c.blue).clamp(0, 255);
    var alpha = (this.alpha * c.alpha).clamp(0, 255);
    return NamedColor.fromARGB(alpha, red, green, blue);
  }

  NamedColor operator +(other) {
    if (other is num) {
      var red = (this.red + other).clamp(0, 255).round();
      var green = (this.green + other).clamp(0, 255).round();
      var blue = (this.blue + other).clamp(0, 255).round();
      var alpha = (this.alpha + other).clamp(0, 255).round();
      return NamedColor.fromARGB(alpha, red, green, blue);
    }

    var c = NamedColor.fromValue(other);
    var red = (this.red + c.red).clamp(0, 255);
    var green = (this.green + c.green).clamp(0, 255);
    var blue = (this.blue + c.blue).clamp(0, 255);
    var alpha = (this.alpha + c.alpha).clamp(0, 255);
    return NamedColor.fromARGB(alpha, red, green, blue);
  }

  NamedColor operator -(other) {
    if (other is num) {
      var red = (this.red - other).clamp(0, 255).round();
      var green = (this.green - other).clamp(0, 255).round();
      var blue = (this.blue - other).clamp(0, 255).round();
      var alpha = (this.alpha - other).clamp(0, 255).round();
      return NamedColor.fromARGB(alpha, red, green, blue);
    }

    var c = NamedColor.fromValue(other);
    var red = (this.red - c.red).clamp(0, 255);
    var green = (this.green - c.green).clamp(0, 255);
    var blue = (this.blue - c.blue).clamp(0, 255);
    var alpha = (this.alpha - c.alpha).clamp(0, 255);
    return NamedColor.fromARGB(alpha, red, green, blue);
  }

  /// Return a new instance of [NamedColor] with the same values as this instance.
  NamedColor clone() => NamedColor(_scolor, _name, description);

  @override
  int compareTo(dynamic other) {
    if (other is int) {
      return argb.compareTo(other);
    } else if (other is NamedColor) {
      return argb.compareTo(other.argb);
    } else if (other is Color) {
      return argb.compareTo(other.value);
    } else {
      throw ArgumentError('Cannot compare $NamedColor with ${other.runtimeType}');
    }
  }

  @override
  double computeLuminance() => _scolor.computeLuminance();

  /// Calculates the distance between this HSVColor and the provided [color].
  ///
  /// The distance is calculated by taking the absolute difference between the hue,
  /// saturation, and brightness values of this color and the provided [color],
  /// and summing them up.
  ///
  /// Returns the calculated distance.
  double distanceTo(NamedColor color) {
    var h = (hue - color.hue).abs();
    var s = (saturation - color.saturation).abs();
    var v = (brightness - color.brightness).abs();
    return h + s + v;
  }

  NamedColor modColor(int degrees) => modColors([degrees]).first;

  /// Returns a list of colors that are modified by the provided [degrees] int the color wheel.
  Iterable<NamedColor> modColors(IntList degrees) => degrees
      .map((degree) => NamedColor()
        ..hue = (hue + degree) % 360
        ..saturation = saturation
        ..brightness = brightness)
      .orderBy((x) => x.hue);

  @override
  NamedColor withAlpha(int a) => _scolor.withAlpha(a).hsv;

  @override
  NamedColor withBlue(int b) => _scolor.withBlue(b).hsv;

  @override
  NamedColor withGreen(int g) => _scolor.withGreen(g).hsv;

  @override
  NamedColor withOpacity(double opacity) => _scolor.withOpacity(opacity).hsv;

  @override
  NamedColor withRed(int r) => _scolor.withRed(r).hsv;

  void _loadColor(Color color) {
    _scolor = color;
    _name = _scolor.toString();
    double r = color.red / 255.0;
    double g = color.green / 255.0;
    double b = color.blue / 255.0;
    double min = [r, g, b].min;
    double max = [r, g, b].max;
    _v = max;
    double delta = max - min;
    if (max == 0.0 || delta == 0.0) {
      _h = 0.0;
      _s = 0.0;
    } else {
      _s = delta / max;
      if (r == max) {
        _h = (g - b) / delta;
      } else if (g == max) {
        _h = 2.0 + (b - r) / delta;
      } else {
        _h = 4.0 + (r - g) / delta;
      }
      _h *= 60.0;
      if (_h < 0.0) {
        _h += 360.0;
      }
    }
  }

  void _setColor() {
    if (_s > 0.0) {
      double hue = _h / 60.0;
      int hueFloor = hue.floor();
      double f = hue - hueFloor;
      double p = _v * (1.0 - _s);
      double q = _v * (1.0 - _s * f);
      double t = _v * (1.0 - _s * (1.0 - f));
      switch (hueFloor) {
        case 0:
          _scolor = Color.fromARGB(255, (_v * 255).toInt(), (t * 255).toInt(), (p * 255).toInt());
          break;
        case 1:
          _scolor = Color.fromARGB(255, (q * 255).toInt(), (_v * 255).toInt(), (p * 255).toInt());
          break;
        case 2:
          _scolor = Color.fromARGB(255, (p * 255).toInt(), (_v * 255).toInt(), (t * 255).toInt());
          break;
        case 3:
          _scolor = Color.fromARGB(255, (p * 255).toInt(), (q * 255).toInt(), (_v * 255).toInt());
          break;
        case 4:
          _scolor = Color.fromARGB(255, (t * 255).toInt(), (p * 255).toInt(), (_v * 255).toInt());
          break;
        case 5:
          _scolor = Color.fromARGB(255, (_v * 255).toInt(), (p * 255).toInt(), (q * 255).toInt());
          break;
        default:
          _scolor = Color.fromARGB(255, (_v * 255).toInt(), (p * 255).toInt(), (q * 255).toInt());
          break;
      }
    } else {
      _scolor = Color.fromARGB(255, (_v * 255).toInt(), (_v * 255).toInt(), (_v * 255).toInt());
    }
  }

  static List<NamedColor> createColors(List<dynamic> values) => values.map((color) => NamedColor.fromValue(color)).toList();
}
