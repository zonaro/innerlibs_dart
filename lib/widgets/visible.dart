import 'package:flutter/material.dart';

class Visible extends StatelessWidget {
  const Visible({
    super.key,
    required this.visible,
    required this.child,
    this.alternateChild = const SizedBox.shrink(),
  });

  final bool visible;
  final Widget child;
  final Widget alternateChild;

  @override
  Widget build(BuildContext context) => visible ? child : alternateChild;
}
