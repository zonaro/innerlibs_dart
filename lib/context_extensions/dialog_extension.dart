import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/context_extensions/localizations_extension.dart';
import 'package:innerlibs/context_extensions/navigation_extension.dart';

import 'package:innerlibs/platform.dart';

extension DialogExt on BuildContext {
  void showAlertDialog({
    required String title,
    required String message,
    List<String> actionButtonsTitle = const [],
    String? cancelButtonTitle,
    Function(int)? onDone,
    Color? positiveTitleColor,
    Color? cancelTitleColor,
    double? fontSize,
    bool barrierDismissible = true,
  }) {
 
    if (actionButtonsTitle.isEmpty) {  
      cancelButtonTitle ??= materialLocalizations.okButtonLabel;
    }
    // Check the platform
    if (MyPlatform.isIOS) {
      // show cuperino dialog
      _showIOSDialog(
        this,
        title,
        message,
        actionButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    } else {
      // shoe material dialog
      _showAndroidDialog(
        this,
        title,
        message,
        actionButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    }
  }

  void _showIOSDialog(BuildContext context, String title, String message, List<String> buttons, String? cancelButton, Function(int)? onDone, Color? positiveTitleColor, Color? cancelTitleColor, double? fontSize, bool barrierDismissible) {
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      CupertinoDialogAction action = CupertinoDialogAction(
        isDefaultAction: true,
        textStyle: TextStyle(color: cancelTitleColor, fontSize: fontSize),
        onPressed: () {
          context.pop();
        },
        child: Text(cancelButton),
      );
      arrWidget.add(action);
    }

    if (buttons.isNotEmpty) {
      for (String buttonTitle in buttons) {
        CupertinoDialogAction action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: positiveTitleColor, fontSize: fontSize),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            context.pop();
          },
          child: Text(buttonTitle),
        );
        arrWidget.add(action);
      }
    }

    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: arrWidget,
          );
        });
  }

  void _showAndroidDialog(BuildContext context, String title, String message, List<String> buttons, String? cancelButton, Function(int)? onDone, Color? positiveTitleColor, Color? cancelTitleColor, double? fontSize, bool barrierDismissible) {
    // flutter defined function
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      TextButton action = TextButton(
        style: TextButton.styleFrom(
          foregroundColor: cancelTitleColor,
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        child: Text(
          cancelButton,
        ),
        onPressed: () {
          context.pop();
        },
      );
      arrWidget.add(action);
    }

    if (buttons.isNotEmpty) {
      for (String buttonTitle in buttons) {
        TextButton action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: positiveTitleColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          child: Text(
            buttonTitle,
          ),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            context.pop();
          },
        );
        arrWidget.add(action);
      }
    }

    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(title),
            content: Text(message),
            actions: arrWidget,
          );
        });
  }
}
