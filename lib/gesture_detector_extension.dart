import 'package:flutter/material.dart';

extension GestureDetectorExtensions on Widget? {
//on double tap
  Widget? onDoubleTap(void Function()? function, {bool ink = false}) {
    return function != null
        ? ink
            ? InkWell(
                onDoubleTap: function,
                child: this,
              )
            : GestureDetector(
                onDoubleTap: function,
                child: this,
              )
        : this;
  }

  // on long press
  Widget? onLongPress(void Function()? function, {bool ink = false}) {
    return function != null
        ? ink
            ? InkWell(
                onLongPress: function,
                child: this,
              )
            : GestureDetector(
                onLongPress: function,
                child: this,
              )
        : this;
  }

  // on tap
  Widget? onTap(void Function()? function, {bool ink = false}) {
    return function != null
        ? ink
            ? InkWell(
                onTap: function,
                child: this,
              )
            : GestureDetector(
                onTap: function,
                child: this,
              )
        : this;
  }
}
