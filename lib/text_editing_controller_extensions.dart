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
  set currentWord(String value) {
    var cursorPosition = words.take(currentWordIndex).join(' ').length;
    selection = TextSelection.collapsed(offset: cursorPosition);
    //replace the current word with the new value
    var txt = text;
    var start = txt.lastIndexOf(RegExp(r'\s'), cursorPosition - 1) + 1;
    var end = txt.indexOf(RegExp(r'\s'), cursorPosition);
    end = end == -1 ? txt.length : end;
    var newTxt = txt.replaceRange(start, end, value);
    text = newTxt;
  }

  int get currentWordIndex => value.currentWordIndex;

  set currentWordIndex(int value) {
    var cursorPosition = words.take(value).join(' ').length;
    selection = TextSelection.collapsed(offset: cursorPosition);
  }

  /// Gets all lines in the text.
  Iterable<string> get lines => value.lines;

  set lines(Iterable<String> value) => text = value.join(Get.breakline);
  Iterable<string> get words => value.words;

  /// Gets the line at the specified index.
  string lineAt(int index) => value.lineAt(index);

  /// Sets the line at the specified index to the given value.
  String setLineAt(int index, String value) {
    final l = lines.toList();
    l[index] = value;
    lines = l;
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
    var txt = text;
    var start = txt.lastIndexOf(RegExp(r'\s'), cursorPos - 1) + 1;
    return start;
  }

  /// Gets all lines in the text.
  Iterable<String> get lines => text.splitLines.defaultIfEmpty(text);

  /// Gets all words in the text.
  Iterable<string> get words => text.split(RegExp(r'\s+'));

  /// Gets the line at the specified index.
  String lineAt(int index) => lines.elementAt(index);

  /// Gets the word at the specified index.
  String wordAt(int index) => words.elementAt(index);
}
