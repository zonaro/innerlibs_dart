import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:innerlibs/localizations_extension.dart';
import 'package:innerlibs/navigation_extension.dart';

import 'package:innerlibs/platform.dart';
import 'package:innerlibs/string_extensions.dart';

extension DialogExt on BuildContext {
  void alertDialog(String message, String? title) => dialog(title: title ?? "", message: message, cancelButton: "OK");

  /// The `title` argument is used to title of alert dialog.
  /// The `content` argument is used to content of alert dialog.
  /// The `textOK` argument is used to text for 'OK' Button of alert dialog.
  /// The `textCancel` argument is used to text for 'Cancel' Button of alert dialog.
  /// The `canPop` argument is `canPop` of PopScope.
  /// The `onPopInvoked` argument is `onPopInvoked` of PopScope.
  ///
  /// Returns a [Future<bool>].
  Future<bool> confirm({
    Widget? title,
    Widget? content,
    Widget? textOK,
    Widget? textCancel,
    bool canPop = false,
    void Function(bool)? onPopInvoked,
  }) async {
    final bool? isConfirm = await showDialog<bool>(
      context: this,
      builder: (BuildContext context) => PopScope(
        canPop: canPop,
        onPopInvoked: onPopInvoked,
        child: AlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: content ?? const Text('Are you sure continue?'),
          ),
          actions: <Widget>[
            TextButton(
              child: textCancel ?? Text(MaterialLocalizations.of(context).cancelButtonLabel),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: textOK ?? Text(MaterialLocalizations.of(context).okButtonLabel),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
      ),
    );
    return isConfirm ?? false;
  }

  void dialog({required String title, required String message, List<String> buttons = const [], String? cancelButton, Function(String)? onDone, Color? positiveTitleColor, Color? cancelTitleColor, double? fontSize, bool barrierDismissible = true}) {
    List<Widget> arrWidget = [];

    if (buttons.isEmpty) {
      cancelButton ??= materialLocalizations.okButtonLabel;
    }

    if (cancelButton.isNotBlank) {
      if (MyPlatform.isApple) {
        CupertinoDialogAction action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: cancelTitleColor, fontSize: fontSize),
          onPressed: () => pop(),
          child: cancelButton!.asText,
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
          child: cancelButton!.asText,
          onPressed: () => pop(),
        );
        arrWidget.add(action);
      }
    }

    for (var buttonTitle in buttons) {
      late Widget action;

      if (MyPlatform.isApple) {
        action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: positiveTitleColor, fontSize: fontSize),
          onPressed: () {
            if (onDone != null) {
              onDone(buttonTitle);
            }
            pop();
          },
          child: buttonTitle.asText,
        );
      } else {
        action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: positiveTitleColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          child: buttonTitle.asText,
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

    showDialog(
        barrierDismissible: barrierDismissible,
        context: this,
        builder: (BuildContext context) {
          if (MyPlatform.isApple) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: arrWidget,
            );
          } else {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text(title),
              content: Text(message),
              actions: arrWidget,
            );
          }
        });
  }
}
