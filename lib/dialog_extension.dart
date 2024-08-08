// ignore_for_file: use_build_context_synchronously

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

extension DialogExt on BuildContext {
  /// The `title` argument is used to title of alert dialog.\
  /// The `textOK` argument is used to text for 'OK' Button of alert dialog.\
  /// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.\
  /// The `initialValue` argument is used to an initial value of alert dialog.\
  /// The `isSelectedInitialValue` argument is used to select an initial value of alert dialog.\
  /// The `hintText` argument will be hintText in TextFormField of alert dialog.\
  /// The `validator` argument will be validator in TextFormField of alert dialog.\
  /// The `minLines` argument will be minLines in TextFormField of alert dialog.\
  /// The `maxLines` argument will be maxLines in TextFormField of alert dialog.\
  /// The `autoFocus` argument will be autoFocus in TextFormField of alert dialog.\
  /// The `keyboardType` argument will be keyboardType in TextFormField of alert dialog.\
  /// The `textInputAction` argument will be textInputAction in TextFormField of alert dialog.\
  /// The `obscureText` argument will be obscureText in TextFormField of alert dialog.\
  /// The `obscuringCharacter` argument will be obscuringCharacter in TextFormField of alert dialog.\
  /// The `showPasswordIcon` visible for show password icon. default is false.\
  /// The `barrierDismissible` argument will be barrierDismissible showDialog form of alert dialog.\
  /// The `textCapitalization` argument will be textCapitalization in TextFormField of alert dialog.\
  /// The `textAlign` argument will be textAlign in TextFormField of alert dialog.\
  /// The `controller` argument will be controller in TextFormField of alert dialog.\
  /// The `decoration` argument will allow modification of the text field decoration. The `hintText` and `suffixIcon` fields will be overridden.\
  /// The `canPop` argument is `canPop` of PopScope.\
  /// The `onPopInvoked` argument is `onPopInvoked` of PopScope.
  /// The `maxLength` argument will be maxLength in TextFormField of alert dialog.\
  ///
  /// Returns a [Future<String?>].
  Future<String?> prompt({
    dynamic title,
    dynamic textOK,
    dynamic textCancel,
    String? initialValue,
    bool isSelectedInitialValue = true,
    String? hintText,
    String? Function(String?)? validator,
    int minLines = 1,
    int maxLines = 1,
    bool autoFocus = true,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
    String obscuringCharacter = '•',
    bool showPasswordIcon = false,
    bool barrierDismissible = false,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextAlign textAlign = TextAlign.start,
    TextEditingController? controller,
    InputDecoration? decoration,
    EdgeInsets? insetPadding,
    EdgeInsets? contentPadding,
    EdgeInsets? actionsPadding,
    EdgeInsets? titlePadding,
    EdgeInsets? buttonPadding,
    EdgeInsets? iconPadding,
    bool canPop = false,
    void Function(bool, dynamic)? onPopInvoked,
    int? maxLength,
  }) {
    return showDialog(
      context: this,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return _PromptDialog(
          title: (title as Object?).asNullableText(),
          textOK: (textOK as Object?).asNullableText(),
          textCancel: (textCancel as Object?).asNullableText(),
          initialValue: initialValue,
          isSelectedInitialValue: isSelectedInitialValue,
          hintText: hintText,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          autoFocus: autoFocus,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          showPasswordIcon: showPasswordIcon,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          controller: controller,
          decoration: decoration ?? const InputDecoration(),
          insetPadding: insetPadding ?? EdgeInsets.zero,
          contentPadding: contentPadding,
          actionsPadding: actionsPadding,
          titlePadding: titlePadding,
          buttonPadding: buttonPadding,
          iconPadding: iconPadding,
          canPop: canPop,
          onPopInvoked: onPopInvoked,
          maxLength: maxLength,
        );
      },
    );
  }

  Future<void> alert(dynamic message, [String? title]) async => await dialog(message, title: title);

  /// The `title` argument is used to title of alert dialog.
  /// The `content` argument is used to content of alert dialog.
  /// The `textOK` argument is used to text for 'OK' Button of alert dialog.
  /// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.
  /// The `canPop` argument is `canPop` of PopScope.
  /// The `onPopInvoked` argument is `onPopInvoked` of PopScope.
  ///
  /// Returns a [Future<bool>].
  Future<bool> confirm(
    dynamic content, {
    dynamic title,
    dynamic textOK,
    dynamic textCancel,
    bool canPop = false,
    void Function(bool, dynamic)? onPopInvoked,
  }) async {
    final bool? isConfirm = await showDialog<bool>(
      context: this,
      builder: (BuildContext context) {
        textOK ??= context.localizations.okButtonLabel;
        textCancel ??= context.localizations.cancelButtonLabel;
        content ??= "${context.localizations.continueButtonLabel}?";
        return PopScope(
          canPop: canPop,
          onPopInvokedWithResult: onPopInvoked,
          child: AlertDialog(
            title: (title as Object?).asNullableText(),
            content: SingleChildScrollView(
              child: (content as Object?).asText(),
            ),
            actions: <Widget>[
              TextButton(
                child: (textCancel as Object?).asText(),
                onPressed: () => context.pop(false),
              ),
              TextButton(
                child: (textOK as Object?).asText(),
                onPressed: () => context.pop(true),
              ),
            ],
          ),
        );
      },
    );
    return isConfirm ?? false;
  }

  /// Displays a confirmation dialog and shows a loader if the user confirms.
  ///
  /// The [confirmTaskMessage] parameter represents the content of the confirmation dialog.
  /// The [title] parameter represents the title of the confirmation dialog.
  /// The [textOK] parameter represents the text for the OK button in the confirmation dialog.
  /// The [textCancel] parameter represents the text for the Cancel button in the confirmation dialog.
  /// The [canPop] parameter determines whether the dialog can be dismissed by popping the route.
  /// The [onPopInvoked] parameter is a callback function that is invoked when the dialog is popped.
  /// The [task] parameter is a function that returns a future representing the task to be performed.
  /// The [cancelTaskButtonText] parameter represents the text for the Cancel button in the loader.
  /// The [loadingText] parameter represents the text to be displayed while the task is loading.
  /// The [cancelConfirmationMessage] parameter represents the message to be displayed in the confirmation dialog.
  ///
  /// Returns the result of the task if the user confirms, otherwise returns null.
  Future<T?> confirmTask<T>({
    dynamic confirmTaskMessage,
    dynamic title,
    dynamic textOK,
    dynamic textCancel,
    bool canPop = false,
    void Function(bool, dynamic)? onPopInvoked,
    Future<T?> Function()? task,
    dynamic cancelTaskButtonText,
    dynamic loadingText,
    dynamic cancelConfirmationMessage,
    void Function(Object?)? onError,
  }) async {
    bool isConfirmed = await confirm(
      confirmTaskMessage,
      title: title,
      textOK: textOK,
      textCancel: textCancel,
      canPop: canPop,
      onPopInvoked: onPopInvoked,
    );
    if (isConfirmed) {
      return await showTaskLoader(
        task: task,
        cancelTaskButtonText: cancelTaskButtonText,
        loadingText: loadingText,
        textOK: textOK,
        textCancel: textCancel,
        confirmationMessage: cancelConfirmationMessage,
        onError: onError,
      );
    }
    return null;
  }

  Future<void> dialog(dynamic content, {String? title, List<String> buttons = const [], String? cancelButton, Function(String)? onDone, Color? positiveTitleColor, Color? cancelTitleColor, double? fontSize, bool barrierDismissible = true}) async {
    List<Widget> arrWidget = [];

    if (buttons.isEmpty) {
      cancelButton ??= materialLocalizations.okButtonLabel;
    }

    if (cancelButton.isNotBlank) {
      if (isApple) {
        CupertinoDialogAction action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: cancelTitleColor, fontSize: fontSize),
          onPressed: pop,
          child: cancelButton!.asText(),
        );

        arrWidget.add(action);
      } else {
        TextButton action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: cancelTitleColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          onPressed: pop,
          child: cancelButton!.asText(),
        );
        arrWidget.add(action);
      }
    }

    for (var buttonTitle in buttons) {
      late Widget action;

      if (isApple) {
        action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: positiveTitleColor, fontSize: fontSize),
          onPressed: () {
            if (onDone != null) {
              onDone(buttonTitle);
            }
            pop();
          },
          child: buttonTitle.asText(),
        );
      } else {
        action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: positiveTitleColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          child: buttonTitle.asText(),
          onPressed: () {
            if (onDone != null) {
              onDone(buttonTitle);
            }
            pop();
          },
        );
      }
      arrWidget.add(action);
    }

    return await showDialog(
        barrierDismissible: barrierDismissible,
        context: this,
        builder: (BuildContext context) {
          if (isApple) {
            return CupertinoAlertDialog(
              title: title?.asText(),
              content: forceWidget(content),
              actions: arrWidget,
            );
          } else {
            return AlertDialog(
              title: title?.asText(),
              content: forceWidget(content),
              actions: arrWidget,
            );
          }
        });
  }

  /// Shows a task loader dialog and executes a task asynchronously.
  ///
  /// The [showTaskLoader] function displays a dialog with a circular progress indicator and an optional loading text.
  /// It also provides an option to cancel the task by showing a cancel button.
  ///
  /// The [task] parameter is a function that represents the task to be executed. It should return a future that resolves to a value of type [T].
  ///
  /// The [cancelTaskButtonText] parameter is the text to be displayed on the cancel button. It can be of any type and will be converted to a string.
  ///
  /// The [loadingText] parameter is the text to be displayed below the progress indicator. It can be of any type and will be converted to a string.
  ///
  /// The [textOK] parameter is the text to be displayed on the OK button. It can be of any type and will be converted to a string.
  ///
  /// The [textCancel] parameter is the text to be displayed on the cancel button. It can be of any type and will be converted to a string.
  ///
  /// The [confirmationMessage] parameter is an optional message to be displayed before canceling the task. If provided, the user will be prompted to confirm the cancellation.
  ///
  /// The function returns a future that resolves to the result of the task execution, or `null` if the task was canceled.
  ///
  /// Example usage:
  /// ```dart
  /// final result = await showTaskLoader(
  ///   task: () async {
  ///     // Perform some asynchronous task
  ///     return await fetchData();
  ///   },
  ///   cancelTaskButtonText: 'Cancel',
  ///   loadingText: 'Loading...',
  ///   textOK: 'OK',
  ///   textCancel: 'Cancel',
  ///   confirmationMessage: 'Are you sure you want to cancel the task?',
  /// );
  /// ```

  Future<T?> showTaskLoader<T>({
    Future<T?> Function()? task,
    dynamic cancelTaskButtonText,
    dynamic loadingText,
    dynamic textOK,
    dynamic textCancel,
    dynamic confirmationMessage,
    void Function(Object?)? onError,
  }) async {
    T? result;
    CancelableOperation<T?>? operation;

    bool cancellable = forceWidget(cancelTaskButtonText) != null && task != null;

    cancelTask() async {
      if (cancellable) {
        if (confirmationMessage == null || await confirm(confirmationMessage, textCancel: textCancel, textOK: textOK)) {
          await operation?.cancel();
        }
        if (canPop()) {
          pop(result);
        }
      }
    }

    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) => PopScope(
        canPop: cancellable,
        onPopInvokedWithResult: (f, r) => cancelTask(),
        child: AlertDialog(
          actions: [
            if (cancellable) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: cancelTask,
                child: forceWidget(cancelTaskButtonText),
              ),
            ],
          ],
          content: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator(),
                if (loadingText != null) ...[
                  const SizedBox(height: 20),
                  forceWidget(loadingText)!,
                ],
              ],
            ),
          ),
        ),
      ),
    );

    if (task != null) {
      Future<T?> tryf() async {
        T? r;
        try {
          r = await task();
        } catch (e) {
          if (onError != null) {
            (onError).call(e); // Call onError function if provided
          }
          await operation?.cancel();
          r = null;
        }
        if (canPop()) {
          pop(result);
        }
        return r;
      }

      operation = CancelableOperation.fromFuture(tryf());
      result = await operation.valueOrCancellation();
    }

    return result;
  }
}

class _PromptDialog extends StatefulWidget {
  const _PromptDialog({
    required this.isSelectedInitialValue,
    required this.minLines,
    required this.maxLines,
    required this.autoFocus,
    required this.obscureText,
    required this.obscuringCharacter,
    required this.showPasswordIcon,
    required this.textCapitalization,
    required this.textAlign,
    required this.decoration,
    required this.insetPadding,
    required this.canPop,
    this.title,
    this.textOK,
    this.textCancel,
    this.initialValue,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.contentPadding,
    this.actionsPadding,
    this.titlePadding,
    this.buttonPadding,
    this.iconPadding,
    this.onPopInvoked,
    this.maxLength,
  });

  final Widget? title;
  final Widget? textOK;
  final Widget? textCancel;
  final String? initialValue;
  final bool isSelectedInitialValue;
  final String? hintText;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final bool autoFocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String obscuringCharacter;
  final bool showPasswordIcon;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final EdgeInsets insetPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? actionsPadding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? buttonPadding;
  final EdgeInsets? iconPadding;
  final bool canPop;
  final void Function(bool, dynamic)? onPopInvoked;
  final int? maxLength;

  @override
  __PromptDialogState createState() => __PromptDialogState();
}

class __PromptDialogState extends State<_PromptDialog> {
  late TextEditingController controller;
  late bool stateObscureText = widget.obscureText;

  String? value;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      onPopInvokedWithResult: widget.onPopInvoked,
      child: AlertDialog(
        insetPadding: widget.insetPadding,
        contentPadding: widget.contentPadding,
        actionsPadding: widget.actionsPadding,
        titlePadding: widget.titlePadding,
        buttonPadding: widget.buttonPadding,
        iconPadding: widget.iconPadding,
        title: widget.title,
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              decoration: widget.decoration.copyWith(
                hintText: widget.hintText,
                suffixIcon: widget.showPasswordIcon
                    ? IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: stateObscureText ? Colors.grey : Colors.blueGrey,
                        ),
                        onPressed: () {
                          stateObscureText = !stateObscureText;
                          setState(() {
                            controller.selection = TextSelection.fromPosition(
                              const TextPosition(offset: 0),
                            );
                            controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.text.length),
                            );
                          });
                        },
                      )
                    : null,
              ),
              validator: widget.validator,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              autofocus: widget.autoFocus,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              onChanged: (String text) => value = text,
              obscureText: stateObscureText,
              obscuringCharacter: widget.obscuringCharacter,
              textCapitalization: widget.textCapitalization,
              onEditingComplete: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, value);
                }
              },
              textAlign: widget.textAlign,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: (widget.textCancel != null) ? widget.textCancel! : Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context, value);
              }
            },
            child: (widget.textOK != null) ? widget.textOK! : Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
  }
}
