import 'package:flutter/material.dart';

/// Extension methods for the [Widget] class to provide convenient alignment options.
extension AlignExtensions on Widget {
  /// Aligns the widget at the bottom center of its parent.
  Align alignAtBottomCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the top left of its parent.
  Align alignAtTopLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the bottom left of its parent.
  Align alignAtBottomLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the bottom right of its parent.
  Align alignAtBottomRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.bottomRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the center left of its parent.
  Align alignAtCenterLeft({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerLeft,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the center of its parent.
  Align alignAtCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.center,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the center right of its parent.
  Align alignAtCenterRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.centerRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at a linear interpolation between two alignments.
  Align alignAtLERP(
    Alignment a,
    Alignment b,
    double t, {
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.lerp(a, b, t)!,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at a specific x and y coordinate within its parent.
  Align alignXY(
    double x,
    double y, {
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment(x, y),
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the top center of its parent.
  Align alignAtTopCenter({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );

  /// Aligns the widget at the top right of its parent.
  Align alignAtTopRight({
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) =>
      Align(
        key: key,
        alignment: Alignment.topRight,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: this,
      );
}
