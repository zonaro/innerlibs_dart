import 'dart:async';
import 'dart:ui';

/// A static class for handling method call debouncing.
abstract class InnerDebounce {
  static final Map<String, _InnerOperation> _debounceOperations = {};

  static final Map<String, _InnerOperation> _rateLimitOperations = {};

  static final Map<String, _InnerOperation> _throttleOperations = {};

  /// Cancels all active debouncers.
  void cancelAllDebounce() {
    for (final operation in _debounceOperations.values) {
      operation.timer.cancel();
    }
    _debounceOperations.clear();
  }

  /// Cancels all active rate limiters.
  void cancelAllRateLimit() {
    for (final operation in _rateLimitOperations.values) {
      operation.timer.cancel();
    }
    _rateLimitOperations.clear();
  }

  /// Cancels all active throttles.
  void cancelAllThrottles() {
    for (final operation in _throttleOperations.values) {
      operation.timer.cancel();
    }
    _throttleOperations.clear();
  }

  /// Cancels any active debounce operation with the given [tag].
  void cancelDebounce(String tag) {
    _debounceOperations[tag]?.timer.cancel();
    _debounceOperations.remove(tag);
  }

  /// Cancels any active rate limiter with the given [tag].
  void cancelRateLimit(String tag) {
    _rateLimitOperations[tag]?.timer.cancel();
    _rateLimitOperations.remove(tag);
  }

  /// Cancels any active throttle with the given [tag].
  void cancelThrottle(String tag) {
    _throttleOperations[tag]?.timer.cancel();
    _throttleOperations.remove(tag);
  }

  /// Will delay the execution of [onExecute] with the given [duration]. If another call to
  /// debounce() with the same [tag] happens within this duration, the first call will be
  /// cancelled and the debouncer will start waiting for another [duration] before executing
  /// [onExecute].
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular debounce
  /// operation in subsequent calls to [debounce()] or [cancel()].
  ///
  /// If [duration] is `Duration.zero`, [onExecute] will be executed immediately, i.e.
  /// synchronously.
  void debounce(String tag, Duration duration, VoidCallback onExecute) {
    if (duration == Duration.zero) {
      _debounceOperations[tag]?.timer.cancel();
      _debounceOperations.remove(tag);
      onExecute();
    } else {
      _debounceOperations[tag]?.timer.cancel();

      _debounceOperations[tag] = _InnerOperation(
          timer: Timer(duration, () {
            _debounceOperations[tag]?.timer.cancel();
            _debounceOperations.remove(tag);

            onExecute();
          }),
          callback: onExecute);
    }
  }

  /// Fires the callback associated with [tag] immediately. This does not cancel the debounce timer,
  /// so if you want to invoke the callback and cancel the debounce timer, you must first call
  /// `fire(tag)` and then `cancel(tag)`.
  void fireDebounce(String tag) {
    if (_debounceOperations[tag]?.callback != null) {
      _debounceOperations[tag]?.callback();
    }
  }

  /// Fires the debounce action associated with the given [tag] and then cancels the debounce.
  ///
  /// This function first calls [fireDebounce] with the provided [tag] to execute the debounce action.
  /// After that, it calls [cancelDebounce] with the same [tag] to cancel any further debounce actions.
  ///
  /// [tag]: A string identifier used to reference the debounce action.
  void fireDebounceEnd(String tag) {
    fireDebounce(tag);
    cancelDebounce(tag);
  }

  /// Returns a list of active debouncers.
  ///
  /// Active debouncers are those that have not yet executed their [onExecute] methods.
  Iterable<String> getDebounceTags() => _debounceOperations.keys;

  /// Returns the tags of the active rate limiters.
  ///
  /// This function retrieves and returns a list of tags associated with
  /// the currently active rate limiters. Rate limiters are used to control
  /// the rate at which certain operations are allowed to execute, preventing
  /// them from being performed too frequently.
  ///
  /// Returns:
  ///   A list of strings representing the tags of the active rate limiters.

  Iterable<String> getRateLimitTags() => _rateLimitOperations.keys;

  /// Returns a list of all active throttle tags.
  ///
  /// Throttle tags are used to identify and manage throttled functions.
  /// This method provides a way to retrieve all currently active tags,
  /// which can be useful for debugging or monitoring purposes.
  ///
  /// Returns:
  ///   A list of strings representing the active throttle tags.
  Iterable<String> getThrottleTags() => _throttleOperations.keys;

  /// Will execute [onExecute] immediately and record additional attempts to
  /// call rateLimit with the same [tag] happens until the given [duration] has passed
  /// when it will execute with the last attempt.
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular rate limited
  /// operation in subsequent calls to [rateLimit()] or [cancel()].
  ///
  /// [duration] is the amount of time until the subsequent attempts will be sent.
  ///
  /// [onAfter] is executed after the [duration] has passed in which there were no rate limited calls.
  ///
  /// Returns whether the operation was rate limited
  bool rateLimit(
    String tag,
    Duration duration,
    VoidCallback onExecute, {
    VoidCallback? onAfter,
  }) {
    final rateLimited = _rateLimitOperations.containsKey(tag);
    if (rateLimited) {
      _rateLimitOperations[tag]?.callback = onExecute;
      _rateLimitOperations[tag]?.onAfter = onAfter;
      return true;
    }

    final operation = _InnerOperation(
      timer: Timer.periodic(duration, (Timer timer) {
        final operation = _rateLimitOperations[tag];

        if (operation != null) {
          operation.callback();
          if (operation.onAfter != null) {
            operation.onAfter!();
          }
          operation.callback = () {};
          operation.onAfter = null;
        }
      }),
      callback: onExecute,
      onAfter: onAfter,
    );

    _rateLimitOperations[tag] = operation;

    onExecute();

    return false;
  }

  /// Will execute [onExecute] immediately and ignore additional attempts to
  /// call throttle with the same [tag] happens for the given [duration].
  ///
  /// [tag] is any arbitrary String, and is used to identify this particular throttle
  /// operation in subsequent calls to [throttle()] or [cancel()].
  ///
  /// [duration] is the amount of time subsequent attempts will be ignored.
  ///
  /// Returns whether the operation was throttled
  bool throttle(
    String tag,
    Duration duration,
    VoidCallback onExecute, {
    VoidCallback? onAfter,
  }) {
    var throttled = _throttleOperations.containsKey(tag);
    if (throttled) {
      return true;
    }

    _throttleOperations[tag] = _InnerOperation(
      timer: Timer(duration, () {
        _throttleOperations[tag]?.timer.cancel();
        _InnerOperation? removed = _throttleOperations.remove(tag);

        removed?.onAfter?.call();
      }),
      callback: onExecute,
      onAfter: onAfter,
    );

    onExecute();

    return false;
  }
}

class _InnerOperation {
  VoidCallback callback;
  VoidCallback? onAfter;
  Timer timer;

  _InnerOperation({required this.timer, required this.callback, this.onAfter});
}
