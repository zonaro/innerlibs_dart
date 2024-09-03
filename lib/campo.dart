import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';

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

typedef CampoDecimal = CampoNumerico<decimal>;

typedef CampoDouble = CampoNumerico<double>;

typedef CampoInteiro = CampoNumerico<int>;

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

class CampoCPFouCNPJ extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChange;
  final bool readOnly;
  final string? label;

  const CampoCPFouCNPJ({
    super.key,
    this.controller,
    this.onChange,
    this.readOnly = false,
    this.label,
  });

  @override
  createState() => _CampoCPFouCNPJState();
}

class CampoData extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final DateTime? initialDate;
  final DateTime? fromDate;
  final DateTime? toDate;
  final void Function(String?)? onChange;
  final IconData? icon;

  const CampoData({
    super.key,
    this.label,
    this.controller,
    this.initialDate,
    this.fromDate,
    this.toDate,
    this.onChange,
    this.icon = Icons.date_range,
  });

  @override
  createState() => _CampoDataState();
}

class CampoEnum<T extends Enum> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
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
    this.controller,
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

  @override
  createState() => _CampoEnumState<T>();
}

class CampoListaCidade extends StatefulWidget {
  final Cidade? value;
  final dynamic nomeEstadoOuUFOuIBGEouRegiao;
  final void Function(Cidade?)? onChanged;
  final String? Function(Cidade?)? validator;
  final String? label;

  const CampoListaCidade({
    super.key,
    this.value,
    this.nomeEstadoOuUFOuIBGEouRegiao,
    this.onChanged,
    this.validator,
    this.label,
  });

  @override
  createState() => _CampoListaCidadeState();
}

class CampoListaEstado extends StatefulWidget {
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
  createState() => _CampoListaEstadoState();
}

class CampoNumerico<T extends num> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(T? newValue)? onChanged;
  final void Function()? onEditingComplete;
  final string? Function(T? newValue)? validator;
  final T? defaultValue;
  final bool readOnly;
  final List<T> options;
  final Color? color;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isAutoComplete;
  final IconData? icon;
  final int? maxLen;
  final List<NumberInputFormatter> inputFormatters;
  final Future<List<T>> Function(string)? asyncItems;

  final String Function(T?)? itemAsString;

  final Widget Function(BuildContext context, T?, bool isSelected)? itemBuilder;
  const CampoNumerico({
    super.key,
    this.label,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.defaultValue,
    this.readOnly = false,
    this.options = const [],
    this.color,
    this.textAlign = TextAlign.right,
    this.focusNode,
    this.autofocus = false,
    this.isAutoComplete = false,
    this.icon,
    this.maxLen,
    this.inputFormatters = const [],
    this.asyncItems,
    this.itemAsString,
    this.itemBuilder,
  });

  @override
  createState() => _CampoNumericoState();
}

class CampoSimNao extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(String?)? onChange;

  const CampoSimNao({
    super.key,
    this.label,
    this.controller,
    this.onChange,
  });

  @override
  createState() => _CampoSimNaoState();
}

class CampoTelefone extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String label;

  const CampoTelefone({
    super.key,
    required this.controller,
    this.onChanged,
    this.label = "",
  });

  @override
  createState() => _CampoTelefoneState();
}

class CampoTipoPessoa extends StatefulWidget {
  final TextEditingController tipoController;
  final TextEditingController? cnpjCpfController;
  final void Function(String?)? onChange;

  const CampoTipoPessoa({
    super.key,
    required this.tipoController,
    this.cnpjCpfController,
    this.onChange,
  });

  @override
  createState() => _CampoTipoPessoaState();
}

class CampoValor<T extends Object> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Iterable<T> options;
  final List<TextInputFormatter> inputFormatters;
  final void Function(T?)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(T?)? validator;
  final int? maxLen;
  final int lines;
  final T? initialValue;
  final bool readOnly;
  final bool isAutoComplete;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? onIconTap;
  final void Function()? onSuffixIconTap;
  final Future<List<T>> Function(String)? asyncItems;
  final Color? color;
  final (String, String) Function(T)? textValueSelector;
  final Widget Function(BuildContext context, T, bool isSelected)? itemBuilder;
  final List<dynamic> Function(T)? searchOn;
  final Duration? debounce;

  const CampoValor({
    super.key,
    this.label,
    this.controller,
    this.options = const [],
    this.inputFormatters = const [],
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.maxLen,
    this.lines = 1,
    this.initialValue,
    this.readOnly = false,
    this.isAutoComplete = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
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
  });

  @override
  createState() => _CampoValorState<T>();
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

class _CampoCPFouCNPJState extends State<CampoCPFouCNPJ> {
  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: widget.label ?? 'CPF/CNPJ',
      controller: widget.controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfOuCnpjFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(),
      validator: (newValue) => Brasil.validarCPFouCNPJ(newValue ?? "") ? null : "CPF ou CNPJ inválido!",
      onChanged: widget.onChange,
      readOnly: widget.readOnly,
    );
  }
}

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingCampos,
      child: DateTimePickerFormField(
        decoration: estiloCampos(widget.label, widget.icon),
        invalidDateMessage: 'Data inválida',
        outOfRangeMessage: "Data fora dos limites",
        initialDate: widget.initialDate ?? DateTime.now(),
        fromDate: widget.fromDate ?? minDate,
        toDate: widget.toDate ?? now.sum(years: 999),
        dateController: widget.controller,
        onChange: widget.onChange,
      ),
    );
  }
}

class _CampoEnumState<T extends Enum> extends State<CampoEnum<T>> {
  String Function(T?) get itemAsString => widget.itemAsString ?? ((e) => e.toString().split(".").last.pascalSplitString);

  @override
  Widget build(BuildContext context) {
    return CampoValor<T>(
      icon: widget.icon,
      maxLen: widget.maxLen,
      label: widget.label,
      controller: widget.controller,
      onChanged: (newValue) {
        if (widget.onChange != null) {
          (widget.onChange)!(changeTo<T>(newValue));
        }
      },
      onEditingComplete: widget.onEditingComplete,
      validator: (v) {
        if (widget.validator != null) {
          return (widget.validator)!(changeTo(v));
        }
        return null;
      },
      initialValue: changeTo(widget.defaultValue),
      readOnly: widget.readOnly,
      textAlign: widget.textAlign,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      options: widget.values,
      textValueSelector: (x) => (itemAsString(x), x.toString()),
    );
  }
}

class _CampoListaCidadeState extends State<CampoListaCidade> {
  @override
  Widget build(BuildContext context) {
    return CampoValor<Cidade>(
      asyncItems: (s) async => (await Brasil.pesquisarCidade(s, widget.nomeEstadoOuUFOuIBGEouRegiao)).toList(),
      validator: widget.validator,
      textValueSelector: (item) => ("${item.nome} - ${item.estado.uf}", item.ibge.toString()),
      searchOn: (item) => [
        item.nome,
        item.ibge,
        item.estado.uf,
      ],
      label: widget.label ?? (isValid(widget.nomeEstadoOuUFOuIBGEouRegiao) ? "Cidade/Estado" : "Cidade"),
      itemBuilder: (context, item, isSelected) {
        isSelected = isSelected || item.ibge == widget.value?.ibge;
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
      initialValue: widget.value,
      onChanged: widget.onChanged,
    );
  }
}

class _CampoListaEstadoState extends State<CampoListaEstado> {
  @override
  Widget build(BuildContext context) {
    return CampoValor<Estado>(
      label: widget.modoCompacto ? "UF" : "Estado",
      itemBuilder: (context, item, isSelected) {
        isSelected = isSelected || item.ibge == widget.estadoValue.ibge;
        if (widget.modoCompacto) {
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
      textValueSelector: (item) => widget.modoCompacto ? (item.uf, item.uf) : (item.nome, item.nome),
      initialValue: widget.estadoValue,
      searchOn: (item) => [item.uf, item.nome, item.ibge],
      options: widget.regiao.estados,
      onChanged: (x) => widget.onChanged(x ?? Estado.naoDefinido),
      icon: widget.icon,
      onIconTap: widget.onIconTap,
    );
  }
}

class _CampoNumericoState<T extends num> extends State<CampoNumerico<T>> {
  @override
  Widget build(BuildContext context) {
    return CampoValor<T>(
      icon: widget.icon,
      maxLen: widget.maxLen,
      keyboardType: TextInputType.numberWithOptions(decimal: T is decimal),
      inputFormatters: widget.inputFormatters.isEmpty ? [NumberInputFormatter()] : widget.inputFormatters,
      label: widget.label,
      controller: widget.controller,
      onChanged: (newValue) {
        if (widget.onChanged != null) {
          widget.onChanged!(changeTo<T>(newValue));
        }
      },
      onEditingComplete: widget.onEditingComplete,
      validator: (v) {
        if (widget.validator != null) {
          return widget.validator!(changeTo(v));
        }
        return null;
      },
      initialValue: changeTo(widget.defaultValue ?? 0),
      readOnly: widget.readOnly,
      isAutoComplete: widget.isAutoComplete,
      options: widget.options,
      color: widget.color,
      textAlign: widget.textAlign,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      asyncItems: widget.asyncItems,
    );
  }
}

class _CampoSimNaoState extends State<CampoSimNao> {
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: widget.label,
      controller: controller,
      options: const ["Sim", "Não"],
      onChanged: widget.onChange,
      validator: (newValue) {
        if (newValue.isBlank) {
          controller.text = "Não";
        }
        return controller.text.flatEqualAny(["Sim", "Não"]) ? null : "Valor inválido";
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    if (controller.text.isBlank) {
      controller.text = "Não";
    }
  }
}

class _CampoTelefoneState extends State<CampoTelefone> {
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: widget.label.isNotEmpty ? widget.label : 'Telefone/Celular',
      controller: controller..text = Brasil.formatarTelefone(controller.text),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: (newValue) {
        var formatado = Brasil.formatarTelefone(newValue);
        if (controller.text != formatado) {
          controller.text = formatado;
        }
        if (widget.onChanged != null) widget.onChanged!(formatado);
      },
      validator: (newValue) {
        if (!Brasil.validarTelefone(newValue)) {
          return "Telefone Inválido";
        }
        return null;
      },
    );
  }

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.text = Brasil.formatarTelefone(controller.text);
    super.initState();
  }
}

class _CampoTipoPessoaState extends State<CampoTipoPessoa> {
  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: 'Tipo',
      controller: widget.tipoController,
      options: const ["Física", "Jurídica", "Outros"],
      validator: ((newValue) {
        if (newValue.isBlank) {
          widget.tipoController.text = "Outros";
        }
        return null;
      }),
      onChanged: widget.onChange,
    );
  }

  @override
  void initState() {
    if (widget.cnpjCpfController != null) {
      if (Brasil.validarCPF(widget.cnpjCpfController!.text)) {
        widget.tipoController.text = "Física";
      } else if (Brasil.validarCNPJ(widget.cnpjCpfController!.text)) {
        widget.tipoController.text = "Jurídica";
      } else {
        widget.tipoController.text = "Outros";
      }
    }
    super.initState();
  }
}

class _CampoValorState<T extends Object> extends State<CampoValor<T>> {
  FocusNode? _focusNode;
  TextEditingController? _controller;
  final ValueNotifier<T?> _dropdownValue = ValueNotifier<T?>(null);

  Timer? _debounce;

  Iterable<T> get options => [_dropdownValue.value, ...widget.options].whereNotNull().distinctBy((x) => textValueSelector(x).$2).toList();

  (String, string) Function(T) get textValueSelector => widget.textValueSelector ?? (e) => (changeTo<string>(e), changeTo<string>(e));

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
                initialValue: _controller!.value,
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
                onSelected: (newValue) {
                  _controller!.text = textValueSelector(newValue).$2;
                  onChanged(newValue);
                },
                displayStringForOption: (v) => textValueSelector(v).$2,
                optionsBuilder: (v) async {
                  return await allOptions(v.text);
                },
                fieldViewBuilder: (context, textEditingController, fn, onFieldSubmitted) {
                  textEditingController.text = _controller!.text;
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
            : field(_focusNode!, _controller!),
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
          compareFn: (item1, item2) => textValueSelector(item1).$2 == textValueSelector(item2).$2,
          popupProps: popupCampos(
            widget.label,
            itemBuilder: itemBuilder,
          ),
          selectedItem: _dropdownValue.value,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: estiloCampos(widget.label, widget.icon, widget.onIconTap, widget.color, widget.suffixIcon, widget.onSuffixIconTap),
          ),
          asyncItems: (v) async => await allOptions(v),
          itemAsString: (x) => textValueSelector(x).$1,
          onChanged: (newValue) {
            if (_dropdownValue.value == newValue || newValue == null) {
              _controller!.text = "";
              _dropdownValue.value = null;
            } else {
              _controller!.text = textValueSelector(newValue).$2;
              _dropdownValue.value = newValue;
            }
            onChanged(newValue);
          },
        ),
      );
    }
  }

  field(FocusNode fn, TextEditingController textEditingController) => TextFormField(
        focusNode: fn,
        textAlign: widget.textAlign,
        maxLength: widget.maxLen,
        controller: textEditingController,
        onChanged: (newValue) async {
          if (widget.onChanged != null) {
            var opt = await allOptions("");
            var item = opt.where((e) => textValueSelector(e).$2 == newValue).firstOrNull;
            onChanged(item);
          }
        },
        onEditingComplete: () {
          _controller!.text = textEditingController.text;
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
        },
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
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
    _controller ??= widget.controller ?? TextEditingController();
    _dropdownValue.value = widget.initialValue;
    if (_controller!.text.isBlank) {
      if (widget.initialValue is string) {
        _controller!.text = changeTo(widget.initialValue);
      } else if (widget.initialValue != null) {
        _controller!.text = textValueSelector(widget.initialValue!).$2;
      }
    } else {
      _dropdownValue.value = options.firstWhereOrNull((e) => textValueSelector(e).$2 == _controller!.text);
    }
    if (_dropdownValue.value == null && isSameType<T, string>() && _controller!.text.isNotBlank) {
      _dropdownValue.value = changeTo(_controller!.text);
    }

    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  Widget itemBuilder(BuildContext context, T item, bool isSelected) {
    isSelected = isSelected || item == _dropdownValue.value || textValueSelector(item).$2 == _controller!.text;
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
      title: Text(textValueSelector(item).$1),
      subtitle: textValueSelector(item).$2 != textValueSelector(item).$1 ? Text(textValueSelector(item).$2) : null,
    );
  }

  void onChanged(T? value) {
    if (widget.onChanged != null) {
      if (widget.debounce == null) {
        widget.onChanged!(value);
      } else {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(widget.debounce!, () async {
          widget.onChanged!(value);
          setState(() {});
        });
      }
    }
  }

  List<dynamic> searchOn(T x) {
    if (widget.searchOn != null) {
      return widget.searchOn!(x);
    }
    return [
      textValueSelector(x).$1,
      textValueSelector(x).$2,
      flatString(x),
      if (T is JsonMap) ...(x as JsonMap).values,
    ];
  }
}
