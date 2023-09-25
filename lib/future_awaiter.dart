import 'package:flutter/material.dart';

class FutureAwaiter<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T data) doneWidget;
  final Widget doneWithoutDataWidget;
  final Widget? loadingWidget;
  final Widget Function(Object error)? errorWidget;
  final T? initialData;

  const FutureAwaiter({
    super.key,
    required this.future,
    required this.doneWidget,
    required this.doneWithoutDataWidget,
    this.loadingWidget,
    this.errorWidget,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidget ?? const CircularProgressIndicator();
          } else {
            if (snapshot.hasError && errorWidget != null) {
              return errorWidget!(snapshot.error!);
            } else if (snapshot.hasData && snapshot.data != null) {
              if (snapshot.data is List) {
                var l = snapshot.data as List;
                if (l.isEmpty) {
                  return doneWithoutDataWidget;
                } 
              }
              return doneWidget(snapshot.data as T);
            } else {
              return doneWithoutDataWidget;
            }
          }
        },
      );
}
