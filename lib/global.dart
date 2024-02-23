import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

bool get isDesktop => Platform.isMacOS || Platform.isWindows || Platform.isLinux;

bool get isMobile => Platform.isIOS || Platform.isAndroid;

bool get isGoogle => Platform.isAndroid || Platform.isFuchsia;

bool get isApple => Platform.isIOS || Platform.isMacOS;

bool get isWeb => kIsWeb;
bool get isMacOS => Platform.isMacOS;
bool get isIOS => Platform.isIOS;
bool get isWindows => Platform.isWindows;
bool get isAndroid => Platform.isAndroid;
bool get isFuchsia => Platform.isFuchsia;
bool get isLinux => Platform.isLinux;

Brightness get brightness => SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool get isDarkMode => brightness == Brightness.dark;
bool get isLightMode => brightness == Brightness.light;
