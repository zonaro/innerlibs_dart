import 'dart:ui';

import 'package:flutter/material.dart';

extension ViewExtension on BuildContext{


FlutterView get flutterView => View.of(this);

double get pixelRatio => flutterView.devicePixelRatio;

 //Size in physical pixels
Size get physicalScreenSize => flutterView.physicalSize;
double get physicalWidth => physicalScreenSize.width;
double get physicalHeight => physicalScreenSize.height;

//Size in logical pixels
Size get logicalScreenSize => flutterView.physicalSize / pixelRatio;
double get logicalWidth => logicalScreenSize.width;
double get logicalHeight => logicalScreenSize.height;

//Padding in physical pixels
ViewPadding get padding => flutterView.padding;

//Safe area paddings in logical pixels
double get paddingLeft => flutterView.padding.left / flutterView.devicePixelRatio;
double get paddingRight => flutterView.padding.right / flutterView.devicePixelRatio;
double get paddingTop => flutterView.padding.top / flutterView.devicePixelRatio;
double get paddingBottom => flutterView.padding.bottom / flutterView.devicePixelRatio;

//Safe area in logical pixels
double get safeWidth => logicalWidth - paddingLeft - paddingRight;
double get safeHeight => logicalHeight - paddingTop - paddingBottom;

}
