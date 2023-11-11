// ignore_for_file: unnecessary_cast, use_build_context_synchronously

import 'package:flutter/material.dart';

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) => context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();

  @override
  createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

extension RestartExtensions on BuildContext {
  restartApp() => RestartWidget.restartApp(this);
}
