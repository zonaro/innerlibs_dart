// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// Holds and validate the data loaded by a [FutureAwaiter]. Optionally expires after [expireDataAfter]
class AwaiterData<T> extends ValueNotifier<T?> {
  AwaiterData({this.validate = true, T? value, this.expireDataAfter}) : super(value);

  /// return true if last [expireAt] is less than [now]
  bool get expired {
    if (value == null) return true;
    if (loadedAt == null) return true;
    if (expireAt != null) return expireAt! <= now;
    return false;
  }

  set expired(bool value) {
    if (value) {
      loadedAt = null;
      this.value = null;
    }
  }

  date? loadedAt;

  Duration? expireDataAfter;
  date? get expireAt => expireDataAfter != null && loadedAt != null ? loadedAt!.add(expireDataAfter!) : null;

  /// When true, validate the snapshot data against the [Object.IsValid] function.
  /// Empty [List] or [Map], [Map] with all values empty, [num] = 0, empty or blank [String] will be considered empty data if this is true.
  final bool validate;

  Object? error;

  bool get hasData {
    if (value != null) {
      if (validate) {
        return value.isValid;
      }
      return true;
    }
    return false;
  }

  bool get hasError => error != null;
}

/// Wraps a [FutureBuilder] into a [Widget] and add some data validations, making it easier to use.
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> Function() future;

  /// The data that will be used to create the snapshots provided until a
  /// non-null [future] has completed.
  ///
  /// If the future completes with an error, the data in the [AsyncSnapshot]
  /// provided to the [builder] will become null, regardless of [initialData].
  /// (The error itself will be available in [AsyncSnapshot.error], and
  /// [AsyncSnapshot.hasError] will be true.)
  final T? initialData;

  /// When defined, store the data returned by [FutureBuilder] and prevent repeated calls to [future] function
  late AwaiterData<T> data;

  /// When true, return [emptyChild] instead of [ErrorWidget]. If [errorChild] is not null, this property do nothing.
  /// The default value is [kReleaseMode]
  final bool supressError;

  /// Function thats receive a non-null [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) builder;

  /// A [Widget] to return if [T] is null (or invalid if [data.validate] is true). If not specified return a shrink [SizedBox]
  final Widget? emptyChild;

  /// [Widget] to show while [future] is running
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Wraps a [FutureBuilder] into a more readable widget
  FutureAwaiter({
    super.key,
    required this.future,
    required this.builder,
    this.emptyChild,
    this.loading,
    this.errorChild,
    this.supressError = kReleaseMode,
    this.initialData,
    AwaiterData<T>? data,
    this.afterLoad,
    this.beforeLoad,
  }) {
    this.data = data ?? AwaiterData();
  }

  error(Object e) {
    consoleLog("Error:", error: e);
    return errorChild != null
        ? errorChild!(e)
        : supressError
            ? empty()
            : ErrorWidget(e);
  }

  empty() => emptyChild ?? const SizedBox.shrink();

  Widget _buildWidget(AsyncSnapshot<T> snapshot) {
    try {
      data.value = snapshot.data;
      data.error = snapshot.error;
      data.loadedAt ??= now;

      if (data.hasError) {
        return error(snapshot.error!);
      } else if (!data.hasData) {
        return empty();
      } else {
        return builder(snapshot.data as T);
      }
    } catch (e) {
      data.error = e;
      return error(e);
    }
  }

  final void Function()? afterLoad;
  final void Function()? beforeLoad;

  @override
  Widget build(BuildContext context) {
    if (beforeLoad != null) {
      beforeLoad!();
    }
    late Widget rt;
    if (data.expired) {
      data.loadedAt = null;
      consoleLog("Loading data...");
      return FutureBuilder<T>(
        future: future.call(),
        initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            rt = loading ?? const Center(child: CircularProgressIndicator());
          } else {
            rt = _buildWidget(snapshot);
          }
          if (afterLoad != null) {
            afterLoad!();
          }
          return rt;
        },
      );
    } else {
      consoleLog("Using previous loaded data...");
      consoleLog("Creation date: ${data.loadedAt?.toIso8601String()}");
      consoleLog("Expire at: ${data.expireAt?.toIso8601String() ?? "never"}");
      rt = _buildWidget(AsyncSnapshot.withData(ConnectionState.none, data.value as T));

      if (afterLoad != null) {
        afterLoad!();
      }
      return rt;
    }
  }
}
