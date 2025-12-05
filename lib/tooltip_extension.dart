import 'package:flutter/material.dart';

extension WidgetsExtension on Widget {
  Widget withTooltip(String message, {Decoration? decoration, double? height, bool? preferBelow, EdgeInsetsGeometry? padding, TextStyle? textStyle, Duration? waitDuration, EdgeInsetsGeometry? margin}) => Tooltip(
        message: message,
        decoration: decoration,
        constraints: BoxConstraints(minHeight: height ?? 0),
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );
}
