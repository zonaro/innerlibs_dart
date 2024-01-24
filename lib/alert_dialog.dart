import 'package:flutter/material.dart';
import 'package:innerlibs/context_extensions/navigation_extension.dart';

/// The `title` argument is used to title of alert dialog.
/// The `content` argument is used to content of alert dialog.
/// The `textOK` argument is used to text for 'OK' Button of alert dialog.
Future<void> alert(
  BuildContext context, {
  Widget? title,
  Widget? content,
  Widget? textOK,
}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: title,
        content: SingleChildScrollView(child: content),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(),
            child:
                textOK ?? Text(MaterialLocalizations.of(context).okButtonLabel),
          ),
        ],
      ),
    );
