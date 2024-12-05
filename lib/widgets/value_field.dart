import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

/// gera os chips que aparecem nas buscas de SELECTs quando nao tem resultados
Widget emptySearch(BuildContext context, string searchEntry, string label) {
  var searches = searchEntry.split(";").whereNotBlank.toList();
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

InputDecoration inputStyles([string? label, IconData? icon, void Function()? onIconTap, Color? color, dynamic suffixIcon, void Function()? onSuffixIconTap]) => InputDecoration(
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
  final double? max;
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
    this.max,
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
      max: max,
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

class ValueField<T> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;

  final Iterable<T> options;
  final List<TextInputFormatter> inputFormatters;
  final void Function(T? value, string? valueString) onChanged;
  final void Function()? onEditingComplete;
  final String? Function(T?)? validator;
  final double? max;
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
  final dynamic suffixIcon;
  final void Function()? onIconTap;
  final void Function()? onSuffixIconTap;
  final Future<List<T>> Function(String)? asyncItems;
  final Color? color;
  final List<string> Function(T?)? textValueSelector;
  final Widget Function(BuildContext context, T, bool isSelected)? itemBuilder;
  final List<dynamic> Function(T)? searchOn;
  final Duration? debounce;
  final void Function(string)? onFieldSubmitted;

  final bool Function(T a, T b)? equalityFunction;
  final int Function(T a, T b)? comparatorFunction;

  const ValueField({
    super.key,
    required this.onChanged,
    this.label,
    this.options = const [],
    this.inputFormatters = const [],
    this.onEditingComplete,
    this.validator,
    this.max,
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
    this.controller,
    this.equalityFunction,
    this.comparatorFunction,
  });

  @override
  createState() => ValueFieldState<T>();
}

class ValueFieldState<T> extends State<ValueField<T>> {
  late FocusNode _focusNode;

  late TextEditingController _textController;

  final ValueNotifier<T?> _value = ValueNotifier<T?>(null);

  Timer? _debounce;

  late TextInputType _keyboardType;
  late TextAlign _textAlign;

  late List<TextInputFormatter> _inputFormatters;

  int? _maxLen;

  Iterable<T> get options {
    List<T> opts = [];
    if (_value.value != null) {
      opts.add(_value.value as T);
    }
    opts.addAll(widget.options);

    return opts.distinctByComparison(equalityFunction);
  }

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

  string textSelector(T? e) => textValueSelector(e).firstOrNull??"";
    string valueSelector(T? e) => textValueSelector(e).lastOrNull??"";


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
    _maxLenByType();

    if (widget.isAutoComplete || (useOptionsList == false)) {
      return useOptionsList
          ? TypeAheadField<T>(
              controller: _textController,
              focusNode: _focusNode,
              itemBuilder: (context, item) {
                return itemBuilder(
                  context,
                  item,
                  false,
                  _value.value == null ? false : equalityFunction(_value.value as T, item),
                );
              },
              onSelected: (v) => onChanged(v, textValueSelector(v).last),
              // displayStringForOption: (v) => textValueSelector(v).last,

              suggestionsCallback: (v) async => await allOptions(v),
              builder: (context, controller, fn) => field(fn, controller),
            )
          : field(_focusNode, _textController);
    } else {
      return DropdownSearch<T>(
        filterFn: (item, filters) =>
            filters.isBlank ||
            Get.fullFilterFunction(
              searchTerms: filters.split(";").whereNotBlank,
              searchOnItems: searchOn(item),
            ),
        enabled: !widget.readOnly,
        compareFn: (a, b) => equalityFunction(a, b),
        popupProps: popupFields(
          context,
          widget.label,
          itemBuilder: itemBuilder,
        ),
        selectedItem: _value.value,
        decoratorProps: DropDownDecoratorProps(
          decoration: inputStyles(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
        ),
        items: (v, l) async => await allOptions(v),
        itemAsString: (x) => textValueSelector(x).first,
        onChanged: (newValue) {
          if (_value.value == newValue || newValue == null) {
            _value.value = null;
          } else {
            _value.value = newValue;
          }
          onChanged(newValue, textValueSelector(newValue).last);
        },
      );
    }
  }

  int comparatorFunction(T a, T b) {
    if (widget.comparatorFunction != null) {
      return widget.comparatorFunction!(a, b);
    } else if (T is Comparable) {
      return (a as Comparable).compareTo(b);
    }
    return textValueSelector(a).last.compareTo(textValueSelector(b).last);
  }

  bool equalityFunction(T a, T b) {
    if (widget.equalityFunction != null) {
      return widget.equalityFunction!(a, b);
    } else if (T is Comparable) {
      return comparatorFunction(a, b) == 0;
    }
    return textValueSelector(a).last == textValueSelector(b).last;
  }

  field(FocusNode fn, TextEditingController textEditingController) => TextFormField(
        focusNode: fn,
        textAlign: _textAlign,
        maxLength: _maxLen,
        controller: textEditingController..text = _value.value != null ? textValueSelector(_value.value as T).last : "",
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
        inputFormatters: _inputFormatters,
        keyboardType: _keyboardType,
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
    this._textController = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _value.value = widget.value;

    if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
      _keyboardType = widget.keyboardType ?? TextInputType.numberWithOptions(decimal: T is decimal);
      _inputFormatters = widget.inputFormatters.isEmpty ? [NumberInputFormatter()] : widget.inputFormatters;
      _textAlign = widget.textAlign ?? TextAlign.end;
    } else {
      _keyboardType = widget.keyboardType ?? TextInputType.text;
      _inputFormatters = widget.inputFormatters;
      _textAlign = widget.textAlign ?? TextAlign.start;
    }

    super.initState();
  }

  Widget itemBuilder(BuildContext context, T item, bool isDisabled, bool isSelected) {
    isSelected = (isSelected || item == _value.value) && !isDisabled;
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(context, item, isSelected);
    }
    return ListTile(
      enabled: !isDisabled,
      selected: isSelected,
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
    if (widget.max != null && widget.max! > 0) {
      if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
        value = (value as num).clampMax(widget.max!) as T;
      }
      textValue = textValue?.first(_maxLen!);
      this._textController.text = textValue!;
    }

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

  void _maxLenByType() {
    if (widget.max != null && widget.max! > 0) {
      if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
        _maxLen = widget.max.toString().length;
      } else {
        _maxLen = widget.max!.ceil();
      }
    }
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
