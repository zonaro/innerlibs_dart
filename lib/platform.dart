import 'dart:io';

import 'package:flutter/foundation.dart';

extension MyPlatform on Platform {
  static bool get isWeb => kIsWeb;

  static bool get isDesktop => Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  static bool get isMobile => Platform.isIOS || Platform.isAndroid;

  static bool get isGoogle => Platform.isAndroid || Platform.isFuchsia;

  static bool get isApple => Platform.isIOS || Platform.isMacOS;
}
