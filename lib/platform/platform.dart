import 'dart:ui';

import 'package:innerlibs/innerlibs.dart';

import 'platform_stub.dart' if (dart.library.js_interop) 'platform_web.dart' if (dart.library.io) 'platform_io.dart';

/// Checks if the platform is Android.
bool get isAndroid => GeneralPlatform.isAndroid;

/// Checks if the platform is Apple (iOS or macOS).
bool get isApple => (isIOS || isMacOS);

/// Checks if the platform is a desktop (macOS, Windows, or Linux).
bool get isDesktop => isMacOS || isWindows || isLinux;

/// Checks if the platform is Fuchsia.
bool get isFuchsia => GeneralPlatform.isFuchsia;

/// Checks if the platform is a Google platform (Android or Fuchsia).
bool get isGoogle => (isAndroid || isFuchsia);

/// Checks if the platform is iOS.
bool get isIOS => GeneralPlatform.isIOS;

/// Checks if the platform is Linux.
bool get isLinux => GeneralPlatform.isLinux;

/// Checks if the platform is macOS.
bool get isMacOS => GeneralPlatform.isMacOS;

/// Checks if the platform is a mobile platform (iOS or Android).
bool get isMobile => isIOS || isAndroid;

/// Checks if the platform is native Android (not web).
bool get isNativeAndroid => isAndroid && !isWeb;

/// Checks if the platform is native Apple (not web).
bool get isNativeApple => isApple && !isWeb;

/// Checks if the platform is native desktop (not web).
bool get isNativeDesktop => isDesktop && !isWeb;

/// Checks if the platform is native Fuchsia (not web).
bool get isNativeFuchsia => isFuchsia && !isWeb;

/// Checks if the platform is native Google (not web).
bool get isNativeGoogle => isGoogle && !isWeb;

/// Checks if the platform is native iOS (not web).
bool get isNativeIOS => isIOS && !isWeb;

/// Checks if the platform is native Linux (not web).
bool get isNativeLinux => isLinux && !isWeb;

/// Checks if the platform is native macOS (not web).
bool get isNativeMacOS => isMacOS && !isWeb;

/// Checks if the platform is native mobile (not web).
bool get isNativeMobile => isMobile && !isWeb;

/// Checks if the platform is native Windows (not web).
bool get isNativeWindows => isWindows && !isWeb;

/// Checks if the platform is in dark mode.
bool get isPlatformDarkMode => platformBrightness == Brightness.dark;

/// Checks if the platform is in light mode.
bool get isPlatformLightMode => platformBrightness == Brightness.light;

/// Checks if the platform is web.
bool get isWeb => GeneralPlatform.isWeb;

/// Checks if the platform is Windows.
bool get isWindows => GeneralPlatform.isWindows;
