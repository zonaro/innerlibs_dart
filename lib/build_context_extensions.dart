import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

typedef ScreenTierMap<T> = Map<T, ScreenTier>;

extension BuildContextExtensions on BuildContext {
  /// Returns the [NumberSymbols] for the current context.
  Iterable<NumberSymbols> get allNumberSymbols => numberFormatSymbols.values.whereType<NumberSymbols>();

  /// Returns [MediaQueryData.alwaysUse24HourFormat] for the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  bool get alwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  /// performs a simple [Theme.of(context).appBarTheme] action and returns given [appBarTheme]
  AppBarThemeData get appBarTheme => theme.appBarTheme;

  /// Returns the aspect ratio of the screen.
  double get aspectRatio => width / height;

  /// Returns the parts of the aspect ratio as an iterable of strings.
  Iterable<String> get aspectRatioParts => aspectRatioString.split(":");

  /// Returns the aspect ratio as a string.
  String get aspectRatioString => screenSize.getAspectRatioString();

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

  /// performs a simple [Theme.of(context).bottomAppBarTheme] action and returns given [bottomAppBarTheme]
  BottomAppBarThemeData get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// performs a simple [Theme.of(context).bottomSheetTheme] action and returns given [bottomSheetTheme]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// Returns the boundary of the render object.
  RenderRepaintBoundary? get boundary => [findRenderObject()].nonNulls.whereType<RenderRepaintBoundary>().firstOrNull;

  /// performs a simple [Theme.of(context).colorScheme] action and returns given [colorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  CupertinoLocalizations get cupertinoLocalizations => CupertinoLocalizations.of(this);

  /// Returns the current locale of the [BuildContext].
  Locale get currentLocale => Localizations.localeOf(this);

  /// Returns the current locale's number symbols.
  NumberSymbols? get currentLocaleNumberSymbols => NumberFormat(null, languageCode).symbols;

  /// similar to [MediaQuery.devicePixelRatioOf(context)]
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

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

  /// The color of [Divider]s and [PopupMenuDivider]s, also used
  /// between [ListTile]s, between rows in [DataTable]s, and so forth.
  ///
  /// To create an appropriate [BorderSide] that uses this color, consider
  /// [Divider.createBorderSide].
  Color get dividerColor => theme.dividerColor;

  /// Return the current FlutterView
  FlutterView get flutterView => View.of(this);

  /// The focus color used indicate that a component has the input focus.
  Color get focusColor => theme.focusColor;

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

  double get height => screenSize.height;

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  Color get hoverColor => theme.hoverColor;

  /// Returns the [InnerLibsLocalizations] for this [BuildContext].
  InnerLibsLocalizations get innerLibsLocalizations => InnerLibsLocalizations.of(this);

  /// Returns true if the aspect ratio is 16:9.
  bool get is16x9 => aspectRatioString == "16:9";

  /// Returns true if the aspect ratio is 1:1.
  bool get is1x1 => aspectRatioString == "1:1";

  /// Returns true if the aspect ratio is 21:9.
  bool get is21x9 => aspectRatioString == "4:3";

  /// Returns true if the aspect ratio is 3:2.
  bool get is3x2 => aspectRatioString == "3:2";

  /// Returns true if the aspect ratio is 4:3.
  bool get is4x3 => aspectRatioString == "4:3";

  /// Returns true if the aspect ratio is 5:4.
  bool get is5x4 => aspectRatioString == "5:4";

  /// is dark mode currently enabled?
  bool get isDarkMode => themeBrightness == Brightness.dark;

  /// Check if the device is in landscape mode
  bool get isLandscape => width > height;

  /// True if the shortestSide is largest than 720p
  bool get isLargeTabletSize => (shortestSide >= 720);

  /// is light mode currently enabled?
  bool get isLightMode => themeBrightness == Brightness.light;

  /// Check if the device is 4x3 aspect ratio
  bool get isOldTV => is4x3;

  /// True if the shortestSide is smaller than 600p
  bool get isPhoneSize => (shortestSide < 600);

  bool get isPortrait => height >= width;

  /// True if the shortestSide is largest than 600p
  bool get isSmallTabletSize => (shortestSide >= 600);

  /// True if the current device is 1x1 aspect ratio
  bool get isSquare => is1x1;

  /// True if the current device is Tablet
  bool get isTabletSize => isSmallTabletSize || isLargeTabletSize;

  /// Check if the device is 21x9 aspect ratio
  bool get isUltraWide => is21x9;

  /// Check if the device is 16x9 aspect ratio
  bool get isWidescreen => is16x9;

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

  /// Return the current language code
  string get languageCode => currentLocale.languageCode;

  /// Returns the logical aspect ratio of the screen.
  double get logicalAspectRatio => logicalWidth / logicalHeight;

  /// Returns the logical aspect ratio as a string.
  String get logicalAspectRatioString => logicalScreenSize.getAspectRatioString();

  /// Returns the logical height of the screen.
  double get logicalHeight => logicalScreenSize.height;

  //Size in logical pixels
  Size get logicalScreenSize => flutterView.physicalSize / pixelRatio;

  /// Returns the logical width of the screen.
  double get logicalWidth => logicalScreenSize.width;

  /// Returns the longest side of the screen.
  double get longestSide => screenSize.longestSide;

  /// Returns the [MaterialLocalizations] for this [BuildContext].
  MaterialLocalizations get materialLocalizations => MaterialLocalizations.of(this);

  /// Returns the [ModalRoute] associated with this [BuildContext].
  ///
  /// If there is no [ModalRoute] associated with this [BuildContext],
  /// it returns `null`.
  ModalRoute? get modalRoute => ModalRoute.of(this);

  /// Returns the name of the modal route, if available.
  /// If the modal route is null or the settings name is null, it returns null.
  String? get modalRouteName => modalRoute?.settings.name;

  /// Returns the [RouteSettings] of the current modal route, or `null` if there is no modal route.
  RouteSettings? get modalRouteSettings => modalRoute?.settings;

  /// Returns the [Navigator] associated with this [BuildContext].
  NavigatorState get navigator => Navigator.of(this);

  /// Returns the error color from the current theme's color scheme.
  Color get onErrorColor => theme.colorScheme.onError;

  /// Returns the color for displaying text on the primary color.
  Color get onPrimaryColor => theme.colorScheme.onPrimary;

  /// Returns the color for the secondary element's text, based on the current theme.
  Color get onSecondaryColor => theme.colorScheme.onSecondary;

  /// Returns the color of the surface text on the current theme.
  Color get onSurfaceColor => theme.colorScheme.onSurface;

  //Padding in physical pixels
  ViewPadding get padding => flutterView.padding;

  double get paddingBottom => padding.bottom / devicePixelRatio;

  double get paddingLeft => padding.left / devicePixelRatio;

  double get paddingRight => padding.right / devicePixelRatio;

  double get paddingTop => padding.top / devicePixelRatio;

  /// Returns the physical aspect ratio of the screen.
  double get physicalAspectRatio => physicalWidth / physicalHeight;

  /// Returns the physical aspect ratio as a string.
  String get physicalAspectRatioString => physicalScreenSize.getAspectRatioString();

  /// Returns the physical height of the screen.
  double get physicalHeight => physicalScreenSize.height;

  //Size in physical pixels
  Size get physicalScreenSize => flutterView.physicalSize;

  /// Returns the physical width of the screen.
  double get physicalWidth => physicalScreenSize.width;

  /// Returns the pixel ratio of the screen.
  double get pixelRatio => flutterView.devicePixelRatio;

  /// similar to [MediaQuery.platformBrightnessOf(context)]
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  /// performs a simple [Theme.of(context).primaryColor] action and returns given [primaryColor]
  Color get primaryColor => theme.primaryColor;

  /// A darker version of the [primaryColor].
  Color get primaryColorDark => theme.primaryColorDark;

  /// A lighter version of the [primaryColor].
  Color get primaryColorLight => theme.primaryColorLight;

  /// performs a simple [Theme.of(context).primaryTextTheme] action and returns given [primaryTextTheme]
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// Returns the safe height of the screen.
  double get safeHeight => logicalHeight - paddingTop - paddingBottom;

  /// Returns the safe width of the screen.
  double get safeWidth => logicalWidth - paddingLeft - paddingRight;

  //Safe area in logical pixels
  ScaffoldState get scaffold => Scaffold.of(this);

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// The [ScaffoldMessenger] that is associated with this [BuildContext].
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// This change makes MediaQuery an InheritedModel rather than an InheritedWidget,
  /// so any widget which knows it only depends on a
  /// specific property of MediaQuery the ability to declare that when reading the MediaQuery from the context.

  /// The same of MediaQuery.sizeOf(context)
  Size get screenSize => MediaQuery.sizeOf(this);

  /// the current [ScreenTier]
  ScreenTier get screenTier => ScreenTier.fromWidth(width);

  /// get the shortestSide from screen
  double get shortestSide => screenSize.shortestSide;

  /// True if width be larger than 800
  bool get showNavbar => (width > 800);

  /// performs a simple [Theme.of(context).backgroundColor] action and returns given [surfaceColor]
  Color get surfaceColor => theme.colorScheme.surface;

  /// similar to [MediaQuery.textScaleFactorOf(context)]
  TextScaler get textScaler => MediaQuery.textScalerOf(this);

  /// performs a simple [Theme.of(context).textTheme] action and returns given [textTheme]
  TextTheme get textTheme => theme.textTheme;

  /// Returns the current [ThemeData] for this [BuildContext].
  ThemeData get theme => Theme.of(this);

  Brightness get themeBrightness => theme.brightness;

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

  /// Returns the [InnerLibsLocalizations] for this [BuildContext].
  InnerLibsLocalizations get translations => innerLibsLocalizations;

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Returns the width of the screen.
  double get width => screenSize.width;

  /// a size computed by [ScreenTier]
  double adaptativeSize([double? size, double factor = .1]) {
    size ??= textTheme.bodyMedium?.fontSize ?? 14;
    size = size.forcePositive;
    factor = factor.forcePositive;
    return valueByTier(
      xxs: size * (1 - factor * 3),
      xs: size * (1 - factor * 2),
      sm: size * (1 - factor * 1),
      md: size,
      lg: size * (1 + factor * 1),
      xl: size * (1 + factor * 2),
      xxl: size * (1 + factor * 3),
    );
  }

  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// Clear all the snack bars from the current [ScaffoldMessenger].
  void clearSnackBars() => scaffoldMessenger.clearSnackBars();

  /// Closes the main drawer of the scaffold.
  ///
  /// Typically used to hide the navigation drawer.
  void closeDrawer() => scaffold.closeDrawer();

  /// Closes the end drawer of the scaffold.
  ///
  /// Typically used to hide the end drawer.
  void closeEndDrawer() => scaffold.closeEndDrawer();

  /// Control the focus of the current context
  /// [times] is the number of times to move the focus.
  /// if [times] is positive, it will move the focus forward.
  /// if [times] is negative, it will move the focus backward.
  /// if [times] is zero, it will unfocus the current context.
  bool focus([int times = 1]) {
    bool b = false;
    if (times > 0) {
      while (times-- > 0) {
        b = nextFocus();
      }
    } else if (times < 0) {
      while (times++ < 0) {
        b = previousFocus();
      }
    } else {
      unfocus();
    }
    return b;
  }

  /// Returns the [NumberSymbols] for the given [localeCode].
  NumberSymbols? localeNumberSymbols(string localeCode) => allNumberSymbols.firstWhere((element) => element.NAME.flatEqual(localeCode));

  /// Request to move the focus to the next focus node
  bool nextFocus() => FocusScope.of(this).nextFocus();

  /// Opens the main drawer of the scaffold.
  ///
  /// Typically used to display the navigation drawer.
  void openDrawer() => scaffold.openDrawer();

  /// Opens the end drawer of the scaffold.
  ///
  /// The end drawer is usually displayed on the opposite side of the main drawer.
  void openEndDrawer() => scaffold.openEndDrawer();

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>([result]) => Navigator.pop(this, result);

  /// perform replash with route predicate
  void popUntil(RoutePredicate predicate) => Navigator.popUntil(this, predicate);

  /// perform a continuous pop until the first route
  void popUntilFirst() => popUntil((route) => route.isFirst);

  /// perform replash with routeName
  void popUntilRoute(String screenName, {bool rootNavigator = false}) => Navigator.of(this, rootNavigator: rootNavigator).popUntil(ModalRoute.withName(screenName));

  /// Request to move the focus to the previous focus node
  bool previousFocus() => FocusScope.of(this).previousFocus();

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).push(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog));

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool routes = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog), (Route<dynamic> route) => routes);

  /// perform push with routeName
  Future<dynamic> pushNamed(String screenName, {Object? arguments, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushNamed(screenName, arguments: arguments);

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(Widget screen, {RouteSettings? settings, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await Navigator.of(this, rootNavigator: rootNavigator).pushReplacement(MaterialPageRoute(builder: (_) => screen, settings: settings, maintainState: maintainState, fullscreenDialog: fullscreenDialog));

  /// perform replash with routeName
  Future<dynamic> pushReplacementNamed(String screenName, {Object? arguments, bool rootNavigator = false}) => Navigator.of(this, rootNavigator: rootNavigator).pushReplacementNamed(screenName, arguments: arguments);

  Future<dynamic> pushRoute(Widget screen, {required string route, bool maintainState = true, bool fullscreenDialog = false, bool rootNavigator = false}) async => await push(screen, settings: RouteSettings(name: route), maintainState: maintainState, fullscreenDialog: fullscreenDialog);

  /// Shows a [SnackBar] with the given [content] in the current [Scaffold].
  ///
  /// If the [content] is a [String], it will be converted to a [Text] widget.
  /// If the [content] is not a [SnackBar] and is a [Widget], it will be wrapped
  /// in a [SnackBar] widget.
  /// If the [content] is a [SnackBar], it will be shown using the [scaffoldMessenger].
  /// If none of the above conditions are met, the [content] will be converted to
  /// a [String] and shown as a [SnackBar].
  ///
  /// Returns the [ScaffoldFeatureController] for the shown [SnackBar].
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(dynamic content) {
    if (content is String) content = content.asText();
    if ((content is! SnackBar) && content is Widget) {
      content = SnackBar(content: content);
    }
    if (content is SnackBar) {
      return scaffoldMessenger.showSnackBar(content);
    }
    return showSnackBar("$content");
  }

  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) => FocusScope.of(this).unfocus(disposition: disposition);

  void until(RoutePredicate predicate) => navigator.popUntil(predicate);

  void untilFirst() => until((route) => route.isFirst);

  void untilRoute(String screenName) => until((route) => route.settings.name == screenName);

  /// returns a specific value according to the current screen [width] or [height] or the next lower value if omitted

  T valueByBreakpoint<T>({required Map<double, T> breakpoints, Axis direction = Axis.horizontal}) => getBreakpointValue(direction == Axis.horizontal ? width : height, breakpoints);

  /// returns a specific value according to the current [ScreenTier] or the next lower value if omitted
  T valueByTier<T>({
    T? xxs,
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    var s = [xxs, xs, sm, md, lg, xl, xxl].nonNull();
    if (s.isEmpty) {
      throw ArgumentError("You need to provide at least one value (xxs, xs, sm, md, lg, xl, xxl)");
    }

    if (s.length == 1) return s.first;

    switch (screenTier) {
      case ScreenTier.xxs:
        return (xxs ?? xs ?? sm ?? md ?? lg ?? xl ?? xxl) as T;
      case ScreenTier.xs:
        return (xs ?? xxs ?? sm ?? md ?? lg ?? xl ?? xxl) as T;
      case ScreenTier.sm:
        return (sm ?? xs ?? xxs ?? md ?? lg ?? xl ?? xxl) as T;
      case ScreenTier.md:
        return (md ?? sm ?? xs ?? xxs ?? lg ?? xl ?? xxl) as T;
      case ScreenTier.lg:
        return (lg ?? md ?? sm ?? xs ?? xxs ?? xl ?? xxl) as T;
      case ScreenTier.xl:
        return (xl ?? lg ?? md ?? sm ?? xs ?? xxs ?? xxl) as T;
      case ScreenTier.xxl:
        return (xxl ?? xl ?? lg ?? md ?? sm ?? xs ?? xxs) as T;
    }
  }
}
