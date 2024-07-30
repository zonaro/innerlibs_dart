library campo;

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';

const paddingCampos = EdgeInsets.all(8);

class CampoListaCidade extends StatefulWidget {
  final Cidade? cidadeValue;
  final dynamic nomeEstadoOuUFOuIBGEouRegiao;
  final void Function(Cidade?)? onChanged;
  final String? Function(Cidade?)? validator;
  final String? label;

  const CampoListaCidade({
    super.key,
    this.cidadeValue,
    this.nomeEstadoOuUFOuIBGEouRegiao,
    this.onChanged,
    this.validator,
    this.label,
  });

  @override
  createState() => _CampoListaCidadeState();
}

class _CampoListaCidadeState extends State<CampoListaCidade> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingCampos,
      child: DropdownSearch<Cidade>(
        asyncItems: (s) async => (await Brasil.pesquisarCidade(s, widget.nomeEstadoOuUFOuIBGEouRegiao)).toList(),
        validator: widget.validator,
        compareFn: (item1, item2) => item1.ibge == item2.ibge,
        itemAsString: (item) => "${item.nome} - ${item.estado.uf}",
        filterFn: (item, filters) =>
            filters.isBlank ||
            FilterFunctions.fullFilterFunction(searchTerms: <dynamic>[
              ...filters.split(";").whereValid
            ], searchOn: [
              item.ibge,
              item.estado.uf,
              item.nome,
              filters.flatEqual('capital') && item.capital ? filters : "",
            ]),
        popupProps: popupCampos(
          context,
          widget.label ?? (isValid(widget.nomeEstadoOuUFOuIBGEouRegiao) ? "Cidade/Estado" : "Cidade"),
          itemBuilder: (context, item, isSelected) {
            isSelected = isSelected || item.ibge == widget.cidadeValue?.ibge;
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
        ),
        selectedItem: widget.cidadeValue,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: estiloCampos(context, widget.label ?? (isValid(widget.nomeEstadoOuUFOuIBGEouRegiao) ? "Cidade/Estado" : "Cidade"), Icons.map),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
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

class _CampoSimNaoState extends State<CampoSimNao> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    if (controller.text.isBlank) {
      controller.text = "Não";
    }
  }

  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: widget.label,
      controller: controller,
      options: const ["Sim", "Não"],
      onChange: widget.onChange,
      validator: (newValue) {
        if (newValue.isBlank) {
          controller.text = "Não";
        }
        return controller.text.flatEqualAny(["Sim", "Não"]) ? null : "Valor inválido";
      },
    );
  }
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

class _CampoTipoPessoaState extends State<CampoTipoPessoa> {
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
      onChange: widget.onChange,
    );
  }
}

class CampoTelefone extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChange;
  final String label;

  const CampoTelefone({
    super.key,
    required this.controller,
    this.onChange,
    this.label = "",
  });

  @override
  createState() => _CampoTelefoneState();
}

class _CampoTelefoneState extends State<CampoTelefone> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.text = Brasil.formatarTelefone(controller.text);
    super.initState();
  }

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
      onChange: (newValue) {
        var formatado = Brasil.formatarTelefone(newValue);
        if (controller.text != formatado) {
          controller.text = formatado;
        }
        widget.onChange?.call(formatado);
      },
      validator: (newValue) {
        if (!Brasil.validarTelefone(newValue)) {
          return "Telefone Inválido";
        }
        return null;
      },
    );
  }
}

class CampoListaEstado extends StatefulWidget {
  final Estado estadoValue;
  final void Function(Estado) onChanged;
  final bool modoCompacto;
  final Regiao regiao;

  const CampoListaEstado({
    super.key,
    required this.estadoValue,
    required this.onChanged,
    this.modoCompacto = false,
    this.regiao = Regiao.nacional,
  });

  @override
  createState() => _CampoListaEstadoState();
}

class _CampoListaEstadoState extends State<CampoListaEstado> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingCampos,
      child: DropdownSearch<Estado>(
        compareFn: (item1, item2) => item1.ibge == item2.ibge,
        dropdownButtonProps: DropdownButtonProps(isVisible: widget.modoCompacto == false),
        popupProps: popupCampos(
          context,
          widget.modoCompacto ? "UF" : "Estado",
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
        ),
        itemAsString: (item) => widget.modoCompacto ? item.uf : item.nome,
        clearButtonProps: const ClearButtonProps(icon: Icon(Icons.clear_all), isVisible: true),
        selectedItem: widget.estadoValue,
        items: widget.regiao.estados.toList(),
        onChanged: (x) => widget.onChanged(x ?? Estado.naoDefinido),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: estiloCampos(context, widget.modoCompacto ? "UF" : "Estado"),
        ),
      ),
    );
  }
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

class _CampoDataState extends State<CampoData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingCampos,
      child: DateTimePickerFormField(
        decoration: estiloCampos(context, widget.label, widget.icon),
        invalidDateMessage: 'Data inválida',
        outOfRangeMessage: "Data fora dos limites",
        initialDate: widget.initialDate ?? DateTime.now(),
        fromDate: widget.fromDate ?? minDate,
        toDate: widget.toDate ?? now.sum(years: 100),
        dateController: widget.controller,
        onChange: widget.onChange,
      ),
    );
  }
}

typedef CampoDecimal = CampoNumerico<decimal>;
typedef CampoInteiro = CampoNumerico<int>;

class CampoNumerico<T extends num> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(T? newValue)? onChange;
  final void Function()? onEditingComplete;
  final string? Function(T? newValue)? validator;
  final T? defaultValue;
  final bool readOnly;
  final List<(string, T)> options;
  final Color? borderColor;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isAutoComplete;
  final IconData? icon;
  final int? maxLen;
  final List<NumberInputFormatter> inputFormatters;

  const CampoNumerico({
    super.key,
    this.label,
    this.controller,
    this.onChange,
    this.onEditingComplete,
    this.validator,
    this.defaultValue,
    this.readOnly = false,
    this.options = const [],
    this.borderColor,
    this.textAlign = TextAlign.right,
    this.focusNode,
    this.autofocus = false,
    this.isAutoComplete = false,
    this.icon,
    this.maxLen,
    this.inputFormatters = const [],
  });

  @override
  createState() => _CampoDecimalState();
}

class _CampoDecimalState<T extends num> extends State<CampoNumerico<T>> {
  @override
  Widget build(BuildContext context) {
    return CampoValor<T>(
      icon: widget.icon,
      maxLen: widget.maxLen,
      keyboardType: TextInputType.numberWithOptions(decimal: T is decimal),
      inputFormatters: widget.inputFormatters.isEmpty ? [NumberInputFormatter()] : widget.inputFormatters,
      label: widget.label,
      controller: widget.controller,
      onChange: (newValue) {
        if (widget.onChange != null) {
          widget.onChange!(parseTo<T>(newValue?.$2));
        }
      },
      onEditingComplete: widget.onEditingComplete,
      validator: (v) {
        if (widget.validator != null) {
          return widget.validator!(parseTo(v?.$2));
        }
        return null;
      },
      defaultValue: parseTo(widget.defaultValue ?? 0),
      readOnly: widget.readOnly,
      isAutoComplete: widget.isAutoComplete,
      options: widget.options,
      borderColor: widget.borderColor,
      textAlign: widget.textAlign,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
    );
  }
}

class CampoTexto extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Iterable<String> options;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String? newValue)? onChange;
  final void Function()? onEditingComplete;
  final String? Function(String? newValue)? validator;
  final int? maxLen;
  final int lines;
  final String defaultValue;
  final bool readOnly;
  final bool isAutoComplete;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;
  final IconData? icon;

  const CampoTexto({
    super.key,
    this.label,
    this.controller,
    this.options = const [],
    this.inputFormatters = const [],
    this.onChange,
    this.onEditingComplete,
    this.validator,
    this.maxLen,
    this.lines = 1,
    this.defaultValue = "",
    this.readOnly = false,
    this.isAutoComplete = false,
    this.borderColor,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.focusNode,
    this.autofocus = false,
    this.icon,
  });

  @override
  createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return CampoValor<String>(
      label: widget.label,
      icon: widget.icon,
      controller: widget.controller,
      options: widget.options.map((e) => (e, e)),
      inputFormatters: widget.inputFormatters,
      onChange: (newValue) {
        if (widget.onChange != null) {
          widget.onChange!(newValue?.$2);
        }
      },
      onEditingComplete: widget.onEditingComplete,
      validator: (v) {
        if (widget.validator != null) {
          return widget.validator!(v?.$2);
        }
        return null;
      },
      maxLen: widget.maxLen,
      lines: widget.lines,
      defaultValue: widget.defaultValue,
      readOnly: widget.readOnly,
      isAutoComplete: widget.isAutoComplete,
      borderColor: widget.borderColor,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
    );
  }
}

class CampoValor<T> extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Iterable<(String, T?)> options;
  final List<TextInputFormatter> inputFormatters;
  final void Function((String, T?)? newValue)? onChange;
  final void Function()? onEditingComplete;
  final String? Function((String, T?)? newValue)? validator;
  final int? maxLen;
  final int lines;
  final T? defaultValue;
  final bool readOnly;
  final bool isAutoComplete;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;
  final IconData? icon;

  const CampoValor({
    super.key,
    this.label,
    this.controller,
    this.options = const [],
    this.inputFormatters = const [],
    this.onChange,
    this.onEditingComplete,
    this.validator,
    this.maxLen,
    this.lines = 1,
    this.defaultValue,
    this.readOnly = false,
    this.isAutoComplete = false,
    this.borderColor,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.focusNode,
    this.autofocus = false,
    this.icon,
  });

  @override
  createState() => _CampoValorState<T>();
}

class _CampoValorState<T> extends State<CampoValor<T>> {
  FocusNode? _focusNode;
  TextEditingController? _controller;
  (String, T?)? _dropdownValue;

  @override
  void initState() {
    _controller ??= widget.controller ?? TextEditingController();
    string v = _controller!.text | widget.defaultValue?.toString() | "";
    if (v.isNotBlank) {
      _controller!.text = v;
    }
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAutoComplete || widget.options.isEmpty) {
      field(FocusNode fn, TextEditingController textEditingController) => TextFormField(
            focusNode: fn,
            textAlign: widget.textAlign,
            maxLength: widget.maxLen,
            controller: textEditingController,
            onChanged: (newValue) {
              _controller!.text = newValue;
              if (widget.onChange != null) {
                widget.onChange!((newValue, newValue.parseTo<T>()));
              }
            },
            onEditingComplete: widget.onEditingComplete,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            decoration: estiloCampos(context, widget.label, widget.icon),
            validator: (s) {
              if (widget.validator != null) {
                try {
                  return widget.validator!((s ?? "", s.parseTo<T>()));
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

      return Padding(
        padding: paddingCampos,
        child: widget.options.isNotEmpty
            ? Autocomplete<(String, T?)>(
                initialValue: _controller!.value,
                onSelected: (newValue) {
                  _controller!.text = newValue.$2?.toString() ?? "";
                  if (widget.onChange != null) {
                    widget.onChange!(newValue);
                  }
                },
                displayStringForOption: (value) => value.toString(),
                optionsBuilder: (value) => widget.options.where((e) => "${e.$2}".flatContains(value.text)),
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
      _dropdownValue = widget.options.where((e) => _controller!.text.isNotBlank && "${e.$2}".flatEqual(_controller!.text)).firstOrNull ?? widget.options.where((e) => e.$2 == widget.defaultValue).firstOrNull ?? widget.options.firstOrNull;
      return Padding(
        padding: paddingCampos,
        child: DropdownSearch<(String, T?)>(
          filterFn: (item, filters) =>
              filters.isBlank ||
              FilterFunctions.fullFilterFunction(
                searchTerms: filters.split(";").whereValid,
                searchOn: [item.$1, item.$2.asFlat],
              ),
          compareFn: (item1, item2) => item1.$2.flatEqual(item2.$2),
          popupProps: popupCampos(context, widget.label, options: widget.options.toList()),
          selectedItem: _dropdownValue,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: estiloCampos(context, widget.label, widget.icon),
          ),
          items: widget.options.toList(),
          itemAsString: (i) => i.$1,
          onChanged: (newValue) {
            var nv = newValue?.$2?.toString() ?? "";
            if (_controller!.text == nv) {
              _controller!.text = "";
              _dropdownValue = null;
            } else {
              _controller!.text = nv;
            }
            if (widget.onChange != null) {
              widget.onChange!(newValue);
            }
          },
        ),
      );
    }
  }
}

class CampoCPFouCNPJ extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChange;
  final bool readOnly;

  const CampoCPFouCNPJ({
    super.key,
    this.controller,
    this.onChange,
    this.readOnly = false,
  });

  @override
  createState() => _CampoCPFouCNPJState();
}

class _CampoCPFouCNPJState extends State<CampoCPFouCNPJ> {
  @override
  Widget build(BuildContext context) {
    return CampoTexto(
      label: 'CPF/CNPJ',
      controller: widget.controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfOuCnpjFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(),
      validator: (newValue) => Brasil.validarCPFouCNPJ(newValue ?? "") ? null : "CPF ou CNPJ inválido!",
      onChange: widget.onChange,
      readOnly: widget.readOnly,
    );
  }
}

estiloCampos(BuildContext context, [string? label, IconData? icon]) => InputDecoration(
      icon: icon == null ? null : forceWidget(icon, style: TextStyle(color: context.colorScheme.onSurface)),
      label: label.asNullableText(),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: context.colorScheme.primary, width: 20),
      ),
      filled: true,
    );

PopupProps<T> popupCampos<T>(BuildContext context, string? title, {List<T>? options, Widget Function(BuildContext context, T item, bool isSelected)? itemBuilder, IconData? icon}) {
  var tt = "${"Pesquisar".blankIf((x) => options == null || options.length <= 4)} $title:".trim();
  return context.screenTier < ScreenTier.xs
      ? PopupProps.modalBottomSheet(
          constraints: const BoxConstraints.expand(),
          searchFieldProps: TextFieldProps(decoration: estiloCampos(context, tt, icon)),
          title: InkWell(
            onTap: () => context.pop(),
            child: Padding(
              padding: 6.allAround,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back),
                  const Gap(10),
                  context.localizations.backButtonTooltip.asText().fontSize(10),
                ],
              ).toCenter().paddingAll(8),
            ),
          ),
          modalBottomSheetProps: ModalBottomSheetProps(backgroundColor: context.colorScheme.surfaceBright),
          showSearchBox: options != null ? options.length > 4 : true,
          emptyBuilder: pesquisaVazia,
          itemBuilder: itemBuilder,
        )
      : PopupProps.menu(
          fit: FlexFit.tight,
          showSearchBox: options != null ? options.length > 4 : true,
          emptyBuilder: pesquisaVazia,
          itemBuilder: itemBuilder,
          searchFieldProps: TextFieldProps(decoration: estiloCampos(context, tt, icon)),
        );
}

/// gera os chips que aparecem nas buscas de SELECTs quando nao tem resultados
Widget pesquisaVazia(BuildContext context, string searchEntry) {
  var searches = searchEntry.split(";").where((e) => e.isNotBlank).toList();
  return Expanded(
    child: Center(
      child: ListView(shrinkWrap: true, children: [
        const Text("Não foi possivel encontrar: ").toCenter(),
        ...searches.map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(label: e.asText()),
            )),
      ]),
    ),
  );
}

Widget botaoSalvar(BuildContext context, void Function()? onPressed) => botaoTexto(
      context,
      icon: Icons.save,
      label: 'Salvar',
      onPressed: onPressed,
    );

Widget botaoTexto(BuildContext context, {required string label, required IconData icon, Color? color, required void Function()? onPressed}) => SizedBox(
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

Widget botaoExcluir(BuildContext context, void Function()? onPressed) => botaoTexto(context, label: 'Excluir', icon: Icons.delete, color: Colors.redAccent, onPressed: onPressed);
Widget botaoLimpar(BuildContext context, void Function()? onPressed) => botaoTexto(context, label: "Limpar formulário", icon: Icons.cleaning_services, onPressed: onPressed);
Widget botaoCadastrar(BuildContext context, void Function()? onPressed) => botaoTexto(context, label: "Cadastrar", icon: Icons.edit, onPressed: onPressed);

FloatingActionButton fabSalvar<T>(BuildContext context, T? id, VoidCallback onPressed) => fabTexto(context, label: id.isNotValid ? "Cadastrar" : "Salvar", icon: id.isNotValid ? Icons.edit : Icons.save, onPressed: onPressed);

FloatingActionButton fabTexto(BuildContext context, {String? label, IconData? icon, Color? color, required VoidCallback onPressed}) => FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: color ?? context.colorScheme.primary,
      label: Row(
        children: [
          Visibility(visible: icon != null, child: Icon(icon)),
          Visibility(visible: icon != null && label.isNotBlank, child: const Gap(10)),
          Visibility(visible: label.isNotBlank, child: label!.asText()),
        ],
      ),
    );
