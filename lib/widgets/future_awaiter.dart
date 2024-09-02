// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// Holds and validate the data loaded by a [FutureAwaiter]. Optionally expires after [expireDataAfter]
class AwaiterData<T> extends ValueNotifier<T?> implements Validator {
  date? loadedAt;

  Duration? expireDataAfter;

  /// When true, validate the snapshot data against the [Object.IsValid] function.
  /// Empty [List] or [Map], [Map] with all values empty, [num] = 0, empty or blank [String] will be considered empty data if this is true.
  final bool validateData;

  Object? error;

  List<string? Function(T?)> validations;

  AwaiterData({this.validateData = true, T? value, this.expireDataAfter, this.validations = const []}) : super(value);
  T? get data {
    if (hasData) {
      return value!;
    }
    return null;
  }

  date? get expireAt => expireDataAfter != null && loadedAt != null ? loadedAt!.add(expireDataAfter!) : null;

  /// return true if last [expireAt] is less than [now]
  bool get expired {
    if (value == null) return true;
    if (loadedAt == null) return true;
    if (expireAt != null) return expireAt! <= now;
    return false;
  }

  set expired(bool value) {
    if (value) {
      clear();
    }
  }

  /// Return true if [data] contains a non-null value. If [validateData] is true, also validate the data against [Object.IsValid] function.
  ///
  bool get hasData => validateData ? isValid(value) : value != null;

  /// Return true if [error] is not null
  bool get hasError => error != null;

  void clear() {
    value = null;
    error = null;
    loadedAt = null;
  }

  @override
  Iterable<String> validate() {
    if (this.validateData) {
      if (validations.isEmpty) {
        return value.isValid() ? [] : ["Data is invalid"];
      }
      return validations.map((x) => x(value)).whereNotNull();
    }
    return [];
  }
}

/// Wraps a [FutureBuilder] into a [Widget] and add some data validations, making it easier to use.
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> Function() future;

  /// When defined, store the data returned by [FutureBuilder] and prevent repeated calls to [future] function
  late AwaiterData<T> data;

  /// When true, return [emptyChild] instead of [ErrorWidget]. If [errorChild] is not null, this property do nothing.
  /// The default value is [kReleaseMode]
  final bool supressError;

  /// Function thats receive a non-null [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) builder;

  /// A [Widget] to return if [T] is null (or invalid if [data.validate] is true). If not specified return a shrink [SizedBox]
  final Widget? emptyChild;

  /// [Widget] to show while waiting for [future] response. If not specified return a [CircularProgressIndicator]
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Function to be called after the data is loaded. Receive the data returned by [future] function.
  final void Function(T?)? afterLoad;

  /// Function to be called before the data is loaded.
  final void Function()? beforeLoad;

  FutureAwaiter({
    super.key,
    required this.future,
    required this.builder,
    this.emptyChild,
    this.loading,
    this.errorChild,
    this.supressError = kReleaseMode,
    AwaiterData<T>? data,
    this.afterLoad,
    this.beforeLoad,
  }) {
    this.data = data ?? AwaiterData();
  }

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
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            rt = loading ?? const Center(child: CircularProgressIndicator());
          } else {
            rt = _buildWidget(snapshot);
          }
          if (afterLoad != null) {
            afterLoad!(data.value);
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
        afterLoad!(data.value);
      }
      return rt;
    }
  }

  empty() => emptyChild ?? nil;
  error(Object e) {
    consoleLog("Error: $e", error: e);
    return errorChild != null
        ? errorChild!(e)
        : supressError
            ? empty()
            : ErrorWidget(e);
  }

  Widget _buildWidget(AsyncSnapshot<T> snapshot) {
    try {
      data.value = snapshot.data;
      data.error = snapshot.error;
      data.loadedAt ??= now;

      if (data.hasError) {
        throw snapshot.error!;
      } else if (!data.hasData) {
        return empty();
      } else {
        return builder(data.value as T);
      }
    } catch (e) {
      data.error = e;
      return error(e);
    }
  }
}
