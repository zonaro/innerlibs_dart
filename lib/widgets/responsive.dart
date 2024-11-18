import 'package:flutter/material.dart';
import 'package:innerlibs/build_context_extensions.dart';
import 'package:innerlibs/widgets/nil.dart';

/// A widget that displays different child widgets based on the screen size.
class Responsive extends StatelessWidget {
  /// Creates a [Responsive] widget.
  const Responsive({
    super.key,
    this.xxs,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  /// Widget to display on extra extra small screens.
  final Widget? xxs;

  /// Widget to display on extra small screens.
  final Widget? xs;

  /// Widget to display on small screens.
  final Widget? sm;

  /// Widget to display on medium screens.
  final Widget? md;

  /// Widget to display on large screens.
  final Widget? lg;

  /// Widget to display on extra large screens.
  final Widget? xl;

  /// Widget to display on extra extra large screens.
  final Widget? xxl;

  @override
  Widget build(BuildContext context) =>
      context.valueByTier(
        xxs: xxs,
        xs: xs,
        sm: sm,
        md: md,
        lg: lg,
        xl: xl,
        xxl: xxl,
      ) ??
        nil;
}
