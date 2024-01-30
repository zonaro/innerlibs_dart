import 'package:flutter/material.dart';

extension AlignmentExtensions on Alignment {
  TextAlign get toTextAlign {
    if (this == Alignment.topLeft || this == Alignment.centerLeft || this == Alignment.bottomLeft) {
      return TextAlign.left;
    } else if (this == Alignment.topRight || this == Alignment.centerRight || this == Alignment.bottomRight) {
      return TextAlign.right;
    } else {
      return TextAlign.center;
    }
  }

  CrossAxisAlignment get toCrossAxisAlignment {
    if (this == Alignment.topLeft || this == Alignment.centerLeft || this == Alignment.bottomLeft) {
      return CrossAxisAlignment.start;
    } else if (this == Alignment.topRight || this == Alignment.centerRight || this == Alignment.bottomRight) {
      return CrossAxisAlignment.end;
    } else {
      return CrossAxisAlignment.center;
    }
  }

  MainAxisAlignment get toMainAxisAlignment {
    if (this == Alignment.topLeft || this == Alignment.topRight || this == Alignment.topCenter) {
      return MainAxisAlignment.start;
    } else if (this == Alignment.centerRight || this == Alignment.center || this == Alignment.centerRight) {
      return MainAxisAlignment.center;
    } else if (this == Alignment.bottomRight || this == Alignment.bottomCenter || this == Alignment.bottomLeft) {
      return MainAxisAlignment.end;
    }
    return MainAxisAlignment.spaceBetween;
  }
}
