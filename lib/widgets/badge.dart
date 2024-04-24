import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key, required this.child, this.badgeColor, this.textColor, required this.text, this.alignment});

  final Widget child;
  final dynamic text;
  final Color? badgeColor;
  final Color? textColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: alignment ?? Alignment.topRight.sum(x: .2, y: -1.5),
        children: [
          child,
          Container(
            // This is your Badge
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
            decoration: BoxDecoration(
              // This controls the shadow
              boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5, color: Colors.black.withAlpha(50))],
              borderRadius: BorderRadius.circular(100),
              color: badgeColor ?? context.primaryColor, // This would be color of the Badge
            ), // This is your Badge
            child: Center(
              // Here you can put whatever content you want inside your Badge
              child: text is Widget ? text : Text("$text", style: TextStyle(color: textColor ?? context.theme.colorScheme.onPrimary)),
            ),
          ),
        ],
      ),
    );
  }
}
