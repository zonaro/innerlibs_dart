import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

const paddingCampos = EdgeInsets.all(8);

Widget botaoCadastrar(void Function()? onPressed) => BotaoTexto(label: "Cadastrar", icon: Icons.edit, onPressed: onPressed);

Widget botaoExcluir(void Function()? onPressed) => BotaoTexto(label: 'Excluir', icon: Icons.delete, color: Colors.redAccent, onPressed: onPressed);

Widget botaoLimpar(void Function()? onPressed) => BotaoTexto(label: "Limpar formulário", icon: Icons.cleaning_services, onPressed: onPressed);

Widget botaoSalvar(void Function()? onPressed) => BotaoTexto(
      icon: Icons.save,
      label: 'Salvar',
      onPressed: onPressed,
    );

InputDecoration estiloCampos([string? label, IconData? icon, void Function()? onIconTap, Color? color, IconData? suffixIcon, void Function()? onSuffixIconTap]) => InputDecoration(
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

/// gera os chips que aparecem nas buscas de SELECTs quando nao tem resultados
Widget pesquisaVazia(string searchEntry, string label) {
  var searches = searchEntry.split(";").where((e) => e.isNotBlank).toList();
  return Expanded(
    child: Center(
      child: ListView(shrinkWrap: true, children: [
        const Text("Não foi possivel encontrar: ").toCenter(),
        ...searches.defaultIfEmpty(label).map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(label: e.asText()),
            )),
      ]),
    ),
  );
}

PopupProps<T> popupCampos<T>(
  string? title, {
  Widget Function(BuildContext context, T item, bool isSelected)? itemBuilder,
  IconData? icon,
  void Function()? onIconTap,
  Color? color,
  IconData? suffixIcon,
  void Function()? onSuffixIconTap,
}) {
  var tt = "Pesquisar $title:".trim();
  return Get.screenTier < ScreenTier.xs
      ? PopupProps.modalBottomSheet(
          constraints: const BoxConstraints.expand(),
          searchFieldProps: TextFieldProps(decoration: estiloCampos(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap)),
          title: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: 6.allAround,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back),
                  const Gap(10),
                  Get.context!.localizations.backButtonTooltip.asText().fontSize(10),
                ],
              ).toCenter().paddingAll(8),
            ),
          ),
          modalBottomSheetProps: ModalBottomSheetProps(backgroundColor: Get.context?.colorScheme.surfaceBright),
          showSearchBox: true,
          emptyBuilder: (context, search) => pesquisaVazia(search, title ?? ""),
          itemBuilder: itemBuilder,
        )
      : PopupProps.menu(
          fit: FlexFit.tight,
          showSearchBox: true,
          emptyBuilder: (context, search) => pesquisaVazia(search, title ?? ""),
          itemBuilder: itemBuilder,
          searchFieldProps: TextFieldProps(decoration: estiloCampos(tt, icon, onIconTap, color, suffixIcon, onSuffixIconTap)),
        );
}

typedef CampoDecimal = CampoValor<decimal>;

typedef CampoDouble = CampoValor<double>;

typedef CampoInteiro = CampoValor<int>;
typedef CampoNumerico = CampoValor<num>;
typedef CampoNumero = CampoValor<num>;

typedef CampoTexto = CampoValor<string>;

class BotaoTexto extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final void Function()? onPressed;

  const BotaoTexto({
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
          backgroundColor: color ?? Get.context?.colorScheme.primary,
          textStyle: const TextStyle(fontSize: 12),
        ),
        icon: Icon(
          icon,
          color: Get.context?.colorScheme.onPrimary,
          size: 15,
        ),
        label: Text(
          label,
          style: TextStyle(color: Get.context?.colorScheme.onPrimary),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CampoCPFouCNPJ extends StatelessWidget {
  final void Function(String?) onChanged;
  final bool readOnly;
  final string? label;
  final string? value;

  const CampoCPFouCNPJ({
    super.key,
    required this.onChanged,
    this.readOnly = false,
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
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

class CampoData extends StatelessWidget {
  final String? label;

  final DateTime? value;
  final DateTime? fromDate;
  final DateTime? toDate;
  final void Function(DateTime?) onChanged;
  final IconData? icon;

  const CampoData({
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
      padding: paddingCampos,
      child: DateTimePickerFormField(
        decoration: estiloCampos(label, icon),
        invalidDateMessage: 'Data inválida',
        outOfRangeMessage: "Data fora dos limites",
        value: value ?? DateTime.now(),
        fromDate: fromDate ?? minDate,
        toDate: toDate ?? now.sum(years: 999),
        onChanged: onChanged,
      ),
    );
  }
}

class CampoEnum<T extends Enum> extends StatelessWidget {
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

  CampoEnum({
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
      throw "CampoEnum: values não pode ser vazio";
    }
  }

  String Function(T?) get itemString => itemAsString ?? ((e) => e.toString().split(".").last.pascalSplitString);

  @override
  Widget build(BuildContext context) {
    return CampoValor<T>(
      icon: icon,
      maxLen: maxLen,
      label: label,
      // controller: widget.controller,
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
    return CampoValor<Cidade>(
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
    return CampoValor<Estado>(
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

class CampoSimNao extends StatelessWidget {
  final String? label;
  final String? value;

  final void Function(String?) onChanged;

  const CampoSimNao({super.key, this.label, required this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: label,
      value: value,
      options: const ["Sim", "Não"],
      onChanged: (v, _) {
        onChanged(v);
      },
      validator: (newValue) {
        return newValue.flatEqualAny(["Sim", "Não"]) ? null : "Valor inválido";
      },
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
    return CampoTexto(
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
    return CampoTexto(
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

class CampoValor<T extends Object> extends StatefulWidget {
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

  const CampoValor({
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
  createState() => CampoValorState<T>();
}

class CampoValorState<T extends Object> extends State<CampoValor<T>> {
  late FocusNode _focusNode;

  final ValueNotifier<T?> _dropdownValue = ValueNotifier<T?>(null);

  Timer? _debounce;

  late TextInputType keyboardType;
  late TextAlign textAlign;

  late List<TextInputFormatter> inputFormatters;

  Iterable<T> get options => [_dropdownValue.value, ...widget.options].whereNotNull().distinctBy((x) => textValueSelector(x).last).toList();
  strings Function(T?) get textValueSelector {
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
        padding: paddingCampos,
        child: useOptionsList
            ? Autocomplete<T>(
                initialValue: TextEditingValue(text: _dropdownValue.value != null ? textValueSelector(_dropdownValue.value as T).last : ""),
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
                              _dropdownValue.value != null ? (i == opt.indexOf(_dropdownValue.value!)) : false,
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
        padding: paddingCampos,
        child: DropdownSearch<T>(
          filterFn: (item, filters) =>
              filters.isBlank ||
              FilterFunctions.fullFilterFunction(
                searchTerms: filters.split(";").whereValid,
                searchOn: searchOn(item),
              ),
          compareFn: (item1, item2) => textValueSelector(item1).last == textValueSelector(item2).last,
          popupProps: popupCampos(
            widget.label,
            itemBuilder: itemBuilder,
          ),
          selectedItem: _dropdownValue.value,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: estiloCampos(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
          ),
          asyncItems: (v) async => await allOptions(v),
          itemAsString: (x) => textValueSelector(x).first,
          onChanged: (newValue) {
            if (_dropdownValue.value == newValue || newValue == null) {
              _dropdownValue.value = null;
            } else {
              _dropdownValue.value = newValue;
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
        initialValue: textEditingController == null ? (_dropdownValue.value != null ? textValueSelector(_dropdownValue.value as T).last : "") : null,
        maxLength: widget.maxLen,
        controller: textEditingController?..text = _dropdownValue.value != null ? textValueSelector(_dropdownValue.value as T).last : "",
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
        decoration: estiloCampos(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
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
    _dropdownValue.value = widget.value;
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

  Widget itemBuilder(BuildContext context, T item, bool isSelected) {
    isSelected = isSelected || item == _dropdownValue.value;
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

class FabSalvar<T> extends StatelessWidget {
  final T? id;
  final VoidCallback onPressed;

  const FabSalvar({
    Key? key,
    required this.id,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabTexto(
      label: id.isNotValid ? "Cadastrar" : "Salvar",
      icon: id.isNotValid ? Icons.edit : Icons.save,
      onPressed: onPressed,
    );
  }
}

class FabTexto extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color? color;
  final VoidCallback onPressed;

  const FabTexto({
    Key? key,
    this.label,
    this.icon,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: color ?? Get.context?.colorScheme.primary,
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
