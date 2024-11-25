import 'package:flutter/material.dart';

extension AlignmentExtensions on Alignment {
  Alignment sum({double x = 0, double y = 0}) => Alignment(this.x + x, this.y + y);
}

extension AlignmentGeometryExtensions<T extends AlignmentGeometry> on T {
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

  TextAlign get toTextAlign {
    if (this == Alignment.topLeft || this == Alignment.centerLeft || this == Alignment.bottomLeft) {
      return TextAlign.left;
    } else if (this == Alignment.topRight || this == Alignment.centerRight || this == Alignment.bottomRight) {
      return TextAlign.right;
    } else {
      return TextAlign.center;
    }
  }

  WrapAlignment get toWrapAlignment {
    if (this == Alignment.topLeft || this == Alignment.centerLeft || this == Alignment.bottomLeft) {
      return WrapAlignment.start;
    } else if (this == Alignment.topRight || this == Alignment.centerRight || this == Alignment.bottomRight) {
      return WrapAlignment.end;
    } else {
      return WrapAlignment.center;
    }
  }

  WrapCrossAlignment get toWrapCrossAlignment {
    if (this == Alignment.topLeft || this == Alignment.centerLeft || this == Alignment.bottomLeft) {
      return WrapCrossAlignment.start;
    } else if (this == Alignment.topRight || this == Alignment.centerRight || this == Alignment.bottomRight) {
      return WrapCrossAlignment.end;
    } else {
      return WrapCrossAlignment.center;
    }
  }
}

extension TextAlignExtensions on TextAlign {
  Alignment toAlignment([TextAlignVertical? vertical]) {
    if (vertical == null) {
      switch (this) {
        case TextAlign.right:
          return Alignment.centerRight;
        case TextAlign.center:
          return Alignment.center;
        case TextAlign.justify:
          return Alignment.center;
        default:
          return Alignment.centerLeft;
      }
    }
    switch (this) {
      case TextAlign.right:
        return vertical == TextAlignVertical.top ? Alignment.topRight : Alignment.bottomRight;
      case TextAlign.center:
        return vertical == TextAlignVertical.top ? Alignment.topCenter : Alignment.bottomCenter;
      case TextAlign.justify:
        return Alignment.center;
      default:
        return vertical == TextAlignVertical.top ? Alignment.topLeft : Alignment.bottomLeft;
    }
  }
}
