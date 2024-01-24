import 'package:flutter/material.dart';
import 'package:innerlibs/string_extensions.dart';
 
 

/// Wraps a [FutureBuilder] and make is easier to use
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> future;

  /// Function thats receive a [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) doneWidget;

  /// A [Widget] to return if [T] is null or empty. If not specified return a [SizedBox]
  ///
  /// Empty [List] and blank [String] will be considered empty data in this case.
  final Widget? doneWithoutDataWidget;

  /// [Widget] to show while [future] is running
  final Widget? loadingWidget;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorWidget;

  const FutureAwaiter({
    super.key,
    required this.future,
    required this.doneWidget,
    this.doneWithoutDataWidget,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loadingWidget ?? const CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return errorWidget != null ? errorWidget!(snapshot.error!) : ErrorWidget(snapshot.error!);
            } else if (snapshot.hasData && snapshot.data != null) {
              switch (snapshot.data) {
                case String():
                  var l = snapshot.data as String;
                  if (l.isBlank) {
                    debugPrint("String is null, blank or empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                case List():
                  var l = snapshot.data as List;
                  if (l.isEmpty) {
                    debugPrint("List is empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                case Map():
                  var l = snapshot.data as Map;
                  if (l.isEmpty) {
                    debugPrint("Map is empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                case Iterable():
                  var l = snapshot.data as Iterable;
                  if (l.isEmpty) {
                    debugPrint("Iterable is empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                default:
                  break;
              }
              return doneWidget(snapshot.data as T);
            }
            return doneWithoutDataWidget ?? const SizedBox.shrink();
          }
        },
      );
}
