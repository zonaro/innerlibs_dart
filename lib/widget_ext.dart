import 'package:flutter/material.dart';

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
