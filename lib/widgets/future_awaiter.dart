import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// Wraps a [FutureBuilder] into a [Widget] and add some data validations, making it easier to use.
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> future;

  /// When true, return [emptyChild] instead of [ErrorWidget]. If [errorChild] is not null, this property do nothing.
  /// The default value is [kReleaseMode]
  final bool supressError;

  /// When true, validate the snapshot data against the [Object.IsValid] function.
  /// Empty [List] or [Map], [Map] with all values empty, [num] = 0, empty or blank [String] will be considered empty data if this is true.
  final bool validate;

  /// Function thats receive a [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) child;

  /// A [Widget] to return if [T] is null or empty. If not specified return a shrink [SizedBox]
  final Widget? emptyChild;

  /// [Widget] to show while [future] is running
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Wraps a [FutureBuilder] into a more readable widget
  const FutureAwaiter({super.key, required this.future, required this.child, this.emptyChild, this.loading, this.errorChild, this.validate = true, this.supressError = kReleaseMode});

  _error(Object e) => errorChild != null
      ? errorChild!(e)
      : supressError
          ? _empty()
          : ErrorWidget(e);

  _empty() => emptyChild ?? const SizedBox.shrink();

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading ?? const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return _error(snapshot.error!);
              } else if (validate && (!snapshot.hasData || snapshot.data == null || (snapshot.data).isNotValid)) {
                return _empty();
              } else {
                return child(snapshot.data as T);
              }
            }
          } catch (e) {
            return _error(e);
          }
        },
      );
}
