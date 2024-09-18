import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// A simple card with an icon, title and subtitle.
/// Its follows the current theme color scheme if no color is provided
class SquareIconCard extends StatelessWidget {
  final String title;

  final String subtitle;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final double elevation;
  final double fontSize;
  const SquareIconCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.elevation = 5,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.colorScheme.primary;
    final backgroundColor = this.backgroundColor ?? context.colorScheme.surface;
    return Card(
      elevation: elevation,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                size: 80,
                color: color,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: fontSize * 0.8,
                      color: color,
                    ),
                  ).setOpacity(opacity: 0.7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
