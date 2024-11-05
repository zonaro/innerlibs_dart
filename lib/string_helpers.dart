import 'dart:io';

import 'package:innerlibs/innerlibs.dart';

/// Break Line char
string get breakLine => Get.breakLineChars.first;

/// `String` helpers
extension StringHelpers on GetInterface {
  /// Chars from Aa to Zz
  Iterable<string> get alphaChars => [...alphaUpperChars, ...alphaLowerChars]..sort();

  /// Chars from a to z
  Iterable<string> get alphaLowerChars => [...lowerConsonants, ...lowerVowels]..sort();

  /// Chars from Aa to Zz and Numbers (0 to 9)
  Iterable<string> get alphaNumericChars => [...alphaChars, ...numberChars]..sort();

  Iterable<string> get alphaNumericSpecialChars => [...alphaNumericChars, ...specialChars]..sort();

  /// Chars from A to Z
  Iterable<string> get alphaUpperChars => alphaLowerChars.map((e) => e.toUpperCase()).toList();

  /// Line feed and carriage retrun
  Iterable<string> get breakLineChars => [Platform.lineTerminator, "\n", "\r", "\r\n"].distinct();

  /// Double-Quotes, Single-Quotes, Close Brackets etc
  Iterable<string> get closeWrappers => openCloseWrappers.map((x) => x.$2);

  /// Upper and lower case consonants
  Iterable<string> get consonants => [...upperConsonants, ...lowerConsonants]..sort();

  Iterable<string> get emailChars => [...Get.alphaNumericChars, '@', '.', '_', '-'];

  /// Dot, Question mark and Exclamation Mark
  Iterable<string> get endOfSentenceChars => [".", "?", "!"];

  Iterable<string> get greekChars => greekToLatin.keys;

  Map<String, String> get greekToLatin => {
        'ά': 'a',
        'Α': 'a',
        'έ': 'e',
        'Έ': 'e',
        'Ε': 'e',
        'ή': 'i',
        'Η': 'i',
        'η': 'i',
        'Ή': 'i',
        'ί': 'i',
        'Ι': 'i',
        'Ί': 'i',
        'Ϊ': 'i',
        'ϊ': 'i',
        'ΐ': 'i',
        'ό': 'o',
        'Ό': 'o',
        'Ο': 'o',
        'ο': 'o',
        'ύ': 'y',
        'υ': 'y',
        'Ύ': 'y',
        'Ϋ': 'y',
        'ϋ': 'y',
        'ε': 'e',
        'ευ': 'ef',
        'εύ': 'ef',
        'α': 'a',
        'αυ': 'av',
        'αύ': 'av',
        'β': 'v',
        'Β': 'v',
        'γ': 'g',
        'Γ': 'g',
        'δ': 'd',
        'Δ': 'd',
        'ζ': 'z',
        'Ζ': 'z',
        'θ': 'th',
        'Θ': 'th',
        'ι': 'i',
        'κ': 'k',
        'Κ': 'k',
        'λ': 'l',
        'Λ': 'l',
        'μ': 'm',
        'Μ': 'm',
        'ν': 'n',
        'Ν': 'n',
        'ξ': 'ks',
        'Ξ': 'ks',
        'π': 'p',
        'Π': 'p',
        'ρ': 'r',
        'Ρ': 'r',
        'σ': 's',
        'Σ': 's',
        'ς': 's',
        'τ': 't',
        'Τ': 't',
        'φ': 'f',
        'Φ': 'f',
        'χ': 'x',
        'Χ': 'x',
        'ψ': 'ps',
        'Ψ': 'ps',
        'ω': 'o',
        'Ω': 'o',
        'Ώ': 'o',
        'ώ': 'o',
      };

  /// Ident char (tab)
  Iterable<string> get identChars => ["\t"];

  /// Invisible char (white space, line feed, ident, carriage return)
  Iterable<string> get invisibleChars => [...whiteSpaceChars, ...breakLineChars, ...identChars];

  Map<String, StringList> get leetAlphabet => {
        "a": ['∆', '4', '/-\\', '/_\\', '@', '/\\', 'Д'],
        "b": ['8', '|3', '13', '|}', '|8', '|B', '|8', 'ß', 'в', 'ь'],
        "c": ['<', '{', '[', '(', '©', '¢'],
        "d": ['|)', '|}', '|]', '|>'],
        "e": ['3', '£', '₤', '€'],
        "f": ['7', '|=', 'ph', '|#', '|"', 'ƒ'],
        "g": ['9', '[', '[+', '6'],
        "h": ['#', '|-|', '[-]', '{-}', '}-{', '}{', '|=|', '[=]', '/-/', ':-:', 'н'],
        "i": ['1', '|', '!'],
        "j": ['√', '_|', '_/', '_7', '_)', '_]', '_}'],
        "k": ['|<', '1<', 'l<', '|{', 'l{'],
        "l": ['|_', '|', '1', ']['],
        "m": ['|/|', '^^', '/\\/\\', '/X\\', '[]/][', '[]V[]', ' ][\\//][', '(V)', '//., .\\', 'N\\', 'м'],
        "n": ['||', '//', '/V', '][\\][', 'И', 'и', 'п'],
        "o": ['0', '()', '[]', '{}', '<>', 'Ø', 'oh', 'Θ', 'ө'],
        "p": ['|o', '|O', '|>', '|*', '|°', '|D', '/o', '[]D', '|7'],
        "q": ['O_', '(,)', '0', 'kw'],
        "r": ['|2', '12', '|^', 'l2', 'Я', '®'],
        "s": ['5', '\$', '§'],
        "t": ['7', '+', "'|'", '`|`', '~|~', '-|-', "']['", 'т'],
        "v": ['V'],
        "u": ['|_|', '\\_\\', '/_/', '\\_/', '(_)', '[_]', '{_}'],
        "w": ['\\/\\/', '(/\\)', '\\^/', '|/|', '\\X/', 'VV', '\\_|_/', '\\//\\//', 'Ш', '2u', 'V/'],
        "x": ['%', '*', '><', 'Ж'],
        "y": ['¥', '|/', 'Ч'],
        "z": ['5', '>_'],
      };

  /// Lower consonants
  Iterable<string> get lowerConsonants => ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"];

  /// Lower vowels
  Iterable<string> get lowerVowels => ["a", "e", "i", "o", "u", "y"];

  Iterable<string> get mathOperators => [
        "+",
        "-",
        "*",
        "/",
        "%",
        "^",
        "&",
        "|",
        "~",
        ">",
        "<",
        "=",
        "!",
        "?",
      ];

  /// Semicolon, colon and comma
  Iterable<string> get midSentenceChars => [":", ";", ","];

  /// Numbers from 0 to 9
  Iterable<string> get numberChars => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  Iterable<(string, string)> get openCloseWrappers => [
        ("(", ")"),
        ("{", "}"),
        ("[", "]"),
        ("<", ">"),
        ("¿", "?"),
        ("¡", "!"),
        ("«", "»"),
        (slashChars.first, slashChars.last),
        (slashChars.last, slashChars.first),
        ...quotes.map((x) => (x, x)),
      ];

  /// Double-Quotes, Single-Quotes, Open Brackets etc
  Iterable<String> get openWrappers => openCloseWrappers.map((x) => x.$1);

  /// Double-Quotes, Single-Quotes and Back-Ticks
  Iterable<string> get quotes => ["\"", "'", "`"];

  Iterable<string> get slashChars => ["\\", "|", "/"];

  Iterable<string> get specialChars => [
        "@",
        "#",
        "\$",
        "%",
        "^",
        "&",
        "*",
        "-",
        "_",
        "+",
        "=",
        "|",
        "~",
        ...quotes,
        ...openWrappers,
        ...closeWrappers,
        ...midSentenceChars,
        ...endOfSentenceChars,
        ...mathOperators,
      ];

  /// Upper consonants
  Iterable<string> get upperConsonants => lowerConsonants.map((e) => e.toUpperCase()).toList();

  /// Upper vowels
  Iterable<string> get upperVowels => lowerVowels.map((e) => e.toUpperCase()).toList();

  
  /// Upper and lower vowels
  Iterable<string> get vowels => [...upperVowels, ...lowerVowels]..sort();

  /// White space char
  Iterable<string> get whiteSpaceChars => [" "];

  StringList get wordSplitters => [
        ...breakLineChars,
        ...whiteSpaceChars,
        ...identChars,
        ...endOfSentenceChars,
        ...midSentenceChars,
        ...openWrappers,
        ...closeWrappers,
      ];

  /// Double-Quotes, Single-Quotes, Open and Close Brackets etc
  Iterable<string> get wrappers => [...openWrappers, ...closeWrappers];
}
