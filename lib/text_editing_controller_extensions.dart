import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

/// Extension on TextEditingController to provide additional functionalities.
extension TextEditingControllerExtensions on TextEditingController {
  int get countLines => value.countLines;

  /// Gets or sets the current line where the cursor is located.
  int get currentLineIndex => value.currentLineIndex;
  set currentLineIndex(int value) {
    var cursorPosition = lines.take(value).join(Get.breakline).length;
    selection = TextSelection.collapsed(offset: cursorPosition);
  }

  /// Gets or sets the current line where the cursor is located.
  string get currentLineText => value.currentLineText;
  set currentLineText(String value) => setLineAt(currentLineIndex, value);

  String get currentWord => value.currentWord;

  set currentWord(String value) => setWordAt(currentWordIndex, value);

  int get currentWordIndex => value.currentWordIndex;

  set currentWordIndex(int value) {
    var cursorPosition = words.take(value).join(' ').length;
    selection = TextSelection(baseOffset: cursorPosition - currentWord.length, extentOffset: cursorPosition);
  }

  /// Gets all lines in the text.
  Iterable<string> get lines => value.lines;

  set lines(Iterable<String> value) => text = value.join(Get.breakline);

  /// Gets or sets all words in the text. this includes the splitters.
  ///
  /// when setting the value, your list need to include the splitters, otherswise the text will be joined without spaces or breaklines.
  Iterable<string> get words => value.words;
  set words(Iterable<String> value) => text = value.join();

  /// Gets the line at the specified index.
  string lineAt(int index) => value.lineAt(index);

  /// Sets the line at the specified index to the given value.
  String setLineAt(int index, String value) {
    final l = lines.toList();
    l[index] = value;
    lines = l;
    return text;
  }

  String setWordAt(int index, String value) {
    final w = words.toList();
    w[index] = value;
    words = w;
    return text;
  }
}

extension TextEditingValueExtensions on TextEditingValue {
  /// Gets the number of lines in the text.
  int get countLines => text.splitLines.length;

  int get countWords => words.length;

  /// Gets the index of the current line where the cursor is located.
  int get currentLineIndex {
    var cursorPos = selection.base.offset;
    String txt = text.replaceMany(Get.breaklineChars, Get.breakline);
    var textpart = txt.first(cursorPos);
    var curIndex = textpart.count(Get.breakline);
    curIndex = curIndex.clamp(0, countLines - 1);
    return curIndex;
  }

  /// Gets or sets the current line where the cursor is located.
  String get currentLineText => lineAt(currentLineIndex);

  /// Gets the current word where the cursor is located.
  String get currentWord => wordAt(currentWordIndex);

  /// Gets the index of the current word where the cursor is located.
  int get currentWordIndex {
    var cursorPos = selection.base.offset;
    var textpart = text.first(cursorPos);
    var parts = textpart.splitWords(WordSplitMode.keepSplitters);
    var curIndex = parts.length - 1;
    curIndex = curIndex.clampMin(0);
    return curIndex;
  }

  /// Gets all lines in the text.
  Iterable<String> get lines => text.splitLines.defaultIfEmpty(text);

  /// Gets all words in the text.
  Iterable<string> get words => text.splitWords(WordSplitMode.keepSplitters).defaultIfEmpty(text);

  /// Gets the line at the specified index.
  String lineAt(int index) => lines.elementAt(index);

  /// Gets the word at the specified index.
  String wordAt(int index) => words.elementAt(index);
}
