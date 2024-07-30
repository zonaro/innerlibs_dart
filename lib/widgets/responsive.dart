import 'package:flutter/material.dart';
import 'package:innerlibs/build_context_extensions.dart';
import 'package:innerlibs/widgets/nil.dart';

class Responsive extends StatelessWidget {
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

  final Widget? xxs;
  final Widget? xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
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
