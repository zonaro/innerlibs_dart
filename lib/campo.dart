import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/widgets/value_field.dart';

class CampoListaCidade extends StatelessWidget {
  final Cidade? value;
  final dynamic nomeEstadoOuUFOuIBGEouRegiao;
  final void Function(Cidade?) onChanged;
  final String? Function(Cidade?)? validator;
  final String? label;
  final bool readOnly;
  final IconData? icon;

  const CampoListaCidade({
    super.key,
    this.value,
    this.nomeEstadoOuUFOuIBGEouRegiao,
    required this.onChanged,
    this.validator,
    this.label,
    this.readOnly = false,
    this.icon = Icons.location_city,
  });

  @override
  Widget build(BuildContext context) {
    return ValueField<Cidade>(
      icon: icon,
      asyncItems: (s) async => (await Brasil.pesquisarCidade(s, nomeEstadoOuUFOuIBGEouRegiao)).toList(),
      validator: validator,
      readOnly: readOnly,
      textValueSelector: (item) => ["${item?.nome} - ${item?.estado.uf}", item?.ibge.toString()].whereNotNull().toList(),
      searchOn: (item) => [
        item.nome,
        item.ibge,
        item.estado.uf,
      ],
      label: label ?? (isValid(nomeEstadoOuUFOuIBGEouRegiao) ? "Cidade/Estado" : "Cidade"),
      itemBuilder: (context, item, isSelected) {
        isSelected = isSelected || item.ibge == value?.ibge;
        return ListTile(
          leading: Visibility(
            visible: isSelected,
            child: Icon(
              Icons.check,
              color: context.colorScheme.primary,
            ),
          ),
          title: Text(item.nome),
          subtitle: Text("Estado: ${item.estado.nome} | IBGE: ${item.ibge} ${item.capital ? '| Capital' : ""}"),
          trailing: Text(item.estado.uf).fontSize(20),
        );
      },
      value: value,
      onChanged: (v, _) {
        onChanged(v);
      },
    );
  }
}

class CampoListaEstado extends StatelessWidget {
  final Estado estadoValue;
  final void Function(Estado) onChanged;
  final bool modoCompacto;
  final Regiao regiao;
  final void Function()? onIconTap;
  final IconData? icon;

  const CampoListaEstado({
    super.key,
    required this.estadoValue,
    required this.onChanged,
    this.modoCompacto = false,
    this.regiao = Regiao.nacional,
    this.icon,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return ValueField<Estado>(
      label: modoCompacto ? "UF" : "Estado",
      itemBuilder: (context, item, isSelected) {
        isSelected = isSelected || item.ibge == estadoValue.ibge;
        if (modoCompacto) {
          return ListTile(
            title: item.uf.asText().fontSize(15).textColor(isSelected ? context.colorScheme.primary : null),
            subtitle: Text("IBGE: ${item.ibge}").fontSize(10),
          );
        } else {
          return ListTile(
            leading: Visibility(
              visible: isSelected,
              child: Icon(
                Icons.check,
                color: context.colorScheme.primary,
              ),
            ),
            trailing: item.uf.asText().fontSize(20),
            title: item.nome.asText(),
            subtitle: Text("IBGE: ${item.ibge}"),
          );
        }
      },
      textValueSelector: (item) => modoCompacto ? [item?.uf ?? ""] : [item?.nome ?? ""],
      value: estadoValue,
      searchOn: (item) => [item.uf, item.nome, item.ibge],
      options: regiao.estados,
      onChanged: (x, _) => onChanged(x ?? Estado.naoDefinido),
      icon: icon,
      onIconTap: onIconTap,
    );
  }
}

class CampoTelefone extends StatelessWidget {
  final void Function(String?) onChanged;
  final String label;
  final string value;
  final String? Function(String?)? validator;

  const CampoTelefone({
    super.key,
    required this.onChanged,
    this.label = "",
    this.value = "",
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return StringField(
      label: label.isNotEmpty ? label : 'Telefone/Celular',
      value: Brasil.formatarTelefone(value),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: (newValue, _) {
        newValue = Brasil.formatarTelefone(newValue);
        onChanged(newValue);
      },
      validator: (newValue) {
        if (newValue.isNotBlank && !Brasil.validarTelefone(newValue)) {
          return "Telefone Inválido";
        }
        if (validator != null) {
          return validator!(newValue);
        }
        return null;
      },
    );
  }
}

class CampoTipoPessoa extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? value;
  final String? Function(string?)? validator;

  const CampoTipoPessoa({
    super.key,
    required this.onChanged,
    this.value,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return StringField(
      label: 'Tipo',
      options: const ["Física", "Jurídica", "Outros"],
      value: value,
      validator: ((newValue) {
        if (newValue.isBlank) {
          newValue = "Outros";
        }
        if (newValue.flatEqualAny(["Física", "Jurídica", "Outros"])) {
          if (validator != null) {
            return validator!(newValue);
          }
          return null;
        }
        return "Tipo inválido";
      }),
      onChanged: (v, _) {
        onChanged(v);
      },
    );
  }
}

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

class CnpjCpfField extends StatelessWidget {
  final void Function(String?) onChanged;
  final bool readOnly;
  final string? label;
  final string? value;

  const CnpjCpfField({
    super.key,
    required this.onChanged,
    this.readOnly = false,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return StringField(
      label: label ?? 'CPF/CNPJ',
      value: value,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfOuCnpjFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(),
      validator: (newValue) => Brasil.validarCPFouCNPJ(newValue ?? "") ? null : "CPF ou CNPJ inválido!",
      onChanged: (v, _) {
        onChanged(v);
      },
      readOnly: readOnly,
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

class DateField extends StatelessWidget {
  final String? label;

  final DateTime? value;
  final DateTime? fromDate;
  final DateTime? toDate;
  final void Function(DateTime?) onChanged;
  final IconData? icon;

  const DateField({
    super.key,
    this.label,
    this.value,
    this.fromDate,
    this.toDate,
    required this.onChanged,
    this.icon = Icons.date_range,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimePickerFormField(
      decoration: inputStyles(label, icon),
      invalidDateMessage: context.translations.invalidItem(context.translations.date),
      outOfRangeMessage: context.translations.dateOutOfRange,
      value: value ?? now,
      fromDate: fromDate ?? minDate,
      toDate: toDate ?? now.sum(years: 999),
      onChanged: onChanged,
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

class YesNoField extends StatelessWidget {
  final String? label;
  final String? value;

  final void Function(String?) onChanged;

  final bool readOnly;

  const YesNoField({super.key, this.label, required this.onChanged, this.value, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    final opt = [context.translations.yes, context.translations.no];
    return StringField(
      label: label,
      value: value,
      readOnly: readOnly,
      options: opt,
      onChanged: (v, _) => onChanged(v),
      validator: (newValue) => newValue.flatEqualAny(opt) ? null : context.translations.invalidItem(context.translations.value),
    );
  }
}
