import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';

extension KeyboardExtensions on KeyEvent {
  bool get isAltPressed => HardwareKeyboard.instance.isAltPressed;

  bool get isControlPressed => HardwareKeyboard.instance.isControlPressed;

  bool get isMetaPressed => HardwareKeyboard.instance.isMetaPressed;
  bool get isShiftPressed => HardwareKeyboard.instance.isShiftPressed;

  bool isAlt(LogicalKeyboardKey key) => isAltPressed && key == logicalKey;
  bool isControl(LogicalKeyboardKey key) => isControlPressed && key == logicalKey;
  bool isControlAlt(LogicalKeyboardKey key) => isControlPressed && isAltPressed && key == logicalKey;
  bool isControlAltMeta(LogicalKeyboardKey key) => isControlPressed && isMetaPressed && isAltPressed && key == logicalKey;
  bool isControlMeta(LogicalKeyboardKey key) => isControlPressed && isMetaPressed && key == logicalKey;
  bool isControlShift(LogicalKeyboardKey key) => isControlPressed && isShiftPressed && key == logicalKey;
  bool isControlShiftAlt(LogicalKeyboardKey key) => isControlPressed && isShiftPressed && isAltPressed && key == logicalKey;
  bool isControlShiftAltMeta(LogicalKeyboardKey key) => isControlPressed && isMetaPressed && isShiftPressed && isAltPressed && key == logicalKey;
  bool isControlShiftMeta(LogicalKeyboardKey key) => isControlPressed && isMetaPressed && isShiftPressed && key == logicalKey;

  bool isKeyPressed(LogicalKeyboardKey key) => key == logicalKey;
  bool isMeta(LogicalKeyboardKey key) => isMetaPressed && key == logicalKey;
  bool isShift(LogicalKeyboardKey key) => isShiftPressed && key == logicalKey;
  bool isShiftAlt(LogicalKeyboardKey key) => isShiftPressed && isAltPressed && key == logicalKey;
}

extension WidgetExt on Widget {
  /// get all the [Text] children in the widget tree and return their text as string
  string get text => texts.join(" ");

  /// get all the [Text] children in the widget tree and return their text as list of string
  Iterable<string> get texts {
    List<Text> textWidgets = [if (this is Text) this as Text];
    void findTextWidgetsRecursive(Element element) {
      if (element.widget is Text) {
        textWidgets.add(element.widget as Text);
      }
      element.visitChildren(findTextWidgetsRecursive);
    }

    // ignore: invalid_use_of_protected_member
    createElement().visitChildren(findTextWidgetsRecursive);
    return textWidgets.map((x) => x.text);
  }

  Widget blurEffect([double sigmaX = 5, double sigmaY = 5, TileMode tileMode = TileMode.clamp]) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX, tileMode: tileMode),
        child: this,
      ),
    );
  }

  /// wrap a widget using a [Function] if [test] is true
  Widget wrapIf(bool test, Widget Function(Widget wrappedChild) func) => test ? func(this) : this;
}
