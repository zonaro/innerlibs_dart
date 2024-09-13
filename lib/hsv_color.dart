import 'package:flutter/material.dart';
import 'package:innerlibs/colornames.dart';
import 'package:innerlibs/innerlibs.dart';

class HSVColor implements Color, Comparable<HSVColor> {
  late double _h, _s, _v;
  late String _name;
  late Color _scolor;

  String description = "";

  HSVColor([Color color = Colors.transparent, String? name]) {
    _loadColor(color);
    _name = name ?? color.alphaHexadecimal;
  }

  @override
  HSVColor.fromARGB(int a, int r, int g, int b) : this(Color.fromARGB(a, r, g, b));

  HSVColor.fromInt(int argb) : this(Color(argb));

  HSVColor.fromRGB(int r, int g, int b) : this.fromInt(255 << 24 | r << 16 | g << 8 | b);

  HSVColor.fromString(String color, [string? name]) {
    if (ColorNames.isNamedColor(color)) {
      var named = ColorNames.fromValue(color);
      color = named.hexadecimal;
      name ??= named.name;
    }

    _loadColor(color.asColor);
    _name = name ?? color;
  }

  @override
  int get alpha => _scolor.alpha;
  set alpha(int value) => _loadColor(_scolor.withAlpha(value));

  Iterable<HSVColor> get analogousColors => modColors([30, -30]);
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

  HSVColor? get closestColor {
    var min = double.infinity;
    HSVColor? color;
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

  HSVColor get complementaryColor => modColor(180);

  String get css => alpha == 255 ? _toCssRGB() : _toCssRGBA();
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
  Iterable<HSVColor> get splitComplementaryColors => modColors([150, 210]);

  Iterable<HSVColor> get triadicColors => modColors([120, 240]);

  @override
  int get value => _scolor.value;

  set value(int value) => _loadColor(Color(value));

  /// Returns a [HSVColor] added by the provided [color].
  HSVColor addictive(HSVColor color) {
    var n = clone();
    n.red = (n.red + color.red).clamp(0, 255);
    n.green = (n.green + color.green).clamp(0, 255);
    n.blue = (n.blue + color.blue).clamp(0, 255);
    return n;
  }

  /// Return a new instance of [HSVColor] with the same values as this instance.
  HSVColor clone() => HSVColor(_scolor, _name)..description = description;

  @override
  int compareTo(dynamic other) {
    if (other is int) {
      return argb.compareTo(other);
    } else if (other is HSVColor) {
      return argb.compareTo(other.argb);
    } else if (other is Color) {
      return argb.compareTo(other.value);
    } else {
      throw ArgumentError('Cannot compare HSVColor with ${other.runtimeType}');
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
  double distanceTo(HSVColor color) {
    var h = (hue - color.hue).abs();
    var s = (saturation - color.saturation).abs();
    var v = (brightness - color.brightness).abs();
    return h + s + v;
  }

  HSVColor modColor(int degrees) => modColors([degrees]).first;

  /// Returns a list of colors that are modified by the provided [degrees] int the color wheel.
  Iterable<HSVColor> modColors(IntList degrees) => degrees
      .map((x) => HSVColor()
        ..hue = (hue + x) % 360
        ..saturation = saturation
        ..brightness = brightness)
      .orderBy((x) => x.hue);

  @override
  HSVColor withAlpha(int a) => _scolor.withAlpha(a).hsv;

  @override
  HSVColor withBlue(int b) => _scolor.withBlue(b).hsv;

  @override
  HSVColor withGreen(int g) => _scolor.withGreen(g).hsv;

  @override
  HSVColor withOpacity(double opacity) => _scolor.withOpacity(opacity).hsv;

  @override
  HSVColor withRed(int r) => _scolor.withRed(r).hsv;

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

  String _toCssRGB() => 'rgb($red, $green, $blue)';

  String _toCssRGBA() => 'rgba($red, $green, $blue, $opacity)';

  static List<HSVColor> createColors(List<String> colors) => colors.map((color) => HSVColor.fromString(color)).toList();
}
