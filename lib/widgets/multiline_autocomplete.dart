import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class MultilineAutocompleteTextFormField<T extends Object> extends StatefulWidget {
  final InputDecoration? decoration;

  final Iterable<T> suggestions;

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
  });

  @override
  createState() => _MultilineAutocompleteTextFormFieldState();
}

class _MultilineAutocompleteTextFormFieldState<T extends Object> extends State<MultilineAutocompleteTextFormField<T>> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  string Function(T) get displayStringForOption => widget.displayStringForOption ?? (T suggestion) => flatString(suggestion);

  Iterable<dynamic> Function(T) get searchOn => widget.searchOn ?? (T suggestion) => [displayStringForOption(suggestion)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<T>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isBlank) {
              return [];
            }
            final cursorPosition = _controller.selection.baseOffset;
            final text = _controller.text;
            final lines = text.splitLines;
            int currentLineIndex = 0;
            int charCount = 0;

            for (int i = 0; i < lines.length; i++) {
              charCount += lines[i].length + 1; // +1 for the newline character
              if (cursorPosition <= charCount) {
                currentLineIndex = i;
                break;
              }
            }

            final currentLineText = lines[currentLineIndex];
            final currentLineCursorPosition = cursorPosition - (charCount - lines[currentLineIndex].length - 1);

            return widget.suggestions.search(
              searchTerms: currentLineText.first(currentLineCursorPosition),
              searchOn: searchOn,
              levenshteinDistance: widget.levenshteinDistance,
              allIfEmpty: widget.allIfEmpty,
            );
          },
          displayStringForOption: displayStringForOption,
          onSelected: (T selection) => _insertSuggestion(displayStringForOption(selection)),
          fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
            _controller.addListener(() {
              fieldTextEditingController.value = _controller.value;
            });
            return TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: widget.maxLines,
              decoration: widget.decoration,
              onChanged: (text) {
                setState(() {});
              },
            );
          },
        ),
      ],
    );
  }

  void _insertSuggestion(String suggestion) {
    final text = _controller.text;
    final cursorPosition = _controller.selection.baseOffset;
    final lines = text.split('\n');
    int currentLineIndex = 0;
    int charCount = 0;

    for (int i = 0; i < lines.length; i++) {
      charCount += lines[i].length + 1; // +1 for the newline character
      if (cursorPosition <= charCount) {
        currentLineIndex = i;
        break;
      }
    }

    final currentLineCursorPosition = cursorPosition - (charCount - lines[currentLineIndex].length - 1);
    final newLine = lines[currentLineIndex].substring(0, currentLineCursorPosition) + suggestion + lines[currentLineIndex].substring(currentLineCursorPosition);
    lines[currentLineIndex] = newLine;

    _controller.text = lines.join('\n');
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: cursorPosition + suggestion.length),
    );
    setState(() {});
    _focusNode.requestFocus();
  }
}
