import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// Wraps a [FutureBuilder] into a [Widget] and add some data validations, making it easier to use.
class FutureAwaiter<T> extends StatelessWidget {
  /// return a [FutureAwaiter] or a [Widget] based on [data.value].
  static Widget loadOnce<T>({
    Key? key,
    required ValueNotifier<T?> data,
    required Future<T> future,
    required Widget Function(T) child,
    Widget? emptyChild,
    Widget? loading,
    Widget Function(Object error)? errorChild,
    bool validate = true,
    bool supressError = kReleaseMode,
    T? initialData,
  }) {
    
    if (data.value ==null  || data.value.isNotValid) {
      return FutureAwaiter<T>(
        future: () async {
          data.value = await future;
          return data.value as T;
        }(),
        child: child,
        emptyChild: emptyChild,
        errorChild: errorChild,
        initialData: initialData,
        loading: loading,
        supressError: supressError,
        validate: validate,
        key: key,
      );
    }
    return child.call(data.value as T);
  }

  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> future;

  final T? initialData;

  /// When true, return [emptyChild] instead of [ErrorWidget]. If [errorChild] is not null, this property do nothing.
  /// The default value is [kReleaseMode]
  final bool supressError;

  /// When true, validate the snapshot data against the [Object.IsValid] function.
  /// Empty [List] or [Map], [Map] with all values empty, [num] = 0, empty or blank [String] will be considered empty data if this is true.
  final bool validate;

  /// Function thats receive a non-null [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) child;

  /// A [Widget] to return if [T] is null (or invalid if [validate] is true). If not specified return a shrink [SizedBox]
  final Widget? emptyChild;

  /// [Widget] to show while [future] is running
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Wraps a [FutureBuilder] into a more readable widget
  const FutureAwaiter({super.key, required this.future, required this.child, this.emptyChild, this.loading, this.errorChild, this.validate = true, this.supressError = kReleaseMode, this.initialData});

  error(Object e) {
    consoleLog("Error:", error: e);
    return errorChild != null
        ? errorChild!(e)
        : supressError
            ? empty()
            : ErrorWidget(e);
  }

  empty() => emptyChild ?? const SizedBox.shrink();

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading ?? const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return error(snapshot.error!);
              } else if (!snapshot.hasData || snapshot.data == null) {
                return empty();
              } else if (validate && (snapshot.data).isNotValid) {
                return empty();
              } else {
                return child(snapshot.data as T);
              }
            }
          } catch (e) {
            return error(e);
          }
        },
      );
}
