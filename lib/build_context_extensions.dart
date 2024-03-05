import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

extension BuildContextExtensions on BuildContext {
//  THEMES

  /// performs a simple [Theme.of(context)] action and returns given [result]
  ///
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  /// performs a simple [Theme.of(context).primaryTextTheme] action and returns given [primaryTextTheme]
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// performs a simple [Theme.of(context).bottomAppBarTheme] action and returns given [bottomAppBarTheme]
  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// performs a simple [Theme.of(context).bottomSheetTheme] action and returns given [bottomSheetTheme]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// performs a simple [Theme.of(context).appBarTheme] action and returns given [appBarTheme]
  AppBarTheme get appBarTheme => theme.appBarTheme;

  // COLOR

  /// performs a simple [Theme.of(context).backgroundColor] action and returns given [backgroundColor]
  Color get backgroundColor => theme.colorScheme.background;

  /// performs a simple [Theme.of(context).primaryColor] action and returns given [primaryColor]
  Color get primaryColor => theme.primaryColor;

  /// A lighter version of the [primaryColor].
  Color get primaryColorLight => theme.primaryColorLight;

  /// A darker version of the [primaryColor].
  Color get primaryColorDark => theme.primaryColorDark;

  /// The focus color used indicate that a component has the input focus.
  Color get focusColor => theme.focusColor;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  Color get hoverColor => theme.hoverColor;

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(SnackBar snackBar) => scaffoldMessenger.showSnackBar(snackBar);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarMessage(string snackBar) => showSnackBar(SnackBar(content: snackBar.asText));

  /// The color of [Divider]s and [PopupMenuDivider]s, also used
  /// between [ListTile]s, between rows in [DataTable]s, and so forth.
  ///
  /// To create an appropriate [BorderSide] that uses this color, consider
  /// [Divider.createBorderSide].
  Color get dividerColor => theme.dividerColor;

  // // TYPOGRAPHY 2018

  // /// performs a simple [textTheme.headline1] action and returns given [headline1]
  // TextStyle? get headline1 => textTheme.displayLarge;

  // /// performs a simple [textTheme.headline2] action and returns given [headline2]
  // TextStyle? get headline2 => textTheme.displayMedium;

  // /// performs a simple [textTheme.headline3] action and returns given [headline3]
  // TextStyle? get headline3 => textTheme.displaySmall;

  // /// performs a simple [textTheme.headline4] action and returns given [headline4]
  // TextStyle? get headline4 => textTheme.headlineMedium;

  // /// performs a simple [textTheme.headline5] action and returns given [headline5]
  // TextStyle? get headline5 => textTheme.headlineSmall;

  // /// performs a simple [textTheme.headline6] action and returns given [headline6]
  // TextStyle? get headline6 => textTheme.titleLarge;

  // /// performs a simple [textTheme.subtitle1] action and returns given [subtitle1]
  // TextStyle? get subtitle1 => textTheme.titleMedium;

  // /// performs a simple [textTheme.subtitle2] action and returns given [subtitle2]
  // TextStyle? get subtitle2 => textTheme.titleSmall;

  // /// performs a simple [textTheme.bodyText1] action and returns given [bodyText1]
  // TextStyle? get bodyText1 => textTheme.bodyLarge;

  // /// performs a simple [textTheme.bodyText2] action and returns given [bodyText2]
  // TextStyle? get bodyText2 => textTheme.bodyMedium;

  // /// performs a simple [textTheme.caption] action and returns given [caption]
  // TextStyle? get caption => textTheme.bodySmall;

  // /// performs a simple [textTheme.button] action and returns given [button]
  // TextStyle? get button => textTheme.labelLarge;

  // /// performs a simple [textTheme.overline] action and returns given [overline]
  // TextStyle? get overline => textTheme.labelSmall;

  // TYPOGRAPHY 2021

  /// Largest of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// Middle size of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// Smallest of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// Largest of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// Middle size of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// Smallest of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// Largest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// Middle size of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// Smallest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// Middle size of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  ///
  /// The default text style for [Material].
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// Middle size of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  ///
  /// The default text style for [Material].
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// Smallest of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// Largest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  ///
  /// Used for text on [ElevatedButton], [TextButton] and [OutlinedButton].
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// Middle size of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// Smallest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions
  TextStyle? get labelSmall => textTheme.labelSmall;

  ModalRoute? get modalRoute => ModalRoute.of(this);

  RouteSettings? get modalRouteSettings => modalRoute?.settings;

  string? get modalRouteName => modalRoute?.settings.name;

  restartApp() => RestartWidget.restartApp(this);

  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>([result]) => Navigator.pop(this, result);

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).push(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog));

  Future<dynamic> pushRoute(Widget screen, {required string route, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await push(screen, settings: RouteSettings(name: route), maintainState: maintainState, fullscreenDialog: fullscreenDialog);

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushReplacement(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog));

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool routes = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog), (Route<dynamic> route) => routes);

  /// perform push with routeName
  Future<dynamic> pushNamed(String screenName, {Object? arguments, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushNamed(screenName, arguments: arguments);

  /// perform replash with routeName
  Future<dynamic> pushReplacementNamed(String screenName, {Object? arguments, bool rootNavigator = false}) => Navigator.of(this, rootNavigator: rootNavigator).pushReplacementNamed(screenName, arguments: arguments);

  /// perform replash with routeName
  void popUntilRoute(String screenName, {bool rootNavigator = false}) => Navigator.of(this, rootNavigator: rootNavigator).popUntil(ModalRoute.withName(screenName));

  /// perform replash with route predicate
  void popUntil(RoutePredicate predicate) => Navigator.popUntil(this, predicate);

  /// perform a continuous pop until the first route
  void popUntilFirst() => popUntil((route) => route.isFirst);

  MaterialLocalizations get materialLocalizations => MaterialLocalizations.of(this);
  CupertinoLocalizations get cupertinoLocalizations => CupertinoLocalizations.of(this);
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

  /// The same of [MediaQuery.of(context).size.height]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  /// performs a simple [Theme.of(context).size] action and returns given [height or width]
  double get height => mediaQuerySize.height;

  /// The same of [MediaQuery.of(context).size.width]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get width => mediaQuerySize.width;

  ScreenTier get screenTier {
    if (width < 350) {
      return ScreenTier.xxs;
    } else if (width < 576) {
      return ScreenTier.xs;
    } else if (width < 768) {
      return ScreenTier.sm;
    } else if (width < 992) {
      return ScreenTier.md;
    } else if (width < 1200) {
      return ScreenTier.lg;
    } else if (width < 1600) {
      return ScreenTier.xl;
    } else {
      return ScreenTier.xxl;
    }
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// similar to [MediaQuery.of(context).padding]
  EdgeInsets get mediaQueryPadding => mediaQuery.padding;

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get mediaQueryViewPadding => mediaQuery.viewPadding;

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get mediaQueryViewInsets => mediaQuery.viewInsets;

  /// similar to [MediaQuery.of(context).orientation]
  Orientation get orientation => mediaQuery.orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  bool get alwaysUse24HourFormat => mediaQuery.alwaysUse24HourFormat;

  /// similar to [mediaQuery.devicePixelRatio]
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  Brightness get platformBrightness => mediaQuery.platformBrightness;

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// True if width be larger than 800
  bool get showNavbar => (width > 800);

  /// True if the shortestSide is smaller than 600p
  bool get isPhone => (mediaQueryShortestSide < 600);

  /// True if the shortestSide is largest than 600p
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);

  /// True if the shortestSide is largest than 720p
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);

  /// True if the current device is Tablet
  bool get isTablet => isSmallTablet || isLargeTablet;

  /// returns a specific value according to the current [ScreenTier]
  T? responsiveValue<T>({
    T? xxs,
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    switch (screenTier) {
      case ScreenTier.xxs:
        return xxs ?? xs ?? sm ?? md ?? lg ?? xl ?? xxl;
      case ScreenTier.xs:
        return xs ?? xxs ?? sm ?? md ?? lg ?? xl ?? xxl;
      case ScreenTier.sm:
        return sm ?? xs ?? xxs ?? md ?? lg ?? xl ?? xxl;
      case ScreenTier.md:
        return md ?? sm ?? xs ?? xxs ?? lg ?? xl ?? xxl;
      case ScreenTier.lg:
        return lg ?? md ?? sm ?? xs ?? xxs ?? xl ?? xxl;
      case ScreenTier.xl:
        return xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? xxl;
      case ScreenTier.xxl:
        return xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxs;
    }
  }

  /// This change makes MediaQuery an InheritedModel rather than an InheritedWidget,
  /// so any widget which knows it only depends on a
  /// specific property of MediaQuery the ability to declare that when reading the MediaQuery from the context.

  /// The same of MediaQuery.sizeOf(context)
  Size get mediaQuerySize => mediaQuery.size;

  /// The same of MediaQuery.sizeOf(context).height
  double get mqHeight => mediaQuerySize.height;

  /// The same of [MediaQuery.sizeOf(context).width]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get mqWidth => mediaQuerySize.width;

  /// similar to [ MediaQuery.paddingOf(context)]
  EdgeInsets get mqPadding => MediaQuery.paddingOf(this);

  /// similar to [MediaQuery.viewPaddingOf(context)]
  EdgeInsets get mqViewPadding => MediaQuery.viewPaddingOf(this);

  /// similar to [MediaQuery.viewInsetsOf(context)]
  EdgeInsets get mqViewInsets => MediaQuery.viewInsetsOf(this);

  /// similar to [MediaQuery.orientationOf(context)]
  Orientation get mqOrientation => MediaQuery.orientationOf(this);

  /// similar to [MediaQuery.alwaysUse24HourFormatOf(context)]
  bool get mqAlwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  /// similar to [MediaQuery.devicePixelRatioOf(context)]
  double get mqDevicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// similar to [MediaQuery.platformBrightnessOf(context)]
  Brightness get mqPlatformBrightness => MediaQuery.platformBrightnessOf(this);

  /// similar to [MediaQuery.textScaleFactorOf(context)]
  TextScaler get mqTextScaleFactor => MediaQuery.textScalerOf(this);

  Brightness get brightness => mediaQuery.platformBrightness;

  /// is dark mode currently enabled?
  bool get isDarkMode => brightness == Brightness.dark;

  /// is light mode currently enabled?
  bool get isLightMode => brightness == Brightness.light;
}
