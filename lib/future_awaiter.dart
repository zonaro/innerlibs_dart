library innerlibs;

import 'package:flutter/material.dart';

class FutureAwaiter<T> extends StatelessWidget {
  final Future<T> future;
  final Widget loadingWidget;
  final Widget Function(T data) doneWidget;
  final Widget errorWidget;
  final Widget? doneWithoutDataWidget;

  const FutureAwaiter({
    super.key,
    required this.future,
    required this.loadingWidget,
    required this.doneWidget,
    required this.errorWidget,
    this.doneWithoutDataWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget;
        } else {
          if (snapshot.hasError) {
            return errorWidget;
          } else if (snapshot.hasData && snapshot.data != null) {
            return doneWidget(snapshot.data as T);
          } else {
            return doneWithoutDataWidget ?? errorWidget;
          }
        }
      },
    );
  }
}
