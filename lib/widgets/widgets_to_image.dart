import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

typedef WidgetsToImage = RepaintBoundary;
typedef WidgetToImage = RepaintBoundary;

extension WidgetsToImageKey on GlobalKey {
  /// Render a image from widget by this [GlobalKey] and return as [bytes]
  /// Remember to surround your widget with [WidgetsToImage] and give it this [GlobalKey]
  Future<bytes> renderImageAsBytes({
    double pixelRatio = 6,
  }) async {
    try {
      final image = await renderImage(pixelRatio: pixelRatio);
      final byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        return byteData.buffer.asUint8List();
      }
      throw Exception("Failed to get image data");
    } catch (e) {
      rethrow;
    }
  }

  /// Render a image from widget by this [GlobalKey] and return as [ui.Image].
  /// Remember to surround your widget with [WidgetsToImage] and give it this [GlobalKey]
  Future<ui.Image?> renderImage({
    double pixelRatio = 6,
  }) async {
    try {
      final boundary = currentContext?.boundary;
      return boundary?.toImage(pixelRatio: pixelRatio);
    } catch (e) {
      rethrow;
    }
  }

  /// Render a image from widget by this [GlobalKey] and save it to [file].
  /// Remember to surround your widget with [WidgetsToImage] and give it this [GlobalKey]
  Future<File> saveImage({
    required File file,
    double pixelRatio = 6,
  }) async {
    try {
      final image = await renderImageAsBytes(pixelRatio: pixelRatio);
      if ((await file.parent.exists()) == false) {
        await file.parent.create(recursive: true);
      }
      return await file.writeAsBytes(image);
    } catch (e) {
      rethrow;
    }
  }
}
