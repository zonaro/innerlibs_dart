import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ClearButton extends StatelessWidget {
  final void Function()? onPressed;

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

class ContextButtonBase extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final void Function()? onPressed;

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

class DeleteButton extends StatelessWidget {
  final void Function()? onPressed;

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

class FabSave<T> extends StatelessWidget {
  final T? id;
  final VoidCallback onPressed;

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

class FabSearch extends StatelessWidget {
  final VoidCallback onPressed;

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

class FabTextBase extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color? color;
  final VoidCallback onPressed;
  final Object? heroTag;

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

class RegisterButton extends StatelessWidget {
  final void Function()? onPressed;

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

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;

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
