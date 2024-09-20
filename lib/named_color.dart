import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

export 'package:innerlibs/colornames.dart';

/// Represents a color with a name and description.
/// Its implements most of the methods of the [Color], [HSLColor] and [HSVColor] classes.
/// Different from the [Color] class, this class values can be changed without copying the instance.
class NamedColor implements Color, Comparable<NamedColor> {
  late double _h, _s, _v;
  late String _name;
  late Color _scolor;

  String description = "";

  NamedColor([Color color = Colors.transparent, String? name, string description = ""]) {
    name ??= NamedColors.getName(color.hexadecimal);
    _loadColor(color);
    _name = name ?? color.alphaHexadecimal;
    description = description;
  }

  factory NamedColor.fromAHSL(alpha, hue, saturation, lightness, [string? name, string description = ""]) {
    HSLColor hsl = HSLColor.fromAHSL(alpha, hue, saturation, lightness);
    return NamedColor(hsl.toColor(), name, description);
  }

  @override
  NamedColor.fromARGB(int a, int r, int g, int b, [string? name, string description = ""]) : this(Color.fromARGB(a, r, g, b), name, description);

  factory NamedColor.fromCMYK(double c, double m, double y, double k, [string? name, string description = ""]) {
    var r = 255 * (1 - c) * (1 - k);
    var g = 255 * (1 - m) * (1 - k);
    var b = 255 * (1 - y) * (1 - k);
    return NamedColor.fromRGB(r.round(), g.round(), b.round(), name, description);
  }

  factory NamedColor.fromCss(String css) {
    var color = NamedColor();
    if (css.isHexadecimalColor) {
      color.hexadecimal = css;
    } else if (css.startsWith('rgba')) {
      var values = css.substring(5, css.length - 1).split(',');
      color.red = int.parse(values[0]);
      color.green = int.parse(values[1]);
      color.blue = int.parse(values[2]);
      color.opacity = double.parse(values[3]);
    } else if (css.startsWith('rgb')) {
      var values = css.substring(4, css.length - 1).split(',');
      color.red = int.parse(values[0]);
      color.green = int.parse(values[1]);
      color.blue = int.parse(values[2]);
    } else if (css.startsWith('hsl')) {
      var values = css.substring(4, css.length - 1).split(',');
      color.hue = double.parse(values[0]);
      color.saturation = double.parse(values[1]);
      color.lightness = double.parse(values[2]);
    } else if (css.startsWith('hsv')) {
      var values = css.substring(4, css.length - 1).split(',');
      color.hue = double.parse(values[0]);
      color.saturation = double.parse(values[1]);
      color.brightness = double.parse(values[2]);
    } else {
      throw ArgumentError('Invalid CSS color: $css');
    }
    return color;
  }

  NamedColor.fromInt(int argb, [string? name, string description = ""]) : this(Color(argb), name, description);

  NamedColor.fromRGB(int r, int g, int b, [string? name, string description = ""]) : this.fromInt(255 << 24 | r << 16 | g << 8 | b, name, description);
  NamedColor.fromString(String color, [string? name, this.description = ""]) {
    _loadColor(color.asColor);
    _name = name ?? color;
  }

  factory NamedColor.fromValue(dynamic value) {
    if (value is NamedColor) {
      return NamedColor.fromString(value.hexadecimal, value.name, value.description);
    } else if (value is Color) {
      return NamedColor(value);
    } else if (value is HSLColor) {
      return NamedColor(value.toColor());
    } else if (value is HSVColor) {
      return NamedColor(value.toColor());
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

  double get black => 1 - _v;

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
    for (var color in NamedColors.values) {
      var d = color.color.distanceTo(this);
      if (d < min) {
        min = d;
        color = color;
      }
    }
    return color;
  }

  string get closestColorName => closestColor?.name ?? '';

  NamedColor get complementaryColor => modColor(180);

  String get css => alpha == 255 ? 'rgb($red, $green, $blue)' : 'rgba($red, $green, $blue, $opacity)';

  double get cyan => 1 - (red / 255);

  /// The Dominant value of this color.
  int get dominantValue => [red, green, blue].max;

  @override
  int get green => _scolor.green;

  set green(int value) => _loadColor(_scolor.withGreen(value));

  @override
  int get hashCode => _scolor.hashCode;

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

  double get lightness => hsl.lightness;

  set lightness(double value) => _loadColor(HSLColor.fromColor(this).withLightness(value).toColor());

  /// The Luminance of this color.
  /// The Luminance is a measure of the brightness of a color.
  double get luminance => 0.2126 * red + 0.7152 * green + 0.0722 * blue;

  double get magenta => 1 - (green / 255);

  /// The Name of this color.
  /// If the name is not set, it will return the closest color name from the [NamedColors] list.
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

  double get yellow => 1 - (blue / 255);

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

  @override
  operator ==(Object other) => hashCode == NamedColor.fromValue(other).hashCode;

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
    } else if (other is String) {
      return argb.compareTo(NamedColor.fromValue(other).argb);
    } else if (other is HSLColor) {
      return other.toColor().value.compareTo(argb);
    } else if (other is HSVColor) {
      return other.toColor().value.compareTo(argb);
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

  JsonMap toJson() {
    return {
      'name': name,
      'description': description,
      'hexadecimal': hexadecimal,
      'rgb': [red, green, blue],
      'hsl': [hue, saturation, lightness],
      'hsv': [hue, saturation, brightness],
      'cmyk': [cyan, magenta, yellow, black],
      'css': css,
      'luminance': luminance,
      'brightness': brightness,
      'dominantValue': dominantValue,
      'closestColor': closestColorName,
      'complementaryColor': complementaryColor.hexadecimal,
      'analogousColors': analogousColors.map((c) => c.hexadecimal).toList(),
      'triadicColors': triadicColors.map((c) => c.hexadecimal).toList(),
      'splitComplementaryColors': splitComplementaryColors.map((c) => c.hexadecimal).toList(),
    };
  }

  @override
  String toString() => name;

  @override
  NamedColor withAlpha(int a) => _scolor.withAlpha(a).asNamedColor;

  @override
  NamedColor withBlue(int b) => _scolor.withBlue(b).asNamedColor;

  @override
  NamedColor withGreen(int g) => _scolor.withGreen(g).asNamedColor;

  @override
  NamedColor withOpacity(double opacity) => _scolor.withOpacity(opacity).asNamedColor;

  @override
  NamedColor withRed(int r) => _scolor.withRed(r).asNamedColor;

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

  static NamedColor fromJson(JsonMap json) {
    var color = NamedColor.fromValue(json['hexadecimal']);
    color.name = json['name'];
    color.description = json['description'];
    return color;
  }
}
