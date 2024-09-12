import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class SquareIconCard extends StatelessWidget {
  final String title;

  final String subtitle;
  final IconData? icon;
  const SquareIconCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
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
