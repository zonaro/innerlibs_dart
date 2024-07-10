import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Extension methods for [num] to create [EdgeInsets] from different directions.
extension EdgeInsetsExtensionsForNum on num {
  /// Creates [EdgeInsets] with only top offset set to the current value.
  EdgeInsets get fromTop => EdgeInsets.only(top: toDouble());

  /// Creates [EdgeInsets] with only bottom offset set to the current value.
  EdgeInsets get fromBottom => EdgeInsets.only(bottom: toDouble());

  /// Creates [EdgeInsets] with only left offset set to the current value.
  EdgeInsets get fromLeft => EdgeInsets.only(left: toDouble());

  /// Creates [EdgeInsets] with only right offset set to the current value.
  EdgeInsets get fromRight => EdgeInsets.only(right: toDouble());

  /// Creates [EdgeInsets] with both top and bottom offsets set to the current value.
  EdgeInsets get fromVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates [EdgeInsets] with both left and right offsets set to the current value.
  EdgeInsets get fromHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates [EdgeInsets] with all four offsets set to the current value.
  EdgeInsets get allAround => EdgeInsets.all(toDouble());
}
