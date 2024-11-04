import 'dart:async';

import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

extension ImageProviderExtensions<T extends Object> on ImageProvider<T> {
  Future<ColorScheme> colorScheme({
    Brightness? brightness,
    DynamicSchemeVariant dynamicSchemeVariant = DynamicSchemeVariant.tonalSpot,
    double contrastLevel = 0,
  }) =>
      ColorScheme.fromImageProvider(
        provider: this,
        brightness: brightness ?? Get.theme.brightness,
        dynamicSchemeVariant: dynamicSchemeVariant,
        contrastLevel: contrastLevel,
      );
}
