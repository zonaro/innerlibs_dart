import 'package:flutter/material.dart';

class IconMenu extends StatefulWidget {
  final List<IconMenuButton> buttons;

  const IconMenu({Key? key, required this.buttons}) : super(key: key);

  @override
  createState() => _IconMenuState();
}

class _IconMenuState extends State<IconMenu> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return PopupMenuButton<IconMenuButton>(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) {
              return widget.buttons.map((button) {
                return PopupMenuItem<IconMenuButton>(
                  value: button,
                  onTap: button.onPressed,
                  child: ListTile(
                    leading: button.icon,
                    title: Text(button.text),
                  ),
                );
              }).toList();
            },
          );
        } else {
          return Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.buttons.map((button) {
                      return IconButton(
                        tooltip: button.text,
                        icon: button.icon,
                        onPressed: button.onPressed,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class IconMenuButton {
  final Icon icon;
  final String text;
  final void Function()? onPressed;

  IconMenuButton({
    required this.icon,
    required this.text,
    this.onPressed,
  });
}
