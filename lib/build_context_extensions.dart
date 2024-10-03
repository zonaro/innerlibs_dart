import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

typedef ScreenTierMap<T> = Map<T, ScreenTier>;

extension BuildContextExtensions on BuildContext {
  bool get alwaysUse24HourFormat => MediaQuery.alwaysUse24HourFormatOf(this);

  /// performs a simple [Theme.of(context).appBarTheme] action and returns given [appBarTheme]
  AppBarTheme get appBarTheme => theme.appBarTheme;

  double get aspectRatio => width / height;

  string get aspectRatioString => screenSize.getAspectRatioString();

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

  // COLOR

  /// performs a simple [Theme.of(context).bottomAppBarTheme] action and returns given [bottomAppBarTheme]
  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// performs a simple [Theme.of(context).bottomSheetTheme] action and returns given [bottomSheetTheme]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// performs a simple [Theme.of(context).colorScheme] action and returns given [colorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  CupertinoLocalizations get cupertinoLocalizations => CupertinoLocalizations.of(this);

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

  /// The hover color used to indicate when a pointer is hovering over a
  /// component.
  Color get hoverColor => theme.hoverColor;

  bool get is16x9 => aspectRatioString == "16:9";

  bool get is1x1 => aspectRatioString == "1:1";

  bool get is21x9 => aspectRatioString == "4:3";

  bool get is3x2 => aspectRatioString == "3:2";

  bool get is4x3 => aspectRatioString == "4:3";

  bool get is5x4 => aspectRatioString == "5:4";

  /// is dark mode currently enabled?
  bool get isDarkMode => themeBrightness == Brightness.dark;

  /// True if the shortestSide is largest than 720p
  bool get isLargeTabletSize => (shortestSide >= 720);

  /// is light mode currently enabled?
  bool get isLightMode => themeBrightness == Brightness.light;

  bool get isOldTV => is4x3;

  /// True if the shortestSide is smaller than 600p
  bool get isPhoneSize => (shortestSide < 600);

  /// True if the shortestSide is largest than 600p
  bool get isSmallTabletSize => (shortestSide >= 600);

  bool get isSquare => is1x1;

  /// True if the current device is Tablet
  bool get isTabletSize => isSmallTabletSize || isLargeTabletSize;

  bool get isUltraWide => is21x9;

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

  double get logicalAspectRatio => logicalWidth / logicalHeight;

  string get logicalAspectRatioString => logicalScreenSize.getAspectRatioString();

  double get logicalHeight => logicalScreenSize.height;

  //Size in logical pixels
  Size get logicalScreenSize => flutterView.physicalSize / pixelRatio;

  double get logicalWidth => logicalScreenSize.width;

  MaterialLocalizations get materialLocalizations => MaterialLocalizations.of(this);
  InnerLibsLocalizations get innerLibsLocalizations => InnerLibsLocalizations.of(this);

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
  double get paddingBottom => flutterView.padding.bottom / flutterView.devicePixelRatio;

  //Safe area paddings in logical pixels
  double get paddingLeft => flutterView.padding.left / flutterView.devicePixelRatio;
  double get paddingRight => flutterView.padding.right / flutterView.devicePixelRatio;

  double get paddingTop => flutterView.padding.top / flutterView.devicePixelRatio;
  double get physicalAspectRatio => physicalWidth / physicalHeight;
  string get physicalAspectRatioString => physicalScreenSize.getAspectRatioString();

  double get physicalHeight => physicalScreenSize.height;
  //Size in physical pixels
  Size get physicalScreenSize => flutterView.physicalSize;

  double get physicalWidth => physicalScreenSize.width;

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

  double get safeHeight => logicalHeight - paddingTop - paddingBottom;

  //Safe area in logical pixels
  double get safeWidth => logicalWidth - paddingLeft - paddingRight;

  ScaffoldState get scaffold => Scaffold.of(this);

  /// The default color of the [Material] that underlies the [Scaffold]. The
  /// background color for a typical material app or a page within the app.
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

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

  InnerLibsLocalizations get translations => InnerLibsLocalizations.of(this);

  /// similar to [MediaQuery.of(context).viewInsets]
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// similar to [MediaQuery.of(context).viewPadding]
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

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

  bool nextFocus() => FocusScope.of(this).nextFocus();

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>([result]) => Navigator.pop(this, result);

  /// perform replash with route predicate
  void popUntil(RoutePredicate predicate) => Navigator.popUntil(this, predicate);

  /// perform a continuous pop until the first route
  void popUntilFirst() => popUntil((route) => route.isFirst);

  /// perform replash with routeName
  void popUntilRoute(String screenName, {bool rootNavigator = false}) => Navigator.of(this, rootNavigator: rootNavigator).popUntil(ModalRoute.withName(screenName));

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
    if ((xxs ?? xs ?? sm ?? md ?? lg ?? xl ?? xxl) == null) {
      throw ArgumentError("You need to provide at least one value (xxs, xs, sm, md, lg, xl, xxl)");
    }
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

extension MoreGetExtensions on GetInterface {
  // Returns the current [ScreenTier] based on the current [width] of the screen.
  ScreenTier get screenTier => ScreenTier.fromWidth(width);
}
