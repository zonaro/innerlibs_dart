import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension EdgeInsetsExtensions on EdgeInsets {
  EdgeInsets operator +(EdgeInsets e) => EdgeInsets.only(top: top + e.top, left: left + e.left, bottom: bottom + e.bottom, right: right + e.right);
  EdgeInsets operator -(EdgeInsets e) => EdgeInsets.only(top: top - e.top, left: left - e.left, bottom: bottom - e.bottom, right: right - e.right);
  Padding asPadding({Widget? child}) => Padding(padding: this, child: child);
}

extension EdgeInsetsExtensionsForNum on num {
  EdgeInsets get fromTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get fromBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get fromLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get fromRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get allAround => EdgeInsets.all(toDouble());
}
