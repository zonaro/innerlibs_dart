import 'dart:math';
import 'dart:ui';

import 'package:innerlibs/innerlibs.dart';

Size sizeFromAspect({required String aspectRatio, double? width, double? height}) {
  if (width != null && height != null) {
    return Size(width, height);
  }

  Size size = aspectRatio.toSize;

  if (size.width <= 0 && size.height <= 0) {
    throw ArgumentError('Invalid aspect ratio format.');
  }

  if (width != null) {
    return Size(width, width / max(size.width, size.height) * min(size.width, size.height));
  } else if (height != null) {
    return Size(height / min(size.width, size.height) * max(size.width, size.height), height);
  } else {
    return size;
  }
}
