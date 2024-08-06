import 'package:flutter/material.dart';

extension GestureDetectorExtensions on Widget {
//on double tap
  Widget onDoubleTap(void Function()? function) {
    if (function != null) {
      return GestureDetector(
        onDoubleTap: function,
        child: this,
      );
    }
    return this;
  }

  // on tap
  Widget onTap(void Function()? function) {
    if (function != null) {
      return GestureDetector(
        onTap: function,
        child: this,
      );
    }
    return this;
  }

  // on long press
  Widget onLongPress(void Function()? function) {
    if (function != null) {
      return GestureDetector(
        onLongPress: function,
        child: this,
      );
    }
    return this;
  }
}
