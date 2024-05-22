import 'package:flutter/material.dart';
import 'package:innerlibs/general_extensions.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.onLongPress,
  }) : super(key: key);

  final dynamic label;
  final bool value;
  final bool tristate;
  final void Function(bool? value) onChanged;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    var item = (label as Object?).forceWidget;
    return InkWell(
      onLongPress: onLongPress,
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            tristate: tristate,
            value: value,
            onChanged: onChanged,
          ),
          if (item != null) item
        ],
      ),
    );
  }
}
