import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

InputDecoration outlineInputStyle([string? label, IconData? icon, void Function()? onIconTap, Color? color, dynamic suffixIcon, void Function()? onSuffixIconTap, InputDecoration? other]) {
  other = other ?? const InputDecoration();
  return other.copyWith(
    fillColor: Colors.transparent,
    label: label.asNullableText(),
    icon: icon == null ? null : forceWidget(icon, style: TextStyle(color: color ?? Get.context!.colorScheme.onSurface))?.onTap(onIconTap),
    suffixIcon: suffixIcon == null ? null : forceWidget(suffixIcon, style: TextStyle(color: color ?? Get.context!.colorScheme.onSurface))?.onTap(onSuffixIconTap),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: color ?? Get.context!.colorScheme.primary, width: 20),
    ),
    filled: true,
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
  final bool isAutoComplete;
  final bool useIbge;
  final int minChars = 0;
  final int levenshteinDistance = 2;

  const CampoListaCidade({
    super.key,
    this.value,
    this.nomeEstadoOuUFOuIBGEouRegiao,
    required this.onChanged,
    this.validator,
    this.label,
    this.readOnly = false,
    this.icon = Icons.location_city,
    this.isAutoComplete = false,
    this.useIbge = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueField<Cidade>(
      icon: icon,
      asyncItems: (s) async {
        var l = (await Brasil.pesquisarCidade(s, nomeEstadoOuUFOuIBGEouRegiao, minChars, levenshteinDistance)).toList();
        return l;
      },
      validator: validator,
      readOnly: readOnly,
      textValueSelector: (item) => ["${item?.nome} - ${item?.estado.uf}", useIbge ? item?.ibge.toString() : null].whereNotNull().toList(),
      searchOn: (item) => [
        item.nome,
        item.ibge,
        item.estado.uf,
      ],
      label: label ?? (isValid(nomeEstadoOuUFOuIBGEouRegiao) ? "Cidade" : "Cidade/Estado"),
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
      onChanged: (v, _) => onChanged(v),
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
      decoration: outlineInputStyle(label, icon),
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

  final int levenshteinDistance;

  final TextInputAction? textInputAction;

  final InputDecoration? decoration;

  final Widget Function(BuildContext context, string searchEntry, string label)? emptySearch;

  const ValueField({
    super.key,
    required this.onChanged,
    this.label,
    this.levenshteinDistance = 2,
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
    this.textInputAction,
    this.emptySearch,
    this.decoration,
  });

  @override
  createState() => ValueFieldState<T>();
}

class ValueFieldState<T> extends State<ValueField<T>> {
  late FocusNode _focusNode;

  late TextEditingController _textController;

  T? _value;

  Timer? _debounce;

  late TextInputType _keyboardType;

  late TextAlign _textAlign;

  late List<TextInputFormatter> _inputFormatters;
  int? _maxLen;

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
          searchTerms: v,
          searchOn: searchOn,
          levenshteinDistance: widget.levenshteinDistance,
        )
        .toList();

    return values;
  }

  @override
  Widget build(BuildContext context) {
    _maxLenByType();

    if (widget.isAutoComplete || (useOptionsList == false)) {
      return useOptionsList
          ? TypeAheadField<T>(
              controller: _textController,
              focusNode: _focusNode,
              emptyBuilder: (context) => emptySearch(context, _textController.text, widget.label ?? ""),
              hideOnEmpty: emptySearch(context, _textController.text, widget.label ?? "") is Nil,
              itemBuilder: (context, item) => itemBuilder(
                context,
                item,
                false,
                _value == null ? false : equalityFunction(_value as T, item),
              ),
              onSelected: (v) => onChanged(v, valueSelector(v)),
              suggestionsCallback: (v) async => await allOptions(v),
              builder: (context, controller, fn) => field(fn, controller),
            )
          : field(_focusNode, _textController);
    } else {
      return DropdownSearch<T>(
        filterFn: (item, filters) =>
            filters.isBlank ||
            Get.fullFilterFunction(
              searchTerms: filters,
              searchOnItems: searchOn(item),
            ),
        enabled: !widget.readOnly,
        compareFn: (a, b) => equalityFunction(a, b),
        popupProps: popupFields(
          context,
          widget.label,
          itemBuilder: itemBuilder,
        ),
        selectedItem: _value,
        decoratorProps: DropDownDecoratorProps(
          decoration: outlineInputStyle(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap, widget.decoration),
        ),
        items: (v, l) async => await allOptions(v),
        itemAsString: (x) => textSelector(x),
        onChanged: (newValue) {
          if (newValue == null || (_value != null && equalityFunction(_value as T, newValue))) {
            _value = null;
          } else {
            _value = newValue;
          }
          onChanged(newValue, valueSelector(newValue));
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
    return valueSelector(a).compareTo(valueSelector(b));
  }

  /// gera os chips que aparecem nas buscas de SELECTs quando nao tem resultados
  Widget emptySearch(BuildContext context, string searchEntry, string label) {
    if (widget.emptySearch != null) {
      return widget.emptySearch!(context, searchEntry, label);
    } else {
      return SizedBox(
        width: context.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AutoSizeText(context.translations.couldNotFindItemWith(label, searchEntry.quote), maxLines: 2),
          ),
        ),
      );
    }
  }

  bool equalityFunction(T a, T b) {
    if (widget.equalityFunction != null) {
      return widget.equalityFunction!(a, b);
    } else if (T is Comparable) {
      return comparatorFunction(a, b) == 0;
    }
    return valueSelector(a) == valueSelector(b);
  }

  field(FocusNode fn, TextEditingController textEditingController) => TextFormField(
        focusNode: fn,
        textAlign: _textAlign,
        maxLength: _maxLen,
        controller: textEditingController..text = _value != null ? valueSelector(_value as T) : "",
        onChanged: (newValue) async {
          if (useOptionsList) {
            var opt = await allOptions(newValue);
            var item = opt.firstWhereOrNull((e) => valueSelector(e) == newValue);
            onChanged(item, newValue);
          } else {
            onChanged(newValue.changeTo<T>(), newValue);
          }
        },
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: _inputFormatters,
        keyboardType: _keyboardType,
        decoration: outlineInputStyle(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap, widget.decoration),
        validator: (s) {
          if (widget.validator != null) {
            try {
              return widget.validator!(changeTo<T>(s));
            } catch (e) {
              return "$e";
            }
          }
          return null;
        },
        maxLines: widget.lines,
        readOnly: widget.readOnly,
        obscureText: widget.obscureText,
        textInputAction: widget.textInputAction,
      );

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _value = widget.value;
    this._textController = widget.controller ?? TextEditingController();
    if (_value != null) {
      this._textController.text = valueSelector(_value as T);
    }

    if (isSameType<T, num>() || isSameType<T, double>() || isSameType<T, int>()) {
      _keyboardType = widget.keyboardType ?? TextInputType.numberWithOptions(decimal: isSameType<T, decimal>());
      _inputFormatters = widget.inputFormatters.isEmpty ? [NumberInputFormatter()] : widget.inputFormatters;
      _textAlign = widget.textAlign ?? TextAlign.end;
    } else {
      _keyboardType = widget.keyboardType ?? TextInputType.text;
      _inputFormatters = widget.inputFormatters;
      _textAlign = widget.textAlign ?? TextAlign.start;
    }
  }

  Widget itemBuilder(BuildContext context, T item, bool isDisabled, bool isSelected) {
    isSelected = !isDisabled && (isSelected || (_value != null && equalityFunction(item, _value as T)));
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(context, item, isSelected);
    } else {
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
        title: Text(textSelector(item)),
        subtitle: valueSelector(item) != textSelector(item) ? Text(valueSelector(item)) : null,
      );
    }
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

  PopupProps<T> popupFields(
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
    return Get.screenTier < ScreenTier.sm
        ? PopupProps.modalBottomSheet(
            constraints: const BoxConstraints.expand(),
            searchFieldProps: TextFieldProps(decoration: outlineInputStyle(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap, widget.decoration)),
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
            searchFieldProps: TextFieldProps(decoration: outlineInputStyle(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap, widget.decoration)),
          );
  }

  List<dynamic> searchOn(T x) {
    if (widget.searchOn != null) {
      return widget.searchOn!(x);
    }
    return [
      textSelector(x),
      valueSelector(x),
      flatString(x),
      if (T is JsonMap) ...(x as JsonMap).values,
    ];
  }

  string textSelector(T? e) => textValueSelector(e).firstOrNull ?? "";

  string valueSelector(T? e) => textValueSelector(e).lastOrNull ?? "";

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
