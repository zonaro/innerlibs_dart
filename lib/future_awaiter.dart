import 'package:flutter/material.dart';

class FutureAwaiter<T> extends StatelessWidget {
  final Future<T> future;
  final Widget loadingWidget;
  final Widget Function(T data) doneWidget;
  final Widget doneWithoutDataWidget;
  final Widget Function(Object error) errorWidget;

  const FutureAwaiter({super.key, 
    required this.future,
    required this.loadingWidget,
    required this.doneWidget,
    required this.doneWithoutDataWidget,
    required this.errorWidget,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget;
        } else {
          if (snapshot.hasError) {
            return errorWidget(snapshot.error!);
          } else if (snapshot.hasData) {
            return doneWidget(snapshot.data!);
          } else {
            return doneWithoutDataWidget;
          }
        }
      },
    );
}
