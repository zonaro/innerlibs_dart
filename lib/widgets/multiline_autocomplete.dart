// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innerlibs/innerlibs.dart';

enum SuggestionMode {
  word,
  line,
}

/// A widget that provides a multiline autocomplete text form field.
class SuggestionTextFormField<T extends Object> extends StatefulWidget {
  /// The decoration to show around the text field.
  final InputDecoration? decoration;

  /// A function that returns a list of suggestions.
  final Iterable<T> suggestions;

  final Future<Iterable<T>> Function(string search)? asyncSuggestions;

  /// The maximum Levenshtein distance for suggestions.
  final int levenshteinDistance;

  /// Whether to ignore case when searching for suggestions.
  final bool ignoreCase;

  /// Whether to ignore diacritics when searching for suggestions.
  final bool ignoreDiacritics;

  /// Whether to ignore word splitters when searching for suggestions.
  final bool ignoreWordSplitters;

  /// Whether to split camel case when searching for suggestions.
  final bool splitCamelCase;

  /// Whether to use wildcards when searching for suggestions.
  final bool useWildcards;

  /// Whether to show all suggestions if the input is empty.
  final bool allIfEmpty;

  /// The minimum number of characters required to show suggestions.
  final int minChars;

  /// The maximum number of suggestions to show.
  final int maxResults;

  /// A function that returns the fields to search on for a suggestion.
  final Iterable<dynamic> Function(T)? searchOn;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// A function that returns the display string for a suggestion.
  final string Function(T)? itemAsString;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// The type of keyboard to use for the text field.
  final TextInputType? keyboardType;

  /// The capitalization behavior for the text field.
  final TextCapitalization textCapitalization;

  /// The action button to use for the text field.
  final TextInputAction? textInputAction;

  /// The style to use for the text field.
  final TextStyle? style;

  /// The strut style to use for the text field.
  final StrutStyle? strutStyle;

  /// The text direction for the text field.
  final TextDirection? textDirection;

  /// The alignment for the text field.
  final TextAlign textAlign;

  /// The vertical alignment for the text field.
  final TextAlignVertical? textAlignVertical;

  /// Whether to autofocus the text field.
  final bool autofocus;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Whether to show the cursor in the text field.
  final bool? showCursor;

  /// The character to use for obscuring text.
  final String obscuringCharacter;

  /// Whether to obscure text in the text field.
  final bool obscureText;

  /// Whether to enable autocorrect in the text field.
  final bool autocorrect;

  /// The smart dashes type for the text field.
  final SmartDashesType? smartDashesType;

  /// The smart quotes type for the text field.
  final SmartQuotesType? smartQuotesType;

  /// Whether to enable suggestions in the text field.
  final bool enableSuggestions;

  /// The max length enforcement for the text field.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Whether the text field should expand to fill its parent.
  final bool expands;

  /// The maximum length for the text field.
  final int? maxLength;

  /// The callback to call when the text field is tapped.
  final GestureTapCallback? onTap;

  /// Whether the onTap callback should always be called.
  final bool onTapAlwaysCalled;

  /// The callback to call when the text field is tapped outside.
  final TapRegionCallback? onTapOutside;

  /// The callback to call when editing is complete.
  final VoidCallback? onEditingComplete;

  /// The callback to call when the field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// The input formatters to use for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field is enabled.
  final bool? enabled;

  /// Whether to ignore pointers for the text field.
  final bool? ignorePointers;

  /// The width of the cursor in the text field.
  final double cursorWidth;

  /// The height of the cursor in the text field.
  final double? cursorHeight;

  /// The radius of the cursor in the text field.
  final Radius? cursorRadius;

  /// The color of the cursor in the text field.
  final Color? cursorColor;

  /// The error color of the cursor in the text field.
  final Color? cursorErrorColor;

  /// The keyboard appearance for the text field.
  final Brightness? keyboardAppearance;

  /// The padding to use when scrolling the text field.
  final EdgeInsets scrollPadding;

  /// Whether to enable interactive selection in the text field.
  final bool? enableInteractiveSelection;

  /// The selection controls to use for the text field.
  final TextSelectionControls? selectionControls;

  /// The builder for the input counter widget.
  final InputCounterWidgetBuilder? buildCounter;

  /// The scroll physics to use for the text field.
  final ScrollPhysics? scrollPhysics;

  /// The autofill hints to use for the text field.
  final Iterable<String>? autofillHints;

  /// The autovalidate mode for the text field.
  final AutovalidateMode? autovalidateMode;

  /// The scroll controller for the text field.
  final ScrollController? scrollController;

  /// Whether to enable personalized learning for the IME.
  final bool enableIMEPersonalizedLearning;

  /// The mouse cursor to use for the text field.
  final MouseCursor? mouseCursor;

  /// The builder for the context menu.
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  /// The spell check configuration for the text field.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// The magnifier configuration for the text field.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// The undo history controller for the text field.
  final UndoHistoryController? undoController;

  /// The callback to call for private app commands.
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// Whether the cursor opacity animates.
  final bool? cursorOpacityAnimates;

  /// The height style for the selection.
  final BoxHeightStyle selectionHeightStyle;

  /// The width style for the selection.
  final BoxWidthStyle selectionWidthStyle;

  /// The drag start behavior for the text field.
  final DragStartBehavior dragStartBehavior;

  /// The content insertion configuration for the text field.
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// The states controller for the text field.
  final WidgetStatesController? statesController;

  /// The clip behavior for the text field.
  final Clip clipBehavior;

  /// Whether scribble is enabled for the text field.
  final bool scribbleEnabled;

  /// Whether the text field can request focus.
  final bool canRequestFocus;

  /// The callback to call when the text changes.
  final void Function(String)? onChanged;

  /// The minimum number of lines for the text field.
  final int? minLines;

  /// The error text to force display.
  final String? forceErrorText;

  /// The initial value for the text field.
  final String? initialValue;

  /// The callback to call when the text field is saved.
  final FormFieldSetter<String>? onSaved;

  /// The validator for the text field.
  final FormFieldValidator<String>? validator;

  /// The restoration ID for the text field.
  final String? restorationId;

  /// The callback to call when a suggestion is selected.
  final void Function(string suggestionText, T selection)? onSuggestionSelected;

  /// A map to fire custom search functions for specific characters.
  final CharMatch<T> keyCharSearches;

  /// The maximum height for the suggestions box.
  final double? maxHeight;

  /// A comparator function to determine if two items are equal.
  final bool Function(T item1, T item2)? itemEqualityComparator;

  /// A comparator function to sort the items.
  final int Function(T item1, T item2)? itemComparator;

  final SuggestionMode suggestionMode;

  /// A builder function to build the suggestions widget.
  final Widget Function(
    BuildContext context,
    TextEditingController controller,
    AutocompleteOnSelected<T> onSelected,
    List<T> options,
    string Function(T) displayStringForOption,
  )? suggestionBuilder;

  final Duration dismissTimeout;

  const SuggestionTextFormField({
    super.key,
    this.dismissTimeout = const Duration(seconds: 5),
    this.suggestionMode = SuggestionMode.word,
    this.decoration,
    this.keyCharSearches = const {},
    this.levenshteinDistance = 0,
    this.searchOn,
    this.suggestions = const [],
    this.ignoreCase = true,
    this.ignoreDiacritics = true,
    this.ignoreWordSplitters = true,
    this.splitCamelCase = true,
    this.useWildcards = false,
    this.allIfEmpty = true,
    this.minChars = 1,
    this.maxResults = 5,
    this.itemAsString,
    this.maxLines,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.multiline,
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
    this.minLines,
    this.forceErrorText,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.restorationId,
    this.onSuggestionSelected,
    this.asyncSuggestions,
    this.maxHeight,
    this.itemEqualityComparator,
    this.itemComparator,
    this.suggestionBuilder,
  });

  @override
  createState() => _SuggestionTextFormFieldState();
}

class _SuggestionTextFormFieldState<T extends Object> extends State<SuggestionTextFormField<T>> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  bool isShowing = false;

  OverlayEntry? suggestionTagoverlayEntry;

  late OverlayState overlayState;

  double _maxWidth = 0;

  double _maxHeight = 0;

  /// A function to get the display string for a suggestion.
  string Function(T) get displayStringForOption => widget.itemAsString ?? (T suggestion) => suggestion is string ? suggestion : flatString(suggestion);

  Widget Function(
    BuildContext context,
    TextEditingController controller,
    AutocompleteOnSelected<T> onSelected,
    List<T> options,
    string Function(T) displayStringForOption,
  ) get suggestionBuilder =>
      widget.suggestionBuilder ??
      (context, controller, onSelectet, options, displayStringForOption) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              textDirection: widget.textDirection ?? Directionality.of(context),
              alignment: widget.textAlign.toAlignment(widget.textAlignVertical).toWrapAlignment,
              crossAxisAlignment: widget.textAlign.toAlignment(widget.textAlignVertical).toWrapCrossAlignment,
              children: [
                for (var option in options)
                  ChoiceChip(
                    onSelected: (_) => onSelectet(option),
                    selected: (widget.suggestionMode == SuggestionMode.word ? _controller.currentWord : _controller.currentLineText).flatEqual(displayStringForOption(option)),
                    label: Text(
                      displayStringForOption(option),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
              ],
            ),
          );

  @override
  Widget build(BuildContext context) {
    overlayState = Overlay.of(context);
    return LayoutBuilder(builder: (context, cs) {
      _maxWidth = cs.maxWidth;
      _maxHeight = widget.maxHeight ?? cs.maxHeight.clampMax(context.height * .9);
      return TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        autovalidateMode: widget.autovalidateMode,
        expands: widget.expands,
        forceErrorText: widget.forceErrorText,
        onSaved: widget.onSaved,
        validator: widget.validator,
        statesController: widget.statesController,
        restorationId: widget.restorationId,
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
        onChanged: (s) {
          if (widget.onChanged != null) {
            widget.onChanged!(s);
          }
          setState(() {});
        },
      );
    });
  }

  void destroyOverlay() {
    try {
      if (suggestionTagoverlayEntry != null) {
        suggestionTagoverlayEntry?.remove();
        suggestionTagoverlayEntry?.dispose();
      }
    } finally {
      suggestionTagoverlayEntry = null;
    }
  }

  @override
  initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller.text = widget.initialValue ?? _controller.text;
    _controller.addListener(() async {
      showOverlaidTag();
    });
  }

  /// A comparator function to compare two items for ordering.
  int itemComparator(T item1, T item2) {
    if (widget.itemComparator != null) {
      return widget.itemComparator!(item1, item2);
    } else if (T is Comparable) {
      return (item1 as Comparable).compareTo(item2);
    } else {
      return displayStringForOption(item1).compareTo(displayStringForOption(item2));
    }
  }

  /// A function to check if two items are equal.
  bool itemEqualityComparator(T item1, T item2) {
    if (widget.itemEqualityComparator != null) {
      return widget.itemEqualityComparator!(item1, item2);
    } else {
      return displayStringForOption(item1) == displayStringForOption(item2);
    }
  }

  Future<Iterable<T>> processSuggestions() async {
    if (widget.enableSuggestions == false) {
      return [];
    }

    var s = widget.suggestionMode == SuggestionMode.word ? _controller.currentWord : _controller.currentLineText;
    if (widget.minChars > (s.length)) {
      return [];
    }
    var sugs = <T>[...widget.suggestions];
    if (widget.asyncSuggestions != null) {
      var aSugs = await widget.asyncSuggestions!(s);
      sugs.addAll(aSugs);
    }

    sugs = sugs
        .distinctByComparison(itemEqualityComparator)
        .search(
          searchTerms: s,
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
          keyCharSearches: widget.keyCharSearches,
        )
        .toList();

    if (sugs.length == 1 && displayStringForOption(sugs.first).flatEqual(s)) {
      return [];
    }
    return sugs.sortedByCompare((x) => x, itemComparator);
  }

  /// A function to get the fields to search on for a suggestion.
  Iterable<dynamic> searchOn(T suggestion) {
    if (widget.searchOn != null) {
      return widget.searchOn!(suggestion);
    } else {
      return <dynamic>[displayStringForOption(suggestion)];
    }
  }

  void showOverlaidTag() async {
    var options = (await processSuggestions()).toList();
    if (options.isEmpty) {
      destroyOverlay();
      _focusNode.requestFocus();
      return;
    }
    TextPainter painter = TextPainter(
      textDirection: widget.textDirection ?? Directionality.of(context),
      text: TextSpan(
        style: widget.style,
        text: _controller.currentLineText,
      ),
    );
    painter.layout();

    destroyOverlay();
    suggestionTagoverlayEntry = OverlayEntry(builder: (context) {
      _maxHeight = _maxHeight.clampMax((context.height * .9) - _focusNode.offset.dy);
      _maxWidth = _maxWidth.clampMax((context.width * .9) - _focusNode.offset.dx);
      return Positioned(
        width: _maxWidth,
        height: _maxHeight,
        // Decides where to place the tag on the screen.
        top: _focusNode.offset.dy + painter.height + 3,
        left: _focusNode.offset.dx + painter.width + 3,

        // Tag code.
        child: Material(
          elevation: 4.0,
          child: SizedBox(
            width: _maxWidth,
            height: _maxHeight,
            child: suggestionBuilder(
              context,
              _controller,
              _onSelected,
              options,
              displayStringForOption,
            ),
          ),
        ),
      );
    });
    overlayState.insert(suggestionTagoverlayEntry!);
    if (widget.dismissTimeout.inMicroseconds > 0) {
      Future.delayed(
        widget.dismissTimeout,
        () {
          destroyOverlay();
        },
      );
    }
  }

  /// A function to handle the selection of a suggestion.
  void _onSelected(T selection) {
    destroyOverlay();

    var index = widget.suggestionMode == SuggestionMode.word ? _controller.currentWordIndex : _controller.currentLineIndex;

    if (widget.suggestionMode == SuggestionMode.word) {
      _controller.setWordAt(index, displayStringForOption(selection));
    } else {
      _controller.setLineAt(index, displayStringForOption(selection));
    }

    if (widget.suggestionMode == SuggestionMode.line && widget.maxLines != null && index < widget.maxLines! - 1) {
      _controller.lines = _controller.lines.toList()..insert(index + 1, "");
    }

    setState(() {});
    _focusNode.requestFocus();

    if (widget.suggestionMode == SuggestionMode.word) {
      _controller.currentWordIndex = index + displayStringForOption(selection).length;
    } else {
      _controller.currentLineIndex = index + 2;
    }

    if (widget.onSuggestionSelected != null) {
      widget.onSuggestionSelected!(displayStringForOption(selection), selection);
    }
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
    setState(() {});
  }
}
