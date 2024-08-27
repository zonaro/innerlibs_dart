import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Keyboardextensions on KeyEvent {
  bool get isAltPressed => HardwareKeyboard.instance.isAltPressed;

  bool get isControlPressed => HardwareKeyboard.instance.isControlPressed;

  bool get isShiftPressed => HardwareKeyboard.instance.isShiftPressed;

  bool isKeyPressed(LogicalKeyboardKey key) => key == logicalKey;
}

extension WidgetExt on Widget {
  /// wrap a widget using a [Function] if [test] is true
  Widget wrapIf(bool test, Widget Function(Widget wrappedChild) func) {
    if (test) {
      return func(this);
    } else {
      return this;
    }
  }
}
