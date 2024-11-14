import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';

class MultilineAutocompleteTextFormField<T extends Object> extends StatefulWidget {
  final InputDecoration? decoration;

  final Future<Iterable<T>> Function() suggestions;

  final int levenshteinDistance;

  final bool ignoreCase;
  final bool ignoreDiacritics;
  final bool ignoreWordSplitters;
  final bool splitCamelCase;
  final bool useWildcards;
  final bool allIfEmpty;
  final int minChars;
  final int maxResults;
  final Iterable<dynamic> Function(T)? searchOn;
  final int? maxLines;

  final string Function(T)? displayStringForOption;

  final TextEditingController? controller;

  final OptionsViewOpenDirection optionsViewOpenDirection;

  final FocusNode? focusNode;
  final bool appendSuggestions;
  final bool appendNewLine;

  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final bool onTapAlwaysCalled;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? cursorErrorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final UndoHistoryController? undoController;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final bool? cursorOpacityAnimates;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final DragStartBehavior dragStartBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final WidgetStatesController? statesController;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final bool canRequestFocus;
  final void Function(String)? onChanged;

  const MultilineAutocompleteTextFormField({
    super.key,
    this.decoration,
    this.levenshteinDistance = 0,
    this.searchOn,
    required this.suggestions,
    this.ignoreCase = true,
    this.ignoreDiacritics = true,
    this.ignoreWordSplitters = true,
    this.splitCamelCase = true,
    this.useWildcards = false,
    this.allIfEmpty = false,
    this.minChars = 1,
    this.maxResults = 5,
    this.displayStringForOption,
    this.maxLines,
    this.controller,
    this.optionsViewOpenDirection = OptionsViewOpenDirection.down,
    this.focusNode,
    this.appendSuggestions = false,
    this.appendNewLine = true,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.expands = false,
    this.maxLength,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.cursorErrorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.onAppPrivateCommand,
    this.cursorOpacityAnimates,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.dragStartBehavior = DragStartBehavior.start,
    this.contentInsertionConfiguration,
    this.statesController,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.canRequestFocus = true,
    this.onChanged,
  });

  @override
  createState() => _MultilineAutocompleteTextFormFieldState();
}

class _MultilineAutocompleteTextFormFieldState<T extends Object> extends State<MultilineAutocompleteTextFormField<T>> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  string Function(T) get displayStringForOption => widget.displayStringForOption ?? (T suggestion) => flatString(suggestion);

  Iterable<dynamic> Function(T) get searchOn => widget.searchOn ?? (T suggestion) => [displayStringForOption(suggestion)];

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      textEditingController: _controller,
      focusNode: _focusNode,
      optionsViewOpenDirection: widget.optionsViewOpenDirection,
      optionsBuilder: (_) async {
        var sugs = await widget.suggestions();
        var v = sugs.search(
          searchTerms: _controller.currentLineText,
          searchOn: searchOn,
          levenshteinDistance: widget.levenshteinDistance,
          allIfEmpty: widget.allIfEmpty,
          ignoreCase: widget.ignoreCase,
          ignoreDiacritics: widget.ignoreDiacritics,
          ignoreWordSplitters: widget.ignoreWordSplitters,
          splitCamelCase: widget.splitCamelCase,
          useWildcards: widget.useWildcards,
          minChars: widget.minChars,
          maxResults: widget.maxResults,
        );
        return v;
      },
      displayStringForOption: displayStringForOption,
      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          maxLines: widget.maxLines,
          decoration: widget.decoration,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          textDirection: widget.textDirection,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          maxLength: widget.maxLength,
          onTap: widget.onTap,
          onTapAlwaysCalled: widget.onTapAlwaysCalled,
          onTapOutside: widget.onTapOutside,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          ignorePointers: widget.ignorePointers,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          cursorErrorColor: widget.cursorErrorColor,
          scrollPadding: widget.scrollPadding,
          scrollPhysics: widget.scrollPhysics,
          keyboardAppearance: widget.keyboardAppearance,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          buildCounter: widget.buildCounter,
          autofillHints: widget.autofillHints,
          scrollController: widget.scrollController,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          mouseCursor: widget.mouseCursor,
          contextMenuBuilder: widget.contextMenuBuilder,
          spellCheckConfiguration: widget.spellCheckConfiguration,
          magnifierConfiguration: widget.magnifierConfiguration,
          undoController: widget.undoController,
          onAppPrivateCommand: widget.onAppPrivateCommand,
          cursorOpacityAnimates: widget.cursorOpacityAnimates,
          selectionHeightStyle: widget.selectionHeightStyle,
          selectionWidthStyle: widget.selectionWidthStyle,
          dragStartBehavior: widget.dragStartBehavior,
          contentInsertionConfiguration: widget.contentInsertionConfiguration,
          clipBehavior: widget.clipBehavior,
          scribbleEnabled: widget.scribbleEnabled,
          canRequestFocus: widget.canRequestFocus,
          onChanged: widget.onChanged,
        );
      },
      optionsViewBuilder: (BuildContext context, void Function(T) onSelected, Iterable<T> options) {
        return Material(
          elevation: 4.0,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final selection = options.elementAt(index);
                return ListTile(
                  tileColor: context.theme.listTileTheme.tileColor,
                  title: Text(displayStringForOption(selection)),
                  onTap: () {
                    var sug = displayStringForOption(selection);
                    var lineText = _controller.currentLineText;
                    var index = _controller.currentLineIndex;
                    if (widget.appendSuggestions) {
                      lineText = lineText + sug;
                    } else {
                      lineText = displayStringForOption(selection);
                    }
                    _controller.currentLineText = lineText.trim();
                    if (widget.appendNewLine) {
                      _controller.lines = _controller.lines.toList()..insert(index + 1, "");
                    }
                    setState(() {});
                    _focusNode.requestFocus();
                    _controller.currentLineIndex = index + (widget.appendNewLine ? 2 : 1);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }
}
