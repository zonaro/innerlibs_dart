import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

const fieldsPadding = EdgeInsets.all(8);

/// gera os chips que aparecem nas buscas de SELECTs quando nao tem resultados
Widget emptySearch(BuildContext context, string searchEntry, string label) {
  var searches = searchEntry.split(";").where((e) => e.isNotBlank).toList();
  return Expanded(
    child: Center(
      child: ListView(shrinkWrap: true, children: [
        Text(context.translations.couldNotFindItem(label)).toCenter(),
        ...searches.defaultIfEmpty(label).map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(label: e.asText()),
            )),
      ]),
    ),
  );
}

InputDecoration inputStyles([string? label, IconData? icon, void Function()? onIconTap, Color? color, IconData? suffixIcon, void Function()? onSuffixIconTap]) => InputDecoration(
      fillColor: Colors.transparent,
      label: label.asNullableText(),
      icon: icon == null ? null : forceWidget(icon, style: TextStyle(color: color ?? Get.context!.colorScheme.onSurface))?.onTap(onIconTap),
      suffixIcon: suffixIcon == null
          ? null
          : Padding(
              padding: 15.fromRight,
              child: forceWidget(suffixIcon, style: TextStyle(color: color ?? Get.context!.colorScheme.onSurface))?.onTap(onSuffixIconTap),
            ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: color ?? Get.context!.colorScheme.primary, width: 20),
      ),
      filled: true,
    );

PopupProps<T> popupFields<T>(
  BuildContext context,
  string? title, {
  DropdownSearchPopupItemBuilder<T>? itemBuilder,
  IconData? icon,
  void Function()? onIconTap,
  Color? color,
  IconData? suffixIcon,
  void Function()? onSuffixIconTap,
}) {
  var tt = "${context.translations.search} $title:".trim();
  return Get.screenTier < ScreenTier.xs
      ? PopupProps.modalBottomSheet(
          constraints: const BoxConstraints.expand(),
          searchFieldProps: TextFieldProps(decoration: inputStyles(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap)),
          title: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: 6.allAround,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back),
                  const Gap(10),
                  Get.context!.translations.back.asText().fontSize(10),
                ],
              ).toCenter().paddingAll(8),
            ),
          ),
          modalBottomSheetProps: ModalBottomSheetProps(backgroundColor: Get.context?.colorScheme.surfaceBright),
          showSearchBox: true,
          emptyBuilder: (context, search) => emptySearch(context, search, title ?? ""),
          itemBuilder: itemBuilder,
        )
      : PopupProps.menu(
          fit: FlexFit.tight,
          showSearchBox: true,
          emptyBuilder: (context, search) => emptySearch(context, search, title ?? ""),
          itemBuilder: itemBuilder,
          searchFieldProps: TextFieldProps(decoration: inputStyles(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap)),
        );
}

typedef DecimalField = ValueField<decimal>;

typedef DoubleField = ValueField<double>;

typedef IntField = ValueField<int>;

typedef NumField = ValueField<num>;

typedef StringField = ValueField<string>;

class CampoListaCidade extends StatelessWidget {
  final Cidade? value;
  final dynamic nomeEstadoOuUFOuIBGEouRegiao;
  final void Function(Cidade?) onChanged;
  final String? Function(Cidade?)? validator;
  final String? label;

  const CampoListaCidade({
    super.key,
    this.value,
    this.nomeEstadoOuUFOuIBGEouRegiao,
    required this.onChanged,
    this.validator,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ValueField<Cidade>(
      asyncItems: (s) async => (await Brasil.pesquisarCidade(s, nomeEstadoOuUFOuIBGEouRegiao)).toList(),
      validator: validator,
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
    return Padding(
      padding: fieldsPadding,
      child: DateTimePickerFormField(
        decoration: inputStyles(label, icon),
        invalidDateMessage: context.translations.invalidItem(context.translations.date),
        outOfRangeMessage: context.translations.dateOutOfRange,
        value: value ?? now,
        fromDate: fromDate ?? minDate,
        toDate: toDate ?? now.sum(years: 999),
        onChanged: onChanged,
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

class EnumField<T extends Enum> extends StatelessWidget {
  final String? label;

  final void Function(T?)? onChange;
  final void Function()? onEditingComplete;
  final string? Function(T?)? validator;
  final T? defaultValue;
  final bool readOnly;
  final Color? borderColor;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool autofocus;
  final IconData? icon;
  final int? maxLen;
  final List<T> values;
  final string Function(T?)? itemAsString;

  EnumField({
    super.key,
    required this.values,
    this.label,
    this.onChange,
    this.onEditingComplete,
    this.validator,
    this.defaultValue,
    this.readOnly = false,
    this.borderColor,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    this.maxLen,
    this.itemAsString,
  }) {
    if (values.isEmpty) {
      throw "EnumField: values cannot be empty";
    }
  }

  String Function(T?) get itemString => itemAsString ?? ((e) => e.toString().split(".").last.pascalSplitString);

  @override
  Widget build(BuildContext context) {
    return ValueField<T>(
      icon: icon,
      maxLen: maxLen,
      label: label,
      onChanged: (newValue, _) {
        if (onChange != null) {
          onChange!(changeTo<T>(newValue));
        }
      },
      onEditingComplete: onEditingComplete,
      validator: (v) {
        if (validator != null) {
          return (validator)!(changeTo(v));
        }
        return null;
      },
      value: changeTo(defaultValue),
      readOnly: readOnly,
      textAlign: textAlign,
      focusNode: focusNode,
      autofocus: autofocus,
      options: values,
      textValueSelector: (x) => [itemString(x), x.toString()],
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
      label: id.isNotValid ? context.translations.register : context.translations.save,
      icon: id.isNotValid ? Icons.edit : Icons.save,
      onPressed: onPressed,
      heroTag: (T.runtimeType, id, randomInt()),
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
    return FloatingActionButton.extended(
      onPressed: onPressed,
      heroTag: heroTag ?? (label?.hashCode, icon?.hashCode, randomInt()),
      backgroundColor: color,
      label: Row(
        children: [
          Visibility(visible: icon != null, child: Icon(icon)),
          Visibility(visible: icon != null && label.isNotBlank, child: const Gap(10)),
          Visibility(visible: label.isNotBlank, child: label!.asText()),
        ],
      ),
    );
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

class ValueField<T extends Object> extends StatefulWidget {
  final String? label;

  final Iterable<T> options;
  final List<TextInputFormatter> inputFormatters;
  final void Function(T? value, string? valueString) onChanged;
  final void Function()? onEditingComplete;
  final String? Function(T?)? validator;
  final int? maxLen;
  final int lines;
  final T? value;
  final bool readOnly;
  final bool isAutoComplete;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? onIconTap;
  final void Function()? onSuffixIconTap;
  final Future<List<T>> Function(String)? asyncItems;
  final Color? color;
  final List<string> Function(T?)? textValueSelector;
  final Widget Function(BuildContext context, T, bool isSelected)? itemBuilder;
  final List<dynamic> Function(T)? searchOn;
  final Duration? debounce;
  final void Function(string)? onFieldSubmitted;

  const ValueField({
    super.key,
    this.label,
    this.options = const [],
    this.inputFormatters = const [],
    required this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.maxLen,
    this.lines = 1,
    this.value,
    this.readOnly = false,
    this.isAutoComplete = false,
    this.keyboardType,
    this.textAlign,
    this.obscureText = false,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    this.onIconTap,
    this.asyncItems,
    this.color,
    this.textValueSelector,
    this.itemBuilder,
    this.searchOn,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.debounce,
    this.onFieldSubmitted,
  });

  @override
  createState() => ValueFieldState<T>();
}

class ValueFieldState<T extends Object> extends State<ValueField<T>> {
  late FocusNode _focusNode;

  final ValueNotifier<T?> value = ValueNotifier<T?>(null);

  Timer? _debounce;

  late TextInputType keyboardType;
  late TextAlign textAlign;

  late List<TextInputFormatter> inputFormatters;

  Iterable<T> get options => [value.value, ...widget.options].whereNotNull().distinctBy((x) => textValueSelector(x).last).toList();
  StringList Function(T?) get textValueSelector {
    if (widget.textValueSelector == null) {
      if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
        return (e) {
          var vv = NumberFormat(null, platformLocaleCode).format(e);
          return [vv];
        };
      }
      return (e) => [changeTo<string>(e)];
    }
    return widget.textValueSelector!;
  }

  bool get useOptionsList => widget.options.isNotEmpty || widget.asyncItems != null;

  Future<List<T>> allOptions(string v) async {
    List<T> values = widget.options.toList();
    if (widget.asyncItems != null) {
      var asyncOptions = (await widget.asyncItems!(v)).toList();
      values = [...values, ...asyncOptions];
    }
    values = values
        .search(
          searchTerms: v.split(";").whereValid,
          searchOn: searchOn,
          levenshteinDistance: 2,
        )
        .toList();
    return values.distinct().toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAutoComplete || (useOptionsList == false)) {
      return Padding(
        padding: fieldsPadding,
        child: useOptionsList
            ? Autocomplete<T>(
                initialValue: TextEditingValue(text: value.value != null ? textValueSelector(value.value as T).last : ""),
                optionsViewBuilder: (context, onSelected, options) {
                  var opt = options.toList();
                  return Container(
                    color: context.colorScheme.surface,
                    width: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, i) => itemBuilder(
                              context,
                              opt[i],
                              false, //TODO implement disabled
                              value.value != null ? (i == opt.indexOf(value.value!)) : false,
                            ).onTap(() => onSelected(opt[i])),
                        itemCount: opt.length),
                  );
                },
                onSelected: (v) => onChanged(v, textValueSelector(v).last),
                displayStringForOption: (v) => textValueSelector(v).last,
                optionsBuilder: (v) async {
                  return await allOptions(v.text);
                },
                fieldViewBuilder: (context, textEditingController, fn, onFieldSubmitted) {
                  return Focus(
                    focusNode: _focusNode,
                    autofocus: widget.autofocus,
                    onFocusChange: (v) {
                      if (v) {
                        fn.requestFocus();
                      }
                    },
                    child: field(fn, textEditingController),
                  );
                },
              )
            : field(_focusNode),
      );
    } else {
      return Padding(
        padding: fieldsPadding,
        child: DropdownSearch<T>(
          filterFn: (item, filters) =>
              filters.isBlank ||
              FilterFunctions.fullFilterFunction(
                searchTerms: filters.split(";").whereValid,
                searchOn: searchOn(item),
              ),
          compareFn: (item1, item2) => textValueSelector(item1).last == textValueSelector(item2).last,
          popupProps: popupFields(
            context,
            widget.label,
            itemBuilder: itemBuilder,
          ),
          selectedItem: value.value,
          decoratorProps: DropDownDecoratorProps(
            decoration: inputStyles(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
          ),
          items: (v, l) async => await allOptions(v),
          itemAsString: (x) => textValueSelector(x).first,
          onChanged: (newValue) {
            if (value.value == newValue || newValue == null) {
              value.value = null;
            } else {
              value.value = newValue;
            }
            onChanged(newValue, textValueSelector(newValue).last);
          },
        ),
      );
    }
  }

  field(FocusNode fn, [TextEditingController? textEditingController]) => TextFormField(
        focusNode: fn,
        textAlign: textAlign,
        initialValue: textEditingController == null ? (value.value != null ? textValueSelector(value.value as T).last : "") : null,
        maxLength: widget.maxLen,
        controller: textEditingController?..text = value.value != null ? textValueSelector(value.value as T).last : "",
        onChanged: (newValue) async {
          if (useOptionsList) {
            var opt = await allOptions(newValue);
            var item = opt.where((e) => textValueSelector(e).last == newValue).firstOrNull;
            onChanged(item, newValue);
          } else {
            onChanged(newValue.changeTo<T>(), newValue);
          }
        },
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: inputStyles(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
        validator: (s) {
          if (widget.validator != null) {
            try {
              return widget.validator!(s.changeTo<T>());
            } catch (e) {
              return "$e";
            }
          }
          return null;
        },
        maxLines: widget.lines,
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
        textInputAction: TextInputAction.none,
      );

  @override
  void initState() {
    value.value = widget.value;
    if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
      keyboardType = widget.keyboardType ?? TextInputType.numberWithOptions(decimal: T is decimal);
      inputFormatters = widget.inputFormatters.isEmpty ? [NumberInputFormatter()] : widget.inputFormatters;
      textAlign = widget.textAlign ?? TextAlign.end;
    } else {
      keyboardType = widget.keyboardType ?? TextInputType.text;
      inputFormatters = widget.inputFormatters;
      textAlign = widget.textAlign ?? TextAlign.start;
    }

    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  Widget itemBuilder(BuildContext context, T item, bool isDisabled, bool isSelected) {
    isSelected = isSelected || item == value.value;
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(context, item, isSelected);
    }
    return ListTile(
      leading: Visibility(
        visible: isSelected,
        child: Icon(
          Icons.check,
          color: widget.color ?? context.colorScheme.primary,
        ),
      ),
      title: Text(textValueSelector(item).first),
      subtitle: textValueSelector(item).last != textValueSelector(item).first ? Text(textValueSelector(item).last) : null,
    );
  }

  void onChanged(T? value, string? textValue) {
    if (widget.debounce == null) {
      widget.onChanged(value, textValue);
    } else {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(widget.debounce!, () async {
        widget.onChanged(value, textValue);
        setState(() {});
      });
    }
  }

  List<dynamic> searchOn(T x) {
    if (widget.searchOn != null) {
      return widget.searchOn!(x);
    }
    return [
      textValueSelector(x).first,
      textValueSelector(x).last,
      flatString(x),
      if (T is JsonMap) ...(x as JsonMap).values,
    ];
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
      onChanged: (v, _) {
        onChanged(v);
      },
      validator: (newValue) {
        return newValue.flatEqualAny(opt) ? null : context.translations.invalidItem(context.translations.value);
      },
    );
  }
}
