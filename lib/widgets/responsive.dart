import 'package:flutter/material.dart';
import 'package:innerlibs/build_context_extensions.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key, this.mobile, this.tablet, this.desktop});

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) => context.responsiveValue(smallScreen: mobile, largeScreen: desktop, mediumScreen: tablet) ?? tablet ?? desktop ?? const SizedBox.shrink();
}
