import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// A button that clears the current context.
class ClearButton extends StatelessWidget {
  /// Callback when the button is pressed.
  final void Function()? onPressed;

  /// Creates a ClearButton.
  const ClearButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextButtonBase(
      label: context.translations.clear,
      icon: Icons.cleaning_services,
      onPressed: onPressed,
    );
  }
}

/// A base class for context buttons with a label and an icon.
class ContextButtonBase extends StatelessWidget {
  /// The label of the button.
  final String label;

  /// The icon of the button.
  final IconData icon;

  /// The color of the button.
  final Color? color;

  /// Callback when the button is pressed.
  final void Function()? onPressed;

  /// Creates a ContextButtonBase.
  const ContextButtonBase({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? context.colorScheme.primary,
          textStyle: const TextStyle(fontSize: 12),
        ),
        icon: Icon(
          icon,
          color: context.colorScheme.onPrimary,
          size: 15,
        ),
        label: Text(
          label,
          style: TextStyle(color: context.colorScheme.onPrimary),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

/// A button that deletes the current context.
class DeleteButton extends StatelessWidget {
  /// Callback when the button is pressed.
  final void Function()? onPressed;

  /// Creates a DeleteButton.
  const DeleteButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextButtonBase(
      label: context.translations.delete,
      icon: Icons.delete,
      color: Colors.redAccent,
      onPressed: onPressed,
    );
  }
}

/// A floating action button for saving or registering.
class FabSave<T> extends StatelessWidget {
  /// The ID associated with the save action.
  final T? id;

  /// Callback when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a FabSave button.
  const FabSave({
    Key? key,
    required this.id,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabTextBase(
      label: id.isNotValid() ? context.translations.register : context.translations.save,
      icon: id.isNotValid() ? Icons.edit : Icons.save,
      onPressed: onPressed,
      heroTag: (T.runtimeType, id, randomInt()),
    );
  }
}

/// A floating action button for searching.
class FabSearch extends StatelessWidget {
  /// Callback when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a FabSearch button.
  const FabSearch({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabTextBase(
      onPressed: onPressed,
      icon: Icons.search,
      label: context.translations.search,
    );
  }
}

/// A base class for floating action buttons with a label and an icon.
class FabTextBase extends StatelessWidget {
  /// The label of the button.
  final String? label;

  /// The icon of the button.
  final IconData? icon;

  /// The color of the button.
  final Color? color;

  /// Callback when the button is pressed.
  final VoidCallback onPressed;

  /// The hero tag for the button.
  final Object? heroTag;

  /// Creates a FabTextBase button.
  const FabTextBase({
    super.key,
    this.label,
    this.icon,
    this.color,
    this.heroTag,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var parts = [
      if (icon != null) Icon(icon),
      if (icon != null && label.isNotBlank) const Gap(10),
      if (label.isNotBlank) label!.asText(),
    ];

    if (parts.length == 1) {
      return FloatingActionButton(
        onPressed: onPressed,
        heroTag: heroTag ?? (label?.hashCode, icon?.hashCode),
        backgroundColor: color,
        child: parts.first,
      );
    } else {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        heroTag: heroTag ?? (label?.hashCode, icon?.hashCode, randomInt()),
        backgroundColor: color,
        label: Row(children: parts),
      );
    }
  }
}

/// A button that registers the current context.
class RegisterButton extends StatelessWidget {
  /// Callback when the button is pressed.
  final void Function()? onPressed;

  /// Creates a RegisterButton.
  const RegisterButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextButtonBase(
      label: context.translations.register,
      icon: Icons.edit,
      onPressed: onPressed,
    );
  }
}

/// A button that saves the current context.
class SaveButton extends StatelessWidget {
  /// Callback when the button is pressed.
  final void Function()? onPressed;

  /// Creates a SaveButton.
  const SaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextButtonBase(
      icon: Icons.save,
      label: context.translations.save,
      onPressed: onPressed,
    );
  }
}
