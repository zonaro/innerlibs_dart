import 'package:flutter/widgets.dart';
import 'package:innerlibs/innerlibs.dart';

/// Extension on TextEditingController to provide additional functionalities.
extension TextEditingControllerExtensions on TextEditingController {
  /// Gets the number of lines in the text.
  int get countLines => text.splitLines.length;

  /// Gets or sets the current line where the cursor is located.
  String get currentLine => lines.elementAt(currentLineIndex);
  set currentLine(String value) => setLineAt(currentLineIndex, value);

  /// Gets the index of the current line where the cursor is located.
  int get currentLineIndex {
    final cursorPosition = selection.baseOffset;
    var lines = text.substring(0, cursorPosition).splitLines;
    if (lines.isEmpty || text.endsWithAny(Get.breaklineChars)) {
      lines.add("");
    }
    return lines.length - 1;
  }

   

  /// Gets all lines in the text.
  Iterable<String> get lines => text.splitLines;

  /// Gets the line at the specified index.
  String lineAt(int index) => lines.elementAt(index);

  /// Sets the line at the specified index to the given value.
  String setLineAt(int index, String value) {
    final lines = text.splitLines;
    lines[index] = value;
    text = lines.join(Get.breakline);
    return text;
  }
}
