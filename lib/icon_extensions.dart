import 'package:flutter/material.dart';

extension Iconextension on IconData? {
  Icon asIcon({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    bool? applyTextScaling,
  }) =>
      (this ?? Icons.radio_button_off).asNullableIcon(
        size: size,
        fill: fill,
        weight: weight,
        grade: grade,
        opticalSize: opticalSize,
        color: color,
        shadows: shadows,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
        applyTextScaling: applyTextScaling,
      )!;

  Icon? asNullableIcon({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    bool? applyTextScaling,
  }) =>
      this != null
          ? Icon(
              this,
              size: size,
              fill: fill,
              weight: weight,
              grade: grade,
              opticalSize: opticalSize,
              color: color,
              shadows: shadows,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
              applyTextScaling: applyTextScaling,
            )
          : null;
}
