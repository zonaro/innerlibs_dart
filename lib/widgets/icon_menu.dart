import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class IconMenu extends StatefulWidget {
  final List<IconMenuItem> buttons;
  final double? maxWidth;
  final Color? color;
  const IconMenu({Key? key, required this.buttons, this.maxWidth, this.color}) : super(key: key);

  @override
  createState() => _IconMenuState();
}

class _IconMenuState extends State<IconMenu> {
  @override
  Widget build(BuildContext context) {
    var iconSize = context.theme.iconTheme.size ?? 24.0;

    var adaptedSize = 40.0 * (iconSize / 24.0);

    Color? color = widget.color ?? context.theme.iconTheme.color;

    var fullsize = widget.buttons.length * (adaptedSize);
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxWidth = widget.maxWidth ?? constraints.maxWidth;

        if (widget.buttons.isEmpty) {
          return   nil;
        }
        if (widget.buttons.length == 1) {
          var button = widget.buttons.first;
          if (button is IconMenuButton) {
            if (button.extended) {
              return TextButton.icon(
                icon: Icon(
                  button.icon,
                  color: button.color ?? color,
                  size: iconSize,
                ),
                label: Text(button.text),
                onPressed: button.onPressed,
              );
            } else {
              return IconButton(
                tooltip: button.text,
                icon: Icon(
                  button.icon,
                  color: button.color ?? color,
                  size: iconSize,
                ),
                onPressed: button.onPressed,
              );
            }
          } else if (button is IconMenuDivider) {
            return   nil;
          } else {
            throw Exception("Invalid IconMenuItem type");
          }
        }

        consoleLog("fullsize: $fullsize, width: $maxWidth");
        if (fullsize > maxWidth) {
          return PopupMenuButton<IconMenuItem>(
            icon: Icon(
              Icons.menu,
              size: iconSize,
              color: color,
            ),
            itemBuilder: (context) {
              return [
                for (var button in widget.buttons)
                  if (button is IconMenuDivider)
                    const PopupMenuDivider()
                  else if (button is IconMenuButton)
                    PopupMenuItem<IconMenuButton>(
                      value: button,
                      onTap: button.onPressed,
                      child: ListTile(
                        leading: Icon(
                          button.icon,
                          color: button.color ?? color,
                          size: iconSize,
                        ),
                        title: Text(button.text).textColor(button.color ?? color),
                      ),
                    )
                  else
                    throw Exception("Invalid IconMenuItem type")
              ];
            },
          );
        } else {
          return Row(
            children: widget.buttons.map((button) {
              if (button is IconMenuDivider) {
                return createDivider(adaptedSize, button, color);
              } else if (button is IconMenuButton) {
                return createIconButton(button, color, iconSize);
              } else {
                throw Exception("Invalid IconMenuItem type");
              }
            }).toList(),
          );
        }
      },
    );
  }

  Container createDivider(double adaptedSize, IconMenuDivider button, Color? color) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: adaptedSize,
      width: 1,
      color: button.color ?? color,
    );
  }

  Widget createIconButton(IconMenuButton button, Color? color, double iconSize) {
    if (button.extended) {
      return TextButton.icon(
        icon: Icon(
          button.icon,
          color: button.color ?? color,
          size: iconSize,
        ),
        label: Text(button.text).textColor(button.color ?? color),
        onPressed: button.onPressed,
      );
    } else {
      return IconButton(
        tooltip: button.text,
        icon: Icon(
          button.icon,
          color: button.color ?? color,
          size: iconSize,
        ),
        onPressed: button.onPressed,
      );
    }
  }
}

abstract class IconMenuItem {
  final Color? color;

  IconMenuItem({this.color});
}

class IconMenuDivider extends IconMenuItem {
  @override
  IconMenuDivider({super.color});
}

class IconMenuButton extends IconMenuItem {
  final IconData icon;
  final String text;
  final bool extended;
  final bool enabled;
  final void Function()? onPressed;
  final List<IconMenuItem> subMenu;

  IconMenuButton({
    required this.icon,
    required this.text,
    this.extended = false,
    this.enabled = true,
    this.onPressed,
    super.color,
    this.subMenu = const [],
  });
}
