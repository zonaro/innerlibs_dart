import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
// for the utf8.encode method

extension NullStringExtension on String? {
  String get blankIfNull => this ?? "";
  String get zeroIfBlank => ifBlank("0")!;
  String? get nullIfBlank => ifBlank(null);

  bool get isBlank => this == null || this!.isBlank;

  bool get isNotBlank => this != null && !isBlank;

  String? ifBlank(String? newString) => this != null && this!.isNotBlank ? this : newString;

  /// Checks whether the `String` is `null`.
  /// ### Example 1
  /// ```dart
  /// String? foo;
  /// bool isNull = foo.isNull; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'fff';
  /// bool isNull = foo.isNull; // returns false
  /// ```
  bool get isNull => this == null;

  /// Checks whether the `String` is not `null`.
  /// ### Example 1
  /// ```dart
  /// String? foo;
  /// bool isNull = foo.isNotNull; // returns false
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'fff';
  /// bool isNull = foo.isNotNull; // returns true
  /// ```
  bool get isNotNull => isNull == false;

  String blankCoalesce(List<string?> newString) {
    var x = [blankIfNull, ...newString];
    return x.firstWhere((e) => e.isNotBlank).blankIfNull;
  }

  /// Return left string if not blank. Otherwise return right string.
  String operator |(Object? s) => ifBlank("$s") ?? "";
}

extension StringExtension on String {
  static final _defaultDiacriticsRemovalap = [
    {'base': 'A', 'letters': '\u0041\u24B6\uFF21\u00C0\u00C1\u00C2\u1EA6\u1EA4\u1EAA\u1EA8\u00C3\u0100\u0102\u1EB0\u1EAE\u1EB4\u1EB2\u0226\u01E0\u00C4\u01DE\u1EA2\u00C5\u01FA\u01CD\u0200\u0202\u1EA0\u1EAC\u1EB6\u1E00\u0104\u023A\u2C6F'},
    {'base': 'AA', 'letters': '\uA732'},
    {'base': 'AE', 'letters': '\u00C6\u01FC\u01E2'},
    {'base': 'AO', 'letters': '\uA734'},
    {'base': 'AU', 'letters': '\uA736'},
    {'base': 'AV', 'letters': '\uA738\uA73A'},
    {'base': 'AY', 'letters': '\uA73C'},
    {'base': 'B', 'letters': '\u0042\u24B7\uFF22\u1E02\u1E04\u1E06\u0243\u0182\u0181'},
    {'base': 'C', 'letters': '\u0043\u24B8\uFF23\u0106\u0108\u010A\u010C\u00C7\u1E08\u0187\u023B\uA73E'},
    {'base': 'D', 'letters': '\u0044\u24B9\uFF24\u1E0A\u010E\u1E0C\u1E10\u1E12\u1E0E\u0110\u018B\u018A\u0189\uA779'},
    {'base': 'DZ', 'letters': '\u01F1\u01C4'},
    {'base': 'Dz', 'letters': '\u01F2\u01C5'},
    {'base': 'E', 'letters': '\u0045\u24BA\uFF25\u00C8\u00C9\u00CA\u1EC0\u1EBE\u1EC4\u1EC2\u1EBC\u0112\u1E14\u1E16\u0114\u0116\u00CB\u1EBA\u011A\u0204\u0206\u1EB8\u1EC6\u0228\u1E1C\u0118\u1E18\u1E1A\u0190\u018E'},
    {'base': 'F', 'letters': '\u0046\u24BB\uFF26\u1E1E\u0191\uA77B'},
    {'base': 'G', 'letters': '\u0047\u24BC\uFF27\u01F4\u011C\u1E20\u011E\u0120\u01E6\u0122\u01E4\u0193\uA7A0\uA77D\uA77E'},
    {'base': 'H', 'letters': '\u0048\u24BD\uFF28\u0124\u1E22\u1E26\u021E\u1E24\u1E28\u1E2A\u0126\u2C67\u2C75\uA78D'},
    {'base': 'I', 'letters': '\u0049\u24BE\uFF29\u00CC\u00CD\u00CE\u0128\u012A\u012C\u0130\u00CF\u1E2E\u1EC8\u01CF\u0208\u020A\u1ECA\u012E\u1E2C\u0197'},
    {'base': 'J', 'letters': '\u004A\u24BF\uFF2A\u0134\u0248'},
    {'base': 'K', 'letters': '\u004B\u24C0\uFF2B\u1E30\u01E8\u1E32\u0136\u1E34\u0198\u2C69\uA740\uA742\uA744\uA7A2'},
    {'base': 'L', 'letters': '\u004C\u24C1\uFF2C\u013F\u0139\u013D\u1E36\u1E38\u013B\u1E3C\u1E3A\u0141\u023D\u2C62\u2C60\uA748\uA746\uA780'},
    {'base': 'LJ', 'letters': '\u01C7'},
    {'base': 'Lj', 'letters': '\u01C8'},
    {'base': 'M', 'letters': '\u004D\u24C2\uFF2D\u1E3E\u1E40\u1E42\u2C6E\u019C'},
    {'base': 'N', 'letters': '\u004E\u24C3\uFF2E\u01F8\u0143\u00D1\u1E44\u0147\u1E46\u0145\u1E4A\u1E48\u0220\u019D\uA790\uA7A4'},
    {'base': 'NJ', 'letters': '\u01CA'},
    {'base': 'Nj', 'letters': '\u01CB'},
    {'base': 'O', 'letters': '\u004F\u24C4\uFF2F\u00D2\u00D3\u00D4\u1ED2\u1ED0\u1ED6\u1ED4\u00D5\u1E4C\u022C\u1E4E\u014C\u1E50\u1E52\u014E\u022E\u0230\u00D6\u022A\u1ECE\u0150\u01D1\u020C\u020E\u01A0\u1EDC\u1EDA\u1EE0\u1EDE\u1EE2\u1ECC\u1ED8\u01EA\u01EC\u00D8\u01FE\u0186\u019F\uA74A\uA74C'},
    {'base': 'OI', 'letters': '\u01A2'},
    {'base': 'OO', 'letters': '\uA74E'},
    {'base': 'OU', 'letters': '\u0222'},
    {'base': 'OE', 'letters': '\u008C\u0152'},
    {'base': 'oe', 'letters': '\u009C\u0153'},
    {'base': 'P', 'letters': '\u0050\u24C5\uFF30\u1E54\u1E56\u01A4\u2C63\uA750\uA752\uA754'},
    {'base': 'Q', 'letters': '\u0051\u24C6\uFF31\uA756\uA758\u024A'},
    {'base': 'R', 'letters': '\u0052\u24C7\uFF32\u0154\u1E58\u0158\u0210\u0212\u1E5A\u1E5C\u0156\u1E5E\u024C\u2C64\uA75A\uA7A6\uA782'},
    {'base': 'S', 'letters': '\u0053\u24C8\uFF33\u1E9E\u015A\u1E64\u015C\u1E60\u0160\u1E66\u1E62\u1E68\u0218\u015E\u2C7E\uA7A8\uA784'},
    {'base': 'T', 'letters': '\u0054\u24C9\uFF34\u1E6A\u0164\u1E6C\u021A\u0162\u1E70\u1E6E\u0166\u01AC\u01AE\u023E\uA786'},
    {'base': 'TZ', 'letters': '\uA728'},
    {'base': 'U', 'letters': '\u0055\u24CA\uFF35\u00D9\u00DA\u00DB\u0168\u1E78\u016A\u1E7A\u016C\u00DC\u01DB\u01D7\u01D5\u01D9\u1EE6\u016E\u0170\u01D3\u0214\u0216\u01AF\u1EEA\u1EE8\u1EEE\u1EEC\u1EF0\u1EE4\u1E72\u0172\u1E76\u1E74\u0244'},
    {'base': 'V', 'letters': '\u0056\u24CB\uFF36\u1E7C\u1E7E\u01B2\uA75E\u0245'},
    {'base': 'VY', 'letters': '\uA760'},
    {'base': 'W', 'letters': '\u0057\u24CC\uFF37\u1E80\u1E82\u0174\u1E86\u1E84\u1E88\u2C72'},
    {'base': 'X', 'letters': '\u0058\u24CD\uFF38\u1E8A\u1E8C'},
    {'base': 'Y', 'letters': '\u0059\u24CE\uFF39\u1EF2\u00DD\u0176\u1EF8\u0232\u1E8E\u0178\u1EF6\u1EF4\u01B3\u024E\u1EFE'},
    {'base': 'Z', 'letters': '\u005A\u24CF\uFF3A\u0179\u1E90\u017B\u017D\u1E92\u1E94\u01B5\u0224\u2C7F\u2C6B\uA762'},
    {'base': 'a', 'letters': '\u0061\u24D0\uFF41\u1E9A\u00E0\u00E1\u00E2\u1EA7\u1EA5\u1EAB\u1EA9\u00E3\u0101\u0103\u1EB1\u1EAF\u1EB5\u1EB3\u0227\u01E1\u00E4\u01DF\u1EA3\u00E5\u01FB\u01CE\u0201\u0203\u1EA1\u1EAD\u1EB7\u1E01\u0105\u2C65\u0250'},
    {'base': 'aa', 'letters': '\uA733'},
    {'base': 'ae', 'letters': '\u00E6\u01FD\u01E3'},
    {'base': 'ao', 'letters': '\uA735'},
    {'base': 'au', 'letters': '\uA737'},
    {'base': 'av', 'letters': '\uA739\uA73B'},
    {'base': 'ay', 'letters': '\uA73D'},
    {'base': 'b', 'letters': '\u0062\u24D1\uFF42\u1E03\u1E05\u1E07\u0180\u0183\u0253'},
    {'base': 'c', 'letters': '\u0063\u24D2\uFF43\u0107\u0109\u010B\u010D\u00E7\u1E09\u0188\u023C\uA73F\u2184'},
    {'base': 'd', 'letters': '\u0064\u24D3\uFF44\u1E0B\u010F\u1E0D\u1E11\u1E13\u1E0F\u0111\u018C\u0256\u0257\uA77A'},
    {'base': 'dz', 'letters': '\u01F3\u01C6'},
    {'base': 'e', 'letters': '\u0065\u24D4\uFF45\u00E8\u00E9\u00EA\u1EC1\u1EBF\u1EC5\u1EC3\u1EBD\u0113\u1E15\u1E17\u0115\u0117\u00EB\u1EBB\u011B\u0205\u0207\u1EB9\u1EC7\u0229\u1E1D\u0119\u1E19\u1E1B\u0247\u025B\u01DD'},
    {'base': 'f', 'letters': '\u0066\u24D5\uFF46\u1E1F\u0192\uA77C'},
    {'base': 'g', 'letters': '\u0067\u24D6\uFF47\u01F5\u011D\u1E21\u011F\u0121\u01E7\u0123\u01E5\u0260\uA7A1\u1D79\uA77F'},
    {'base': 'h', 'letters': '\u0068\u24D7\uFF48\u0125\u1E23\u1E27\u021F\u1E25\u1E29\u1E2B\u1E96\u0127\u2C68\u2C76\u0265'},
    {'base': 'hv', 'letters': '\u0195'},
    {'base': 'i', 'letters': '\u0069\u24D8\uFF49\u00EC\u00ED\u00EE\u0129\u012B\u012D\u00EF\u1E2F\u1EC9\u01D0\u0209\u020B\u1ECB\u012F\u1E2D\u0268\u0131'},
    {'base': 'j', 'letters': '\u006A\u24D9\uFF4A\u0135\u01F0\u0249'},
    {'base': 'k', 'letters': '\u006B\u24DA\uFF4B\u1E31\u01E9\u1E33\u0137\u1E35\u0199\u2C6A\uA741\uA743\uA745\uA7A3'},
    {'base': 'l', 'letters': '\u006C\u24DB\uFF4C\u0140\u013A\u013E\u1E37\u1E39\u013C\u1E3D\u1E3B\u017F\u0142\u019A\u026B\u2C61\uA749\uA781\uA747'},
    {'base': 'lj', 'letters': '\u01C9'},
    {'base': 'm', 'letters': '\u006D\u24DC\uFF4D\u1E3F\u1E41\u1E43\u0271\u026F'},
    {'base': 'n', 'letters': '\u006E\u24DD\uFF4E\u01F9\u0144\u00F1\u1E45\u0148\u1E47\u0146\u1E4B\u1E49\u019E\u0272\u0149\uA791\uA7A5'},
    {'base': 'nj', 'letters': '\u01CC'},
    {'base': 'o', 'letters': '\u006F\u24DE\uFF4F\u00F2\u00F3\u00F4\u1ED3\u1ED1\u1ED7\u1ED5\u00F5\u1E4D\u022D\u1E4F\u014D\u1E51\u1E53\u014F\u022F\u0231\u00F6\u022B\u1ECF\u0151\u01D2\u020D\u020F\u01A1\u1EDD\u1EDB\u1EE1\u1EDF\u1EE3\u1ECD\u1ED9\u01EB\u01ED\u00F8\u01FF\u0254\uA74B\uA74D\u0275'},
    {'base': 'oi', 'letters': '\u01A3'},
    {'base': 'ou', 'letters': '\u0223'},
    {'base': 'oo', 'letters': '\uA74F'},
    {'base': 'p', 'letters': '\u0070\u24DF\uFF50\u1E55\u1E57\u01A5\u1D7D\uA751\uA753\uA755'},
    {'base': 'q', 'letters': '\u0071\u24E0\uFF51\u024B\uA757\uA759'},
    {'base': 'r', 'letters': '\u0072\u24E1\uFF52\u0155\u1E59\u0159\u0211\u0213\u1E5B\u1E5D\u0157\u1E5F\u024D\u027D\uA75B\uA7A7\uA783'},
    {'base': 's', 'letters': '\u0073\u24E2\uFF53\u00DF\u015B\u1E65\u015D\u1E61\u0161\u1E67\u1E63\u1E69\u0219\u015F\u023F\uA7A9\uA785\u1E9B'},
    {'base': 't', 'letters': '\u0074\u24E3\uFF54\u1E6B\u1E97\u0165\u1E6D\u021B\u0163\u1E71\u1E6F\u0167\u01AD\u0288\u2C66\uA787'},
    {'base': 'tz', 'letters': '\uA729'},
    {'base': 'u', 'letters': '\u0075\u24E4\uFF55\u00F9\u00FA\u00FB\u0169\u1E79\u016B\u1E7B\u016D\u00FC\u01DC\u01D8\u01D6\u01DA\u1EE7\u016F\u0171\u01D4\u0215\u0217\u01B0\u1EEB\u1EE9\u1EEF\u1EED\u1EF1\u1EE5\u1E73\u0173\u1E77\u1E75\u0289'},
    {'base': 'v', 'letters': '\u0076\u24E5\uFF56\u1E7D\u1E7F\u028B\uA75F\u028C'},
    {'base': 'vy', 'letters': '\uA761'},
    {'base': 'w', 'letters': '\u0077\u24E6\uFF57\u1E81\u1E83\u0175\u1E87\u1E85\u1E98\u1E89\u2C73'},
    {'base': 'x', 'letters': '\u0078\u24E7\uFF58\u1E8B\u1E8D'},
    {'base': 'y', 'letters': '\u0079\u24E8\uFF59\u1EF3\u00FD\u0177\u1EF9\u0233\u1E8F\u00FF\u1EF7\u1E99\u1EF5\u01B4\u024F\u1EFF'},
    {'base': 'z', 'letters': '\u007A\u24E9\uFF5A\u017A\u1E91\u017C\u017E\u1E93\u1E95\u01B6\u0225\u0240\u2C6C\uA763'}
  ];

  static final _diacriticsMap = {};

  static final _diacriticsRegExp = RegExp('[^\u0000-\u007E]', multiLine: true);

  String? get asNullable => this;

  String replaceSQLParameters(JsonRow params, [bool nullAsBlank = true, string parameterMatch = ":"]) {
    return replaceParameters(params.map((k, v) => MapEntry(k, (v as Object?).asSqlValue(nullAsBlank))), parameterMatch);
  }

  String replaceParameters(JsonRow params, string parameterMatch) {
    String query = this;

    if (parameterMatch.isBlank) throw ArgumentError.value(parameterMatch, "parameterMatch", "parameterMatch cannot be blank");

    // convert params to string
    Map<String, dynamic> convertedParams = {};

    for (final param in params.entries) {
      convertedParams[param.key] = (param.value as Object?).toString();
    }

    // find all :placeholders, which can be substituted
    final pattern = RegExp("$parameterMatch(\\w+)");

    final matches = pattern.allMatches(query).where((match) {
      final subString = query.substring(0, match.start);

      int count = "'".allMatches(subString).length;
      if (count > 0 && count.isOdd) {
        return false;
      }

      count = '"'.allMatches(subString).length;
      if (count > 0 && count.isOdd) {
        return false;
      }

      return true;
    }).toList();

    int lengthShift = 0;

    for (final match in matches) {
      final paramName = match.group(1);

      // check param exists
      if (false == convertedParams.containsKey(paramName)) {
        convertedParams[paramName!] = "";
      }

      final newQuery = query.replaceFirst(
        match.group(0)!,
        convertedParams[paramName]!.toString(),
        match.start + lengthShift,
      );

      lengthShift += newQuery.length - query.length;
      query = newQuery;
    }

    return query;
  }

  /// Splits the string into multiple substrings using any of the specified delimiters.
  ///
  /// The `delimiters` parameter is a list of strings that represent the delimiters to use for splitting the string.
  ///
  /// Returns a list of strings that are the result of splitting the original string using the specified delimiters.
  List<String> splitAny(List<String> delimiters) {
    List<String> result = [this];
    for (String delimiter in delimiters) {
      List<String> temp = [];
      for (String str in result) {
        temp.addAll(str.split(delimiter).where((x) => x.isNotEmpty));
      }
      result = temp;
    }
    return result;
  }

  /// Returns the URL-encoded version of the string.
  ///
  /// Example:
  /// ```dart
  /// String url = 'https://example.com/?q=hello world';
  /// String encodedUrl = url.urlEncode;
  /// print(encodedUrl); // Output: https%3A%2F%2Fexample.com%2F%3Fq%3Dhello%20world
  /// ```
  String get urlEncode => Uri.encodeQueryComponent(this);

  /// Returns the URL-decoded version of the string.
  ///
  /// Example:
  /// ```dart
  /// String encodedUrl = 'https%3A%2F%2Fexample.com%2F%3Fq%3Dhello%20world';
  /// String decodedUrl = encodedUrl.urlDecode;
  /// print(decodedUrl); // Output: https://example.com/?q=hello world
  /// ```
  String get urlDecode => Uri.decodeQueryComponent(this);

  /// Return a checksum digit for a barcode
  String get generateBarcodeCheckSum {
    if (isNotNumber) {
      throw const FormatException('Code is not a number');
    }

    int i = 0;
    int j;
    int p = 0;
    int t = length;
    for (j = 1; j <= t; j++) {
      if ((j & ~ -2) == 0) {
        p += int.parse(substring(j - 1, j));
      } else {
        i += int.parse(substring(j - 1, j));
      }
    }

    if (t == 7 || t == 11) {
      i = i * 3 + p;
      p = (i + 9) ~/ 10 * 10;
      t = p - i;
    } else {
      p = p * 3 + i;
      i = (p + 9) ~/ 10 * 10;
      t = i - p;
    }

    return t.toString();
  }

  /// Checks if the string is a valid EAN (European Article Number) barcode.
  ///
  /// Returns `true` if the string is a valid EAN barcode, `false` otherwise.
  /// A valid EAN barcode must meet the following conditions:
  /// - It must not be blank.
  /// - It must consist of only numeric characters.
  /// - It must have a length greater than 3.
  /// - The last character of the barcode must be the correct checksum digit.
  ///
  /// Example usage:
  /// ```dart
  /// var barcode = '1234567890123';
  /// if (barcode.isValidEAN) {
  ///   print('Valid EAN barcode');
  /// } else {
  ///   print('Invalid EAN barcode');
  /// }
  /// ```
  bool get isValidEAN {
    if (isBlank || isNotNumber || length <= 3) {
      return false;
    }
    var bar = removeLast(1);
    var ver = last(1);
    return bar.generateBarcodeCheckSum == ver;
  }

  /// Returns a new string with the flag of the specified country code.
  String get countryEmoji {
    final List<String> characters = toUpperCase().split('');
    final Iterable<int> characterCodes = characters.map((String char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(characterCodes);
  }

  Color get asColor {
    if (isBlank) {
      return Colors.transparent; // Default color if the string is empty
    }

    // Check if the string is a valid hexadecimal color
    final hexColorRegex = RegExp(r'^#?([0-9a-fA-F]{8}|[0-9a-fA-F]{6}|[0-9a-fA-F]{3})$');
    if (hexColorRegex.hasMatch(this)) {
      final hexColor = replaceFirst('#', ''); // Remove any leading '#'
      final alpha = hexColor.length == 8 ? hexColor.substring(0, 2) : 'FF'; // Extract alpha value or use default 'FF'
      final color = hexColor.substring(hexColor.length - 6); // Extract RGB value
      return Color(int.parse('$alpha$color', radix: 16));
    }

    // If not a valid hexadecimal color, compute a hash value
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash = codeUnitAt(i) + ((hash << 5) - hash);
    }

    // Add an alpha channel (0xFF) to the hash value
    return Color(hash + 0xFF000000);
  }

  String get removeDiacritics {
    if (isBlank) return blankIfNull;
    if (_diacriticsMap.isEmpty) {
      for (int i = 0; i < _defaultDiacriticsRemovalap.length; i++) {
        var letters = _defaultDiacriticsRemovalap[i]['letters'];
        for (int j = 0; j < letters!.length; j++) {
          _diacriticsMap[letters[j]] = _defaultDiacriticsRemovalap[i]['base'];
        }
      }
    }
    return replaceAllMapped(_diacriticsRegExp, (a) => _diacriticsMap[a.group(0)] ?? a.group(0));
  }

  /// Returns a string with camel case split into separate words.
  ///
  /// The camel case string is split into separate words using a space as the separator.
  /// For example, "camelSplitString" will be converted to "camel Split String".
  String get camelSplitString => camelSplit.join(" ");

  /// Returns a string with pascal case split into separate words.
  ///
  /// The pascal case string is split into separate words using a space as the separator.
  /// For example, "PascalSplitString" will be converted to "Pascal Split String".
  String get pascalSplitString => pascalSplit.join(" ");

  /// Splits a camel case string into individual words.
  /// Returns a list of strings representing the words in the camel case string.
  List<String> get camelSplit {
    List<String> words = [];
    String word = '';
    if (isNotBlank) {
      for (int i = 0; i < length; i++) {
        if (this[i] == this[i].toUpperCase()) {
          if (word.isNotEmpty) {
            words.add(word);
          }
          word = this[i];
        } else {
          word += this[i];
        }
      }

      if (word.isNotEmpty) {
        words.add(word);
      }
    }

    return words.select((w, i) => i == 0 ? w.toLowerCase() : w.capitalizeFirst).toList();
  }

  /// Splits a pascal case string into individual words.
  /// Returns a list of strings representing the words in the pascal case string.
  List<String> get pascalSplit => camelSplit.map((w) => w.capitalizeFirst).toList();

  /// Checks if the current string is equal to the given [text] when both are flattened.
  /// Returns `true` if they are equal, `false` otherwise.
  bool flatEqual(String? text) => asFlat == text?.asFlat;

  /// Checks if the current string contains the given [text] when both are flattened.
  /// If the current string is blank, it returns `true` only if the [text] is also blank.
  /// If the [text] is blank, it returns `true`.
  /// Otherwise, it checks if the current string contains the [text] when both are flattened.
  /// Returns `true` if the current string contains the [text], `false` otherwise.
  bool flatContains(String? text) {
    if (isBlank) return text.isBlank;

    if (text.isBlank) {
      return true;
    }
    return asFlat.contains(text!.asFlat);
  }

  /// Returns the string as a flat representation by removing diacritics, converting to lowercase, and trimming all whitespace.
  string get asFlat => removeDiacritics.toLowerCase().trimAll;

  /// Checks if any of the strings in the given [texts] iterable is equal to the current string.
  /// Returns `true` if any string is equal, otherwise returns `false`.
  bool flatEqualAny(Iterable<String> texts) {
    for (var t in texts) {
      if (flatEqual(t)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if the string contains any of the specified texts.
  ///
  /// Returns `true` if the string contains any of the texts in the [texts] iterable,
  /// otherwise returns `false`.
  bool flatContainsAny(Iterable<String> texts) {
    for (var t in texts) {
      if (flatContains(t)) {
        return true;
      }
    }
    return false;
  }

  String get singularPt {
    if (endsWith('ões')) {
      return '${removeLast(3)}ão';
    } else if (endsWith('ães')) {
      return '${removeLast(3)}ão';
    } else if (endsWith('s')) {
      return removeLast(1);
    }
    return this;
  }

  String get singular {
    if (endsWith('ies')) {
      return '${removeLast(3)}y';
    } else if (endsWith('es')) {
      return removeLast(2);
    } else if (endsWith('s')) {
      return removeLast(1);
    }
    return this;
  }

  /// Checks if the [length!] of the `String` is more than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isMore = foo > 'Hi'; // returns true.
  /// ```
  bool operator >(String s) {
    return length > s.length;
  }

  /// Checks if the [length!] of the `String` is more or equal than the length of [s].

  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isMoreOrEqual = foo >= 'Hi'; // returns true.
  /// ```
  bool operator >=(String s) => length >= s.length;

  /// Checks if the [length!] of the `String` is less than the length of [s].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isLess = foo < 'Hi'; // returns false.
  /// ```
  bool operator <(String s) => length < s.length;

  /// Checks if the [length!] of the `String` is less or equal than the length of [s].
  ///
  /// If the `String` is null or empty, it returns false.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello';
  /// bool isLessOrEqual = foo <= 'Hi'; // returns false.
  /// ```
  bool operator <=(String s) => length <= s.length;

  /// Removes a text from the `String`.
  String operator -(String? s) {
    if (isBlank) {
      return '';
    }
    if (s.isBlank) {
      return this;
    }
    return replaceAll(s!, '');
  }

  /// slice a string into chunks
  strings operator /(int chunkSize) {
    List<String> chunks = [];
    if (isNotBlank) {
      for (int i = 0; i < length; i += chunkSize) {
        chunks.add(substring(i, i + chunkSize));
      }
    }
    return chunks;
  }

  /// slice a string into chunks
  strings slice(int chunkSize) => this / chunkSize;

  /// Splits the string into chunks based on the provided chunk sizes.
  ///
  /// The [chunkSizes] parameter is a list of integers representing the sizes of each chunk.
  /// If the list is empty, the entire string will be considered as a single chunk.
  ///
  /// Returns a list of strings, where each string represents a chunk of the original string.
  ///
  /// Example usage:
  /// ```dart
  /// var input = 'Hello, world!';
  /// var chunkSizes = [5, 2, 6];
  /// var chunks = input.splitChunk(chunkSizes);
  /// print(chunks); // Output: ['Hello', ', ', 'world!']
  /// ```
  List<String> splitChunk(List<int> chunkSizes) {
    List<String> chunks = [];
    var input = this;
    while (input.isNotEmpty) {
      var size = chunkSizes.isNotEmpty ? chunkSizes.first : input.length;
      if (size <= 0) size = input.length;
      var chunk = input.substring(0, size);
      if (chunk.isEmpty) {
        if (input.isNotEmpty) chunks.add(input);
        break;
      }
      chunks.add(chunk);
      input = input.substring(size);
      chunkSizes = chunkSizes.skip(1).toList();
    }
    return chunks;
  }

  /// Returns the average read time duration of the given `String` in seconds.
  ///
  /// The default calculation is based on 200 words per minute.
  ///
  /// You can pass the [wordsPerMinute] parameter for different read speeds.
  /// ### Example
  /// ```dart
  /// String foo =  'Hello dear friend how you doing ?';
  /// int readTime = foo.readTime(); // returns 3 seconds.
  /// ```
  int readTime({int wordsPerMinute = 200}) {
    if (isBlank) {
      return 0;
    }
    var magicalNumber = getWords.length / wordsPerMinute.lockMin(1);
    return (magicalNumber * 100).round();
  }

  /// Counts the occurrences of a substring within a string.
  ///
  /// This function searches through the provided [String] for instances
  /// of the [subString] and returns the total number of occurrences found.
  ///
  /// Parameters:
  ///   [subString] - The substring to count within the [String].
  ///
  /// Returns the number of times [subString] appears in [String].
  int count([String subString = ""]) {
    if (subString.isBlank) {
      return length;
    }
    int count = 0;
    int startIndex = 0;

    // Use indexOf to find the substring in the string
    // Loop until the substring is not found
    while ((startIndex = indexOf(subString, startIndex)) != -1) {
      // Increment the count for each occurrence
      count++;
      // Move past the last found substring
      startIndex += subString.length;
    }

    return count;
  }

  /// Returns the word count in the given `String`.
  ///
  /// The pattern is based on spaces.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// int count = foo.countWords; // returns 6 words.
  /// ```
  int get countWords => getWords.length;

  /// Returns a list with distinct words of this sentence
  strings get getUniqueWords => getWords.distinctFlat();

  /// Returns a list with words of this sentence
  strings get getWords {
    if (isBlank) {
      return [];
    }
    return splitAny(StringHelpers.wordSplitters).toList();
  }

  /// Removes only the numbers from the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNumbers = foo.removeNumbers; // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noNumbers = foo.removeNumbers; // returns 'e*s*e*n*t*i*s'
  /// ```
  String get removeNumbers {
    if (isBlank) {
      return blankIfNull;
    }
    var regex = RegExp(r'(\d+)');
    return replaceAll(regex, '');
  }

  /// Returns only the numbers from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onyNumbers = foo.onlyNumbers; // returns '455455231'
  /// ```
  String get onlyNumbers {
    if (isBlank) {
      return blankIfNull;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^0-9]+)');
    return replaceAll(regex, '');
  }

  /// Returns the integer representation of the string, considering only the numeric characters.
  /// If the string does not contain any numeric characters, it returns null.
  int? get onlyNumbersInt => onlyNumbers.toInt;

  /// Returns only the Latin OR Greek characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/σοφ4e5523ια';
  /// String onlyL1 = foo.onlyLetters; // returns 'σοφια'
  /// String foo2 = '4*%^55/es4e5523nt1is';
  /// String onlyL2 = foo2.onlyLetters; // returns 'esentis'
  /// ```
  String get onlyLetters {
    if (isBlank) {
      return blankIfNull;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([^α-ωΑ-ΩίϊΐόάέύϋΰήώΊΪΌΆΈΎΫΉΏa-zA-Z\s]+)');
    return replaceAll(regex, '');
  }

  /// Returns all special characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '/!@#\$%^\-&*()+",.?":{}|<>~_-`*%^/ese?:"///ntis/!@#\$%^&*(),.?":{}|<>~_-`';
  /// String removed = foo.removeSpecial; // returns 'esentis'
  /// ```
  String get removeSpecial {
    if (isBlank) {
      return blankIfNull;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'[/!@#$%^\-&*()+",.?":{}|<>~_-`]');
    return replaceAll(regex, '');
  }

  /// Checks whether the `String` is a valid IPv6.
  /// ### Example 1
  /// ```dart
  /// String foo = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
  /// bool isIpv6 = foo.isIpv6; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv6 = foo.isIpv6; // returns false
  /// ```
  bool get isIPv6 {
    if (isBlank) {
      return false;
    }
    substring(0, 1);
    var regex = RegExp(
        r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))');
    return regex.hasMatch(this);
  }

  /// Checks whether the `String` is a valid URL.
  /// ### Example 1
  /// ```dart
  /// String foo = 'foo.1com';
  /// bool isUrl = foo.isUrl; // returns false
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'google.com';
  /// bool isUrl = foo.isUrl; // returns true
  /// ```
  bool get isUrl {
    if (isBlank) {
      return false;
    }

    var regex = RegExp(r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return regex.hasMatch(this);
  }

  /// Checks whether the `String` is a valid `DateTime`:
  ///
  /// ### Valid formats
  ///
  /// * dd/mm/yyyy
  /// * dd-mm-yyyyy
  /// * dd.mm.yyyy
  /// * yyyy-mm-dd
  /// * yyyy-mm-dd hrs
  /// * 20120227 13:27:00
  /// * 20120227T132700
  /// * 20120227
  /// * +20120227
  /// * 2012-02-27T14Z
  /// * 2012-02-27T14+00:00
  /// * -123450101 00:00:00 Z": in the year -12345
  /// * 2002-02-27T14:00:00-0500": Same as "2002-02-27T19:00:00Z
  bool get isDate {
    if (isBlank) {
      return false;
    }
    var regex = RegExp(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
    if (regex.hasMatch(this)) {
      return true;
    }
    try {
      return DateTime.tryParse(this) != null;
    } on Exception {
      return false;
    }
  }

  /// Checks whether the `String` is a valid mail.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com';
  /// bool isMail = foo.isMail; // returns true
  /// ```
  bool get isEmail {
    if (isBlank) {
      return false;
    }
    var regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this);
  }

  /// Checks whether the `String` is a number.
  /// ### Example
  /// ```dart
  /// String foo = '45';
  /// bool isNumber = foo.isNumber; // returns true
  /// ```
  /// ```dart
  /// String foo = '45s';
  /// String isNumber = foo.isNumber; // returns false
  bool get isNumber => isNotBlank && isNumberOrBlank;

  bool get isNotNumber => !isNumber;

  bool get isNumberOrBlank => isBlank || num.tryParse(this) != null;

  /// Checks whether the `String` complies to below rules :
  ///  * At least 1 uppercase
  ///  * At least 1 special character
  ///  * At least 1 number
  ///  * At least 8 characters in length
  /// ### Example
  /// ```dart
  /// String foo = 'qwerty';
  /// bool isStrong = foo.isStrongPassword; // returns false
  /// ```
  /// ```dart
  /// String foo = 'IsTh!$Strong';
  /// bool isStrong = foo.isStrongPassword; // returns true
  /// ```
  bool get isStrongPassword {
    if (isBlank) {
      return false;
    }
    var regex = RegExp(r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*,;.?]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
    return regex.hasMatch(this);
  }

  /// Checks whether the `String` is a valid Guid.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '6d64-4396-8547-1ec1b86e081e';
  /// bool isGuid = foo.isGuid; // returns false
  /// ```
  /// ```dart
  /// String foo = '887b7923-6d64-4396-8547-1ec1b86e081e';
  /// bool isGuid = foo.isGuid; // returns true
  /// ```
  bool get isGuid {
    if (isBlank) {
      return false;
    }
    var regex = RegExp(r'^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$');
    return regex.hasMatch(this);
  }

  /// Checks if the `String` exists in a given `Iterable<String>`
  /// ### Example
  /// ```dart
  /// String foo = '6d64-4396-8547-1ec1b86e081e';
  /// var iterable = ['fff','gasd'];
  /// bool isIn = foo.isIn(iterable); // returns false
  /// ```
  bool isIn(Iterable<String> strings) => isNotBlank && strings.isNotEmpty && strings.contains(this);

  /// Checks if the `String` has only Latin characters.
  /// ### Example
  /// ```dart
  /// String foo = 'this is a τεστ';
  /// bool isLatin = foo.isLatin; // returns false
  /// String foo2 = 'this is hello world';
  /// bool isLatin2 = foo2.isLatin; // returns true
  /// ```
  bool get isLatin {
    if (isBlank) {
      return false;
    }
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(this);
  }

  /// Checks if the `String` has only Greek characters.
  /// ### Example
  /// ```dart
  /// String foo = 'this is a τεστ';
  /// bool isGreek = foo.isGreek; // returns false
  /// String foo2 = 'Τα αγαθά κόποις κτώνται';
  /// bool isGreek2 = foo2.isGreek; // returns true
  /// ```
  bool? get isGreek {
    if (isBlank) {
      return false;
    }

    return RegExp(r'^[α-ωΑ-ΩίϊΐόάέύϋΰήώΊΪΌΆΈΎΫΉΏ\s]+$').hasMatch(this);
  }

  /// Checks if the `String` is a valid `json` format.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = '{"name":"John","age":30,"cars":null}';
  /// bool isJson = foo.isJson; // returns true
  /// ```
  bool isJson() {
    if (isBlank) {
      return false;
    }
    try {
      jsonDecode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Removes only the letters from the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noLetters = foo.removeLetters; // returns '455231'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noLetters = foo.removeLetters; // returns '1244**4*5523**1*'
  /// ```
  String get removeLetters {
    if (isBlank) {
      return blankIfNull;
    }
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'([a-zA-Z]+)');
    return replaceAll(regex, '');
  }

  String removeAny(List<Pattern> texts) => replaceMany(texts);

  String replaceMany(List<Pattern> from, [String to = ""]) {
    String result = this;
    for (var pattern in from) {
      result = result.replaceAll(pattern, to);
    }
    return result;
  }

  /// Finds all character occurrences and returns count as:
  /// ```dart
  /// List<Map<dynamic,dynamic>>
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'esentis';
  /// List occurrences = foo.charOccurrences; // returns '[{e:2},{i:1},{n:1},{s:2},]'
  /// ```
  List<Map<String, int>> get charOccurences {
    if (isBlank) {
      return [];
    }
    // ignore: omit_local_variable_types
    List<Map<String, int>> occurrences = [];
    var letters = split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;
    for (var i = 0; i < letters.length; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == letters.length - 1) {
          occurrences.add({checkingLetter: count});
          checkingLetter = letters[i];
        }
      } else {
        occurrences.add({checkingLetter: count});
        checkingLetter = letters[i];
        count = 1;
      }
    }
    return occurrences;
  }

  /// Finds the most frequent character in the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'Hello World';
  /// String mostFrequent = foo.mostFrequent; // returns 'l'
  /// ```
  String mostFrequent({bool ignoreSpaces = false}) {
    if (isBlank) {
      return blankIfNull;
    }
    if (ignoreSpaces) {
      return replaceAll(' ', '').mostFrequent();
    }
    var occurrences = <String, int>{};
    var letters = split('')..sort();
    var checkingLetter = letters[0];
    var count = 0;

    for (var i = 0, len = letters.length; i < len; i++) {
      if (letters[i] == checkingLetter) {
        count++;
        if (i == len - 1) {
          occurrences[checkingLetter] = count;
        }
      } else {
        occurrences[checkingLetter] = count;
        checkingLetter = letters[i];
        count = 1;
      }
    }

    var mostFrequent = '';
    var occursCount = -1;

    occurrences.forEach((character, occurs) {
      if (occurs > occursCount) {
        mostFrequent = character;
        occursCount = occurs;
      }
    });

    return mostFrequent;
  }

  /// Returns the `String` reversed.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello World';
  /// String reversed = foo.reverse; // returns 'dlrow olleH'
  /// ```
  String get reverse {
    if (isBlank) {
      return blankIfNull;
    }

    var letters = split('').toList().reversed;
    return letters.reduce((current, next) => current + next);
  }

  /// Returns the first [n] characters of the `String`.
  ///
  /// n is optional, by default it returns the first character of the `String`.
  ///
  /// If [n] provided is longer than the `String`'s length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(0,count)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.first(); // returns 'h'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.first(3); // returns 'hel'
  /// ```
  String first([int n = 1]) {
    if (isBlank || length < n || n < 0) {
      return blankIfNull;
    }

    return substring(0, n);
  }

  /// Returns the last [n] characters of the `String`.
  ///
  /// [n] is optional, by default it returns the first character of the `String`.
  ///
  /// If [n] provided is longer than the `String`'s length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(length-n,length)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.last(); // returns 'd'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.last(3); // returns 'rld'
  /// ```
  String last([int n = 1]) {
    if (isBlank || length < n || n < 0) {
      return blankIfNull;
    }

    return substring(length - n, length);
  }

  /// Returns the `String` to slug case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'sLuG Case';
  /// String fooSlug = foo.toSlug; // returns 'sLuG_Case'
  /// ```
  String get toSlugCase {
    if (isBlank) {
      return blankIfNull;
    }

    var words = trim().split(RegExp(r'(\s+)'));
    var slugWord = '';

    if (length == 1) {
      return this;
    }
    for (var i = 0; i <= words.length - 1; i++) {
      if (i == words.length - 1) {
        slugWord += words[i];
      } else {
        slugWord += '${words[i]}_';
      }
    }
    return slugWord;
  }

  /// Returns the `String` to snake_case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'SNAKE CASE';
  /// String fooSNake = foo.toSnakeCase; // returns 'snake_case'
  /// ```
  String get toSnakeCase {
    if (isBlank) {
      return blankIfNull;
    }

    var words = toLowerCase().trim().split(RegExp(r'(\s+)'));
    var snakeWord = '';

    if (length == 1) {
      return this;
    }
    for (var i = 0; i <= words.length - 1; i++) {
      if (i == words.length - 1) {
        snakeWord += words[i];
      } else {
        snakeWord += '${words[i]}_';
      }
    }
    return snakeWord;
  }

  /// Returns the `String` in camelcase.
  /// ### Example
  /// ```dart
  /// String foo = 'Find max of array';
  /// String camelCase = foo.toCamelCase; // returns 'findMaxOfArray'
  /// ```
  String get toCamelCase {
    if (isBlank) {
      return blankIfNull;
    }

    var words = trim().split(RegExp(r'(\s+)'));
    var result = words[0].toLowerCase();
    for (var i = 1; i < words.length; i++) {
      result += words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
    }
    return result;
  }

  /// Returns the `String` title cased.
  ///
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// Sting titleCased = foo.toTitleCase; // returns 'Hello Dear Friend How You Doing'.
  /// ```
  String get toTitleCase {
    if (isBlank) {
      return blankIfNull;
    }

    var words = trim().toLowerCase().split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
  }

  /// Returns a list of the `String`'s characters.
  ///
  /// O(n)
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// List<String> fooArray = foo.toArray; // returns '[a,b,r,a,c,a,d,a,b,r,a]'
  /// ```
  List<String> get toArray {
    if (isBlank) {
      return [];
    }

    return split('');
  }

  /// Converts a `String` to a numeric value if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toNum(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toNum(); // returns null;
  /// ```
  num? get toNum {
    if (isBlank) {
      return null;
    }

    return num.tryParse(this);
  }

  num get toNumOrZero => toNum ?? 0;

  /// Converts a `String` to`int` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toInt(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toInt(); // returns null;
  /// ```
  /// ```dart
  /// String foo = '4.0';
  /// var fooNull = foo.toInt(); // returns 4;
  /// ```
  int? get toInt {
    if (isBlank) {
      return null;
    }

    return int.tryParse(this) ?? double.tryParse(this)?.floor();
  }

  int get toIntOrZero => toInt ?? 0;

  /// Converts a `String` to`double` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toDouble(); // returns 4.0;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toDouble(); // returns null;
  /// ```
  double? get toDouble {
    if (isBlank) {
      return null;
    }

    return double.tryParse(this);
  }

  double get toDoubleOrZero => toDouble ?? 0.0;

  /// Adds a [replacement] character at [index] of the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'hello';
  /// String replaced = foo.replaceAtIndex(index:2,replacement:''); // returns 'helo';
  /// ```
  String replaceAtIndex({required int index, required String replacement}) {
    if (isBlank) {
      return blankIfNull;
    }
    if (index > length) {
      return blankIfNull;
    }
    if (index < 0) {
      return blankIfNull;
    }

    return '${substring(0, index)}$replacement${substring(index + 1, length)}';
  }

  /// Given a pattern returns the starting indices of all occurrences of the [pattern] in the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// String fooOccs = foo.findPatterns(pattern:'abr'); // returns '[0, 7]'
  /// ```
  List<int> findPattern({required String pattern}) {
    if (isBlank) {
      return [];
    }

    // ignore: omit_local_variable_types
    List<int> occurrences = [];
    // How many times the pattern can fit the text provided
    var fitCount = (length / pattern.length).truncate().toInt();

    if (fitCount > length) {
      return [];
    }
    if (fitCount == 1) {
      if (this == pattern) {
        return [0];
      }
      return [];
    }

    for (var i = 0; i <= length; i++) {
      if (i + pattern.length > length) {
        return occurrences;
      }
      if (substring(i, i + pattern.length) == pattern) {
        occurrences.add(i);
      }
    }

    return occurrences;
  }

  /// Strips all HTML code from `String`.
  ///
  /// ### Example
  /// ```dart
  /// String html = '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold. </span></p>';
  /// String stripped = foo.stripHtml; // returns 'Hacky hacky. Here is some text. This is bold.';
  /// ```
  String get stripHtml {
    if (isBlank) {
      return blankIfNull;
    }

    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'<[^>]*>');
    return replaceAll(regex, '');
  }

  /// Repeats the `String` [count] times.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foo';
  /// String fooRepeated = foo.repeat(5); // 'foofoofoofoofoo'
  /// ```
  String repeat([int count = 1]) {
    if (isBlank || count <= 0) {
      return blankIfNull;
    }
    var repeated = this;
    for (var i = 0; i < count - 1; i++) {
      repeated += this;
    }
    return repeated;
  }

  /// Squeezes the `String` by removing repeats of a given character.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foofoofoofoofoo';
  /// String fooSqueezed = foo.squeeze('o'); // 'fofofofofo';
  /// ```
  String squeeze(String char) {
    if (isBlank) {
      return blankIfNull;
    }

    var sb = '';
    for (var i = 0; i < length; i++) {
      if (i == 0 || this[i - 1] != this[i] || (this[i - 1] == this[i] && this[i] != char)) {
        sb += this[i];
      }
    }
    return sb;
  }

  /// Checks if the `String` is consisted of same characters (ignores cases).
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'ttttttt'
  /// bool hasSame1 = foo.hasSameCharacters(); // true;
  /// ```
  /// ```dart
  /// String foo = 'ttttttt12'
  /// bool hasSame2 = foo.hasSameCharacters();  // false;
  /// ```
  bool get hasSameCharacters {
    if (isBlank) {
      return false;
    }

    if (length > 1) {
      var b = this[0].toLowerCase();
      for (var i = 1; i < length; i++) {
        var c = this[i].toLowerCase();
        if (c != b) {
          return false;
        }
      }
    }
    return true;
  }

  /// Shuffles the given `String`'s characters.
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'esentis';
  /// String shuffled = foo.shuffle; // 'tsniees'
  /// ```
  String get shuffle {
    if (isBlank) {
      return blankIfNull;
    }

    var stringArray = toArray;
    stringArray.shuffle();
    return stringArray.join();
  }

  /// The Levenshtein distance between two words is the minimum number of single-character
  ///
  /// edits (insertions, deletions or substitutions) required to change one word into the other.
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'esentis';
  /// int dist = foo.getLevenshtein('esentis2'); // 1
  /// ```
  int getLevenshtein(String b, [bool caseSensitive = true]) {
    if (isBlank) {
      return b.length;
    }
    var a = this;
    if (!caseSensitive) {
      a = a.toLowerCase();
      b = b.toLowerCase();
    }

    List<int> costs = List<int>.filled(b.length + 1, 0);

    for (var j = 0; j <= b.length; j++) {
      costs[j] = j;
    }

    for (var i = 1; i <= a.length; i++) {
      int nw = costs[0];
      costs[0] = i;

      for (var j = 1; j <= b.length; j++) {
        int cj = min(1 + min(costs[j], costs[j - 1]), a[i - 1] == b[j - 1] ? nw : nw + 1);
        nw = costs[j];
        costs[j] = cj;
      }
    }

    return costs[b.length];
  }

  /// Inspired from Vincent van Proosdij.
  ///
  /// Formats the `String` with a specific mask.
  ///
  /// You can assign your own [specialChar], defaults to '#'.
  ///
  /// ### Example
  /// ```dart
  ///var string3 = 'esentisgreece';
  ///var mask3 = 'Hello ####### you are from ######';
  ///var masked3 = string3.formatWithMask(mask3); // returns 'Hello esentis you are from greece'
  /// ```
  String formatWithMask(String mask, {String specialChar = '#'}) {
    if (isBlank) {
      return blankIfNull;
    }

    //var buffer = StringBuffer();
    var maskChars = mask.toArray;
    var index = 0;
    var out = '';
    for (var m in maskChars) {
      if (m == specialChar) {
        if (index < length) {
          out += this[index];
          index++;
        }
      } else {
        out += m;
      }
    }
    return out;
  }

  /// Removes the first [n] characters from the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis'
  /// String newFoo = foo.removeFirst(3) // 'ntis';
  /// ```
  String removeFirst([int n = 1]) {
    if (isBlank) {
      return blankIfNull;
    }

    if (n <= 0) {
      return blankIfNull;
    }
    if (n >= length) {
      return '';
    }
    return substring(n, length);
  }

  /// Removes the last [n] characters from the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.removeLast(3); // 'esen';
  /// ```
  String removeLast([int n = 1]) {
    if (isBlank || n <= 0) {
      return blankIfNull;
    }

    if (n >= length) {
      return '';
    }
    return substring(0, length - n);
  }

  /// Trims the `String` to have maximum [n] characters.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.maxChars(3); // 'esen';
  /// ```
  String maxChars(int n) {
    if (isBlank || n >= length) {
      return blankIfNull;
    }

    if (n <= 0) {
      return '';
    }

    return substring(0, n);
  }

  /// Reverses slash in the `String`, by providing [direction],
  ///
  /// `0 = / -> \\`
  ///
  /// `1 = \\-> /`
  ///
  /// ### Example
  /// ```dart
  /// String foo1 = 'C:/Documents/user/test';
  /// String revFoo1 = foo1.reverseSlash(0); // returns 'C:\Documents\user\test'
  ///
  /// String foo2 = 'C:\\Documents\\user\\test';
  /// String revFoo2 = foo1.reverseSlash(1); // returns 'C:/Documents/user/test'
  /// ```
  String reverseSlash(int direction) {
    if (isBlank) {
      return blankIfNull;
    }

    switch (direction) {
      case 0:
        return replaceAll('/', '\\');
      case 1:
        return replaceAll('\\', '/');
      default:
        return blankIfNull;
    }
  }

  /// Returns the character at [index] of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo1 = 'esentis';
  /// String char1 = foo1.charAt(0); // returns 'e'
  /// String char2 = foo1.charAt(4); // returns 'n'
  /// String? char3 = foo1.charAt(-20); // returns ''
  /// String? char4 = foo1.charAt(20); // returns ''
  /// ```
  String charAt(int index) {
    if (isBlank) {
      return blankIfNull;
    }

    if (index > length) {
      return '';
    }
    if (index < 0) {
      return '';
    }
    return split('')[index];
  }

  /// Appends a [suffix] to the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'hello';
  /// String newFoo = foo1.append(' world'); // returns 'hello world'
  /// ```
  String append(String? suffix) {
    if (isBlank) {
      return suffix ?? "";
    }

    return this + (suffix ?? "");
  }

  /// Prepends a [prefix] to the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'world';
  /// String newFoo = foo1.prepend('hello '); // returns 'hello world'
  /// ```
  String prepend(String? prefix) {
    if (isBlank) {
      return prefix ?? "";
    }

    return (prefix ?? "") + this;
  }

  /// Tries to format the current `String` to price amount.
  ///
  /// You can optionally pass the [currencySymbol] to append a symbol to the formatted text.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String price = '1234567';
  /// String formattedPrice = foo1.toPriceAmount(currencySymbol: '€'); // returns '12.345,67 €'
  /// ```
  String toPriceAmount({String? currencySymbol}) {
    if (isBlank) {
      return blankIfNull;
    }

    try {
      var f = NumberFormat.currency(locale: 'el_GR');

      return f.format(double.tryParse(replaceAll(',', '.'))).replaceAll('EUR', '').trim().append(currencySymbol == null ? '' : ' $currencySymbol');
    } catch (e) {
      return blankIfNull;
    }
  }

  /// Returns the day name of the date provided in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.getDayFromDate(); // returns 'Saturday'
  /// String grDay = date.getDayFromDate(locale:'el'); // returns 'Σάββατο'
  /// ```
  String? getDayFromDate({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale).format(date).toString();
  }

  /// Returns the month name of the date provided in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String month = date.getMonthFromDate(); // returns 'August'
  /// String grMonth = date.getMonthFromDate(locale:'el'); // returns 'Αυγούστου'
  /// ```
  String? getMonthFromDate({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat('MMMM', locale).format(date).toString();
  }

  /// Returns the first day of the month from the provided `DateTime` in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.firstDayOfDate(); // returns 'Friday'
  /// String grDay = date.firstDayOfDate(locale:'el'); // returns 'Παρασκευή'
  /// ```
  String? firstDayOfMonth({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale).format(DateTime(date.year, date.month, 1)).toString();
  }

  /// Returns the last day of the month from the provided `DateTime` in `String` format.
  ///
  /// If the date is in `DateTime` format, you can convert it to `String` `DateTime().toString()`.
  ///
  /// You can provide the [locale] to filter the result to a specific language.
  ///
  /// Defaults to 'en-US'.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String date = '2021-10-23';
  /// String day = date.firstDayOfDate(); // returns 'Friday'
  /// String grDay = date.firstDayOfDate(locale:'el'); // returns 'Παρασκευή'
  /// ```
  String? lastDayOfMonth({String locale = 'en'}) {
    initializeDateFormatting(locale);
    if (isBlank) {
      return this;
    }

    var date = DateTime.tryParse(this);
    if (date == null) {
      return null;
    }
    return DateFormat('EEEE', locale)
        .format(
          DateTime(date.year, date.month + 1, 1).add(
            const Duration(days: -1),
          ),
        )
        .toString();
  }

  /// Returns the left side of the `String` starting from [char].
  ///
  /// If [char] doesn't exist, `null` is returned.
  /// ### Example
  ///
  /// ```dart
  ///  String s = 'peanutbutter';
  ///  String foo = s.getBefore('butter'); // returns 'peanut'
  /// ```
  String before(String char) {
    if (isBlank) {
      return blankIfNull;
    }

    int index = indexOf(char);
    if (index == -1) {
      return "";
    }

    return substring(0, index);
  }

  /// Returns the right side of the `String` starting from [char].
  ///
  /// If [char] doesn't exist, `null` is returned.
  ///
  /// ### Example
  ///
  /// ```dart
  ///  String s = 'peanutbutter';
  ///  String foo = s.rightOf('peanut'); // returns 'butter'
  /// ```
  String after(String char) {
    if (isBlank) {
      return blankIfNull;
    }

    int index = indexOf(char);

    if (index == -1) {
      return "";
    }
    return substring(index + char.length, length);
  }

  /// Returns the text between [before] and [after] strings.
  ///
  /// If [before] or [after] are not found, an empty string is returned.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = 'Hello [world]!';
  /// String result = text.between('[', ']'); // returns 'world'
  /// ```
  String between(String before, String after) => this.before(before).after(after);

  /// Truncates a long `String` in the middle while retaining the beginning and the end.
  ///
  /// [maxChars] must be more than 0.
  ///
  /// If [maxChars] > String.length the same `String` is returned without truncation.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String f = 'congratulations';
  /// String truncated = f.truncateMiddle(5); // Returns 'con...ns'
  /// ```
  String truncateMiddle(int maxChars) {
    if (isBlank || maxChars <= 0 || maxChars > length) {
      return blankIfNull;
    }

    int leftChars = (maxChars / 2).ceil();
    int rightChars = maxChars - leftChars;
    return '${first(leftChars)}...${last(rightChars)}';
  }

  /// Quotes the `String` adding "" at the start & at the end.
  ///
  /// Removes all " characters from the `String` before adding the quotes.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = '"""Is this real"';
  /// String quote = text.quote; // "Is this real"
  /// ```
  String get quote {
    if (isBlank) {
      return blankIfNull;
    }

    String normalizedString = replaceAll('"', '');

    return normalizedString.wrap('"');
  }

  /// Trims leading and trailing spaces from the `String`, so as extra spaces in between words.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = '    esentis    thinks   ';
  /// String trimmed = text.trimAll ; // returns 'esentis thinks'
  /// ```
  String get trimAll {
    if (isBlank) {
      return blankIfNull;
    }
    return splitLines.where((x) => x.isNotBlank).join("\r\n").replaceAll(RegExp(' +'), ' ').trim();
  }

  /// Try parse a bool value. See [asBool] to convert strings into [bool]
  bool? get toBool => bool.tryParse(this, caseSensitive: false);

  /// The Jaro distance is a measure of edit distance between two strings
  ///
  /// its inverse, called the Jaro similarity, is a measure of two `String`'s similarity:
  ///
  /// the higher the value, the more similar the strings are.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String t1 = 'esentis';
  /// String t2 = 'esen';
  /// print(t1.getJaro(t2)); // prints 0.8571428571428571
  /// ```
  double getJaro(String t) {
    if (isBlank) {
      return 1;
    }

    final int sLen = length;
    final int tLen = t.length;

    if (sLen == 0 && tLen == 0) return 1;

    final int matchDistance = (max(sLen, tLen) / 2 - 1).toInt();

    final List<bool> sMatches = List<bool>.filled(sLen, false);
    final List<bool> tMatches = List<bool>.filled(tLen, false);

    int matches = 0;
    int transpositions = 0;

    for (int i = 0; i < sLen; i++) {
      final int start = max(0, i - matchDistance);
      final int end = max(i + matchDistance + 1, tLen);

      for (int j = start; j < end; j++) {
        if (tMatches[j]) continue;
        if (charAt(i) != t.charAt(j)) continue;
        sMatches[i] = true;
        tMatches[j] = true;
        matches++;
        break;
      }
    }

    if (matches == 0) return 0;

    int k = 0;
    for (int i = 0; i < sLen; i++) {
      if (!sMatches[i]) continue;
      while (!tMatches[k]) {
        k++;
      }
      if (charAt(i) != t.charAt(k)) transpositions++;
      k++;
    }

    return ((matches / sLen) + (matches / tLen) + ((matches - transpositions / 2.0) / matches)) / 3.0;
  }

  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => trim().isEmpty;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => !isBlank;

  /// Return a empty `String` if [this] equals [comparisonString]. Otherwise return [this].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String t = 'OK'.emptyIf("OK"); // returns "";
  /// String f = 'NO'.emptyIf("YES"); // returns "NO";
  /// ```
  String emptyIf(String? comparisonString) => asIf((s) => s == comparisonString, "", this).blankIfNull;

  /// Return null if [this] equals [comparisonString]. Otherwise return [this].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String t = 'OK'.nullIf("OK"); // returns null;
  /// String f = 'NO'.nullIf("YES"); // returns "NO";
  /// ```
  String? nullIfEqual(String? comparisonString) => nullIf((s) => s == comparisonString);

  String? blankIfEqual(String? comparisonString) => blankIf((s) => s == comparisonString);

  String? nullIf(bool Function(String? s) fn) => asIf(fn, null, this);

  String blankIf(bool Function(String? s) fn) => asIf(fn, "", this) ?? "";

  /// Return [this] if not blank. Otherwise return [newString].
  S ifBlank<S extends string>(S newString) => asIf((s) => (s ?? "").isNotBlank, this, newString) as S;

  /// Compares [this] using [comparison] and returns [trueString] if true, otherwise return [falseString].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = 'OK'.asIf((s) => s == "OK", "is OK", "is not OK"); // returns "is OK";
  /// ```
  String? asIf(bool Function(String?) comparison, String? trueString, String? falseString) => comparison(this) ? trueString : falseString;

  /// Wraps the `String` between two strings. If [before] is a wrap char and [after] is omitted, the method resolve [after] using [getOppositeWrap].

  String wrap(String? before, [String? after]) {
    if (before.isBlank && after.isBlank) return blankIfNull;
    before = before.ifBlank("")!;

    if (after.isBlank && before.isNotBlank) {
      if (before.isMultipleCloseWrap || before.isCloseWrap) {
        before = before.getOppositeWrap;
      }
      after = before.getOppositeWrap;
    }

    if (after.isNotBlank && before.isBlank) {
      if (after!.isMultipleOpenWrap || after.isOpenWrap) {
        after = after.getOppositeWrap;
      }
      before = after.getOppositeWrap;
    }

    return "$before$this${after.ifBlank(before)!}";
  }

  /// Returns the opposite wrap char of the `String` if possible, otherwise returns the same `String`.
  ///
  /// ## Example
  ///
  /// ```dart
  /// String foo = '(';
  /// String oppositeFood = foo.getOppositeChar(); // returns ')';
  /// ```
  String get getOppositeWrap {
    if (length > 1 && (toArray.all((x) => x.isOpenWrap) || toArray.all((x) => x.isCloseWrap))) {
      return toArray.map((x) => x.getOppositeWrap).join();
    }

    switch (this) {
      case "(":
        return ")";
      case ")":
        return "(";
      case "[":
        return "]";
      case "]":
        return "[";
      case "{":
        return "}";
      case "}":
        return "{";
      case "<":
        return ">";
      case ">":
        return "<";
      case "\\":
        return "/";
      case "/":
        return "\\";
      case "/*":
        return "*/";
      case "*/":
        return "/*";
      case "¿":
        return "?";
      case "?":
        return "¿";
      case "!":
        return "¡";
      case "¡":
        return "!";
      default:
        return blankIfNull;
    }
  }

  /// Check if `String` is a open wrap char: `<`, `{`, `[`, `"`, `'`.
  /// ### Example
  ///
  /// ```dart
  /// bool isOpenWrap = "(".isOpenWrapChar(); // returns true;
  /// ```
  bool get isOpenWrap => isNotNull && StringHelpers.openWrappers.contains(this);

  bool get isMultipleOpenWrap => (length > 1 && (toArray.all((x) => x.isOpenWrap)));

  /// Check if the `String` is a close wrap char: `>`, `}`, `]`, `"`, `'`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool isCloseWrap = ")".isCloseWrapChar(); // returns true;
  /// ```
  bool get isCloseWrap => isNotNull && StringHelpers.closeWrappers.contains(this);

  bool get isMultipleCloseWrap => (length > 1 && (toArray.all((x) => x.isCloseWrap)));

  /// Continuously removes from the beginning of the `String` any match in [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentis".removeFirstAny(["s", "ng"]);// returns "esentis";
  /// ```
  String removeFirstAny(List<String?> patterns) {
    var from = this;
    if (from.isNotBlank) {
      for (var pattern in patterns) {
        if (pattern != null && pattern.isNotEmpty) {
          while (from.startsWith(pattern)) {
            from = from.removeFirst(pattern.length);
          }
        }
      }
    }
    return from.blankIfNull;
  }

  /// Continuously removes from the end of the `String`, any match in [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentisfs12".removeLastAny(["12","s","ng","f",]); // returns "esentis";
  /// ```
  String removeLastAny(List<String?> patterns) {
    var from = this;
    if (from.isNotBlank) {
      for (var pattern in patterns) {
        if (pattern != null && pattern.isNotEmpty) {
          while (from.endsWith(pattern)) {
            from = from.removeLast(pattern.length);
          }
        }
      }
    }
    return from.blankIfNull;
  }

  /// Continuously removes from the beginning & the end of the `String`, any match in [patterns].
  String removeFirstAndLastAny(List<String?> patterns) => removeFirstAny(patterns).removeLastAny(patterns);

  /// Removes the [pattern] from the end of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "coolboy".removeLastEqual("y"); // returns "coolbo";
  /// ```
  String removeLastEqual(String? pattern) => removeLastAny([pattern]);

  /// Removes any [pattern] match from the beginning of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "djing".removeFirstEqual("dj"); // returns "ing"
  /// ```
  String removeFirstEqual(String? pattern) => removeFirstAny([pattern]);

  /// Removes any [pattern] match from the beginning & the end of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String edited = "abracadabra".removeFirstAndLastEqual("a"); // returns "bracadabr";
  /// ```
  String removeFirstAndLastEqual(String? pattern) => removeFirstEqual(pattern).removeLastEqual(pattern);

  /// Removes everything in the `String` after the first match of the [pattern].
  ///
  /// ### Example
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.removeAfter('brother'); // returns 'hello ';
  /// ```
  String removeAfter(String pattern) {
    if (isBlank) {
      return blankIfNull;
    }

    if (!contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfLastPatternWord = indexOf(patternWords.last);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return substring(0, indexOfLastPatternWord);
  }

  /// Removes everything in the `String` before the match of the [pattern].
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.removeBefore('brother'); // returns 'brother what a day today';
  /// ```
  String removeBefore(String pattern) {
    if (isBlank) {
      return blankIfNull;
    }

    if (!contains(pattern)) {
      return '';
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfFirstPatternWord = indexOf(patternWords.first);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return substring(
      indexOfFirstPatternWord + 1,
      length,
    );
  }

  /// Adds a `String` after the first match of the [pattern]. The [pattern] should not be `null`.
  ///
  /// If there is no match, the `String` is returned unchanged.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.addAfter('brother', ' sam '); // returns 'hello brother sam what a day today ';
  /// ```
  String addAfter(String pattern, String addition) {
    if (isBlank) {
      return blankIfNull;
    }

    if (!contains(pattern)) {
      return blankIfNull;
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfLastPatternWord = indexOf(patternWords.last);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return substring(0, indexOfLastPatternWord + 1) + addition + substring(indexOfLastPatternWord + 1, length);
  }

  /// Adds a `String` before the first match of the [pattern]. The [pattern] should not be `null`.
  ///
  /// If there is no match, the `String` is returned unchanged.
  ///
  /// ### Example
  /// ```dart
  /// String test = 'hello brother what a day today';
  /// String afterString = test.addBefore('brother', 'big '); // returns 'hello big brother what a day today';
  /// ```
  String addBefore(String pattern, String adition) {
    if (isBlank) {
      return blankIfNull;
    }

    if (!contains(pattern)) {
      return blankIfNull;
    }

    List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    int indexOfFirstPatternWord = indexOf(patternWords.first);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return substring(0, indexOfFirstPatternWord) +
        adition +
        substring(
          indexOfFirstPatternWord,
          length,
        );
  }

  /// Checks if the `String` matches **ANY** of the given [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool contains = "abracadabra".containsAny(["a", "p"]); // returns true;
  /// ```
  bool containsAny(List<String?> patterns) {
    if (isNotBlank) {
      for (String? item in patterns.where((element) => element.isNotBlank)) {
        if (contains(item!)) {
          return true;
        }
      }
    }
    return false;
  }

  /// Checks if the `String` matches **ALL** given [patterns].
  ///
  /// ### Example
  ///
  /// ```dart
  /// bool contains = "abracadabra".containsAll(["abra", "cadabra"]; // returns true;
  /// ```
  bool containsAll(List<String?> patterns) {
    for (String? item in patterns.where((element) => element.isNotBlank)) {
      if (isBlank || contains(item!) == false) {
        return false;
      }
    }
    return true;
  }

  /// Returns the MD5 hash of the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String md5 = '123456'.md5; // returns "e10adc3949ba59abbe56e057f20f883e";
  /// ```
  String get md5 {
    String data = this;
    if (data.isNotBlank) {
      var content = const Utf8Encoder().convert(data);
      var md5 = crypto.md5;
      var digest = md5.convert(content);
      data = hex.encode(digest.bytes);
    }
    return data;
  }

  /// Formats the `String` to show its proper file size.
  ///
  /// If the `String` is not a valid integer, it is returned unchanged.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = '24117248';
  /// String formatted = foo.formatFileSize; // returns '23 MB';
  /// ```
  String get formatFileSize {
    if (isBlank) {
      return blankIfNull;
    }
    if (isNumber) {
      return toDouble!.formatFileSize;
    }
    return this;
  }

  /// Transforms the `String` to 1337 alphabet.
  ///
  /// The letters are randomized since each letter can have multiple variations.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'esentis';
  /// String leet = foo.toLeet ; // returns '€5£п+!$';
  /// ```
  String get toLeet {
    if (isBlank) {
      return blankIfNull;
    }
    final letters = split('');

    final leetLetters = [];
    for (var e in letters) {
      final count = StringHelpers.leetAlphabet[e].length;
      final random = Random().nextInt(count);
      leetLetters.add(StringHelpers.leetAlphabet[e][random]);
    }

    return leetLetters.join();
  }

  /// Checks if the `String` provided is a valid credit card number using Luhn Algorithm.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String cc = '5104 4912 8031 9406';
  /// bool isCreditCard = cc.isCreditCard ; returns true;
  /// ```
  bool get isCreditCard {
    if (isBlank) {
      return false;
    }

    String trimmed = removeWhiteSpace;

    int sum = 0;
    bool alternate = false;
    for (int i = trimmed.length - 1; i >= 0; i--) {
      List<String> nx = trimmed.toArray;
      int n = int.parse(nx[i]);

      if (alternate) {
        n *= 2;

        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return (sum % 10 == 0);
  }

  /// Removes all whitespace from the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = '   Hel l o W   orld';
  /// String striped = foo.removeWhiteSpace; // returns 'HelloWorld';
  /// ```
  String get removeWhiteSpace {
    if (isBlank) {
      return blankIfNull;
    }
    return replaceAll(RegExp(r'\s+'), '');
  }

  bool get isIP => isIPv4 || isIPv6;

  bool get isIPv4 {
    if (isBlank) return false;
    // Divide a string em partes usando o ponto como delimitador
    final parts = split('.');

    // Deve haver exatamente 4 partes
    if (parts.length != 4) {
      return false;
    }

    // Verifica se cada parte é um número inteiro entre 0 e 255
    for (final part in parts) {
      final intValue = int.tryParse(part);
      if (intValue == null || intValue < 0 || intValue > 255) {
        return false;
      }
    }

    return true;
  }

  /// Checks whether the `String` is in lowercase.
  bool get isLowerCase {
    if (isBlank) {
      return false;
    }
    return this == toLowerCase();
  }

  /// Checks whether the `String` is in uppercase.
  bool get isUpperCase {
    if (isBlank) {
      return false;
    }
    return this == toUpperCase();
  }

  /// Swaps the case in the `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// String swapped = foo.swapCase(); // returns 'hELLO wORLD';
  /// ```
  String swapCase() {
    if (isBlank) {
      return blankIfNull;
    }

    List<String> letters = toArray;

    String swapped = '';

    for (final l in letters) {
      if (l.isUpperCase) {
        swapped += l.toLowerCase();
      } else {
        swapped += l.toUpperCase();
      }
    }
    return swapped;
  }

  /// Checks whether the provided `String` is a valid Swift code.
  bool? get isSwiftCode {
    var regex = RegExp(r'(^[A-Za-z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$)');
    return regex.hasMatch(this);
  }

  /// Returns the digit count of the `String`.
  ///
  ///### Example
  ///
  ///```dart
  ///String foo = 'Hello World';
  ///int digitCount = foo.getDigitCount(); // returns 0;
  ///```
  ///
  ///```dart
  ///String foo = 'Hello World 123';
  ///int digitCount = foo.getDigitCount(); // returns 3;
  ///```
  int get digitCount {
    if (isBlank) {
      return 0;
    }
    RegExp digitsOnly = RegExp(r'\d');
    return digitsOnly.allMatches(this).length;
  }

  /// Checks whether the `String` is a valid ASCII string.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAscii = foo.isAscii; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'œ∑´®†¥¨ˆøπ';
  /// bool isAscii = foo.isAscii; // returns false;
  /// ```
  bool get isAscii {
    if (isEmpty) {
      return true;
    }
    final ascii = RegExp(r'^[\x00-\x7F]+$');
    return ascii.hasMatch(this);
  }

  /// Checks whether the `String` is an anagram of the provided `String`.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAnagram = foo.isAnagram('World Hello'); // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isAnagram = foo.isAnagram('World Hello!'); // returns false;
  /// ```
  bool isAnagramOf(String s) {
    if (isBlank || s.isBlank) {
      return false;
    }
    final String word1 = removeWhiteSpace;

    final String word2 = s.removeWhiteSpace;

    if (word1.length != word2.length) {
      return false;
    }

    Map<String, int> charCount = {};

    word1.split('').forEach((char) => charCount[char] = (charCount[char] ?? 0) + 1);

    word2.split('').forEach((char) => charCount[char] = (charCount[char] ?? 0) - 1);

    return charCount.values.every((count) => count == 0);
  }

  /// Checks whether the `String` is a palindrome.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isPalindrome = foo.isPalindrome; // returns false;
  /// ```
  ///
  /// ```dart
  /// String foo = 'racecar';
  /// bool isPalindrome = foo.isPalindrome; // returns true;
  /// ```
  bool get isPalindrome {
    if (isBlank) {
      return false;
    }
    return this == reverse;
  }

  /// Checks whether the `String` is consisted of both upper and lower case letters.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isMixedCase = foo.isMixedCase; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'hello world';
  /// bool isMixedCase = foo.isMixedCase; // returns false;
  ///
  bool isMixedCase() {
    if (isBlank) {
      return false;
    }
    return toUpperCase() != this && toLowerCase() != this;
  }

  /// Checks whether the `String` is consisted of only unique characters.
  ///
  /// Returns true `String` if the `String` is empty.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool isUnique = foo.isUnique; // returns false;
  /// ```
  ///
  /// ```dart
  /// String foo = 'hello world';
  /// bool isUnique = foo.isUnique; // returns true;
  /// ```
  bool isUnique() {
    if (isBlank) {
      return true;
    }
    final word = this;
    final wordSplit = word.toUpperCase().split('').toSet();
    return word.length == wordSplit.length;
  }

  /// Returns a `Set` of the common characters between the two `String`s.
  ///
  /// The `String` is case sensitive & sorted by default.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// List<String> commonLetters = foo.commonCharacters('World Hello'); // returns ['H', 'e', 'l', 'o', 'r', 'w', 'd'];
  /// ```
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// List<String> commonLetters = foo.commonCharacters('World Hello!'); // returns ['H', 'e', 'l', 'o', 'r', 'w', 'd'];
  /// ```
  Set<String> commonCharacters(
    String otherString, {
    bool caseSensitive = true,
    bool sort = true,
    bool includeSpaces = false,
  }) {
    if (isBlank) {
      return {};
    }

    String processString(String input) {
      return (caseSensitive ? input : input.toLowerCase()).split('').where((char) => includeSpaces || char != ' ').join('');
    }

    final Set<String> commonLettersSet = {};
    final Set<String> otherStringSet = processString(otherString).split('').toSet();

    for (final letter in processString(this).split('')) {
      if (otherStringSet.contains(letter)) {
        commonLettersSet.add(letter);
      }
    }

    if (sort) {
      final List<String> sortedList = commonLettersSet.toList()..sort();
      return sortedList.toSet();
    } else {
      return commonLettersSet;
    }
  }

  /// Returns a Set of the uncommon characters between the two `String`s.
  ///
  /// The `String` is case sensitive & sorted by default.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// List<String> uncommonLetters = foo.uncommonCharacters('World Hello'); // returns {};
  /// ```
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// List<String> uncommonLetters = foo.uncommonCharacters('World Hello!'); // returns {'!'};
  /// ```
  Set<String> uncommonCharacters(
    String otherString, {
    bool caseSensitive = true,
    bool includeSpaces = false,
  }) {
    if (isBlank) {
      return {};
    }

    String processString(String input) => (caseSensitive ? input : input.toLowerCase()).split('').where((char) => includeSpaces || char != ' ').join('');

    final Set<String> thisSet = processString(this).split('').toSet();
    final Set<String> otherStringSet = processString(otherString).split('').toSet();

    final Set<String> uncommonSet = thisSet.union(otherStringSet).difference(thisSet.intersection(otherStringSet));

    return uncommonSet;
  }

  /// Checks whether all characters are contained in the `String`.
  ///
  /// The method is case sensitive by default.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool containsAll = foo.containsAllCharacters('Hello'); // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool containsAll = foo.containsAllCharacters('Hello!'); // returns false;
  /// ```
  bool containsAllCharacters(String characters) {
    if (isBlank) {
      return false;
    }
    final Map<String, int> letterCounts = {};

    split('').forEach((letter) {
      letterCounts[letter] = (letterCounts[letter] ?? 0) + 1;
    });

    for (final letter in characters.split('')) {
      if (letterCounts[letter] == null || letterCounts[letter]! <= 0) {
        return false;
      }
      letterCounts[letter] = letterCounts[letter]! - 1;
    }

    return true;
  }

  /// Checks whether the `String` has any whitespace characters.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String foo = 'Hello World';
  /// bool hasWhitespace = foo.hasWhitespace; // returns true;
  /// ```
  ///
  /// ```dart
  /// String foo = 'HelloWorld';
  /// bool hasWhitespace = foo.hasWhitespace; // returns false;
  /// ```
  bool get hasWhitespace {
    if (isBlank) {
      return false;
    }
    return contains(RegExp(r'\s'));
  }

  /// Returns `true` if the `String` contains only letters (Latin or Greek).
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = 'hello world';
  /// bool isLettersOnly = text.isLettersOnly(); // Returns true
  /// ```
  bool get isLettersOnly {
    if (isBlank) {
      return false;
    }
    final onlyLetters = this.onlyLetters;

    return onlyLetters.length == length;
  }

  /// Inserts a `String` at the specified index.
  ///
  /// If the `String` is `null`, an `ArgumentError` is thrown.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = 'hello world';
  /// String newText = text.insertAt(5, '!');
  /// print(newText); // prints 'hello! world'
  /// ```
  String insertAt(int i, String value) {
    if (i < 0) {
      i = 0;
    }
    if (i > length) {
      i = length;
    }
    final start = substring(0, i);
    final end = substring(i);
    return start + value + end;
  }

  /// Splits the `String` into a `List` of lines ('\r\n' or '\n').
  ///
  /// If the `String` is `null`, an `ArgumentError` is thrown.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = 'hello\nworld';
  /// List<String> lines = text.splitLines();
  /// print(lines); // prints ['hello', 'world']
  /// ```
  List<String> get splitLines => split(RegExp(r'\r?\n'));

  /// Returns a new `String` with the first occurrence of the given pattern replaced with the replacement `String`.
  ///
  /// If the `String` is `null`, an `ArgumentError` is thrown.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentis".replaceFirst("s", "S"); // returns "eSentis";
  /// ```
  String replaceFirst(String pattern, String replacement) {
    int index = indexOf(pattern);
    if (index == -1) {
      return this;
    }
    return replaceRange(index, index + pattern.length, replacement);
  }

  /// Returns a new `String` with the last occurrence of the given pattern replaced with the replacement `String`.
  ///
  /// If the `String` is `null`, an `ArgumentError` is thrown.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String s = "esentis".replaceLast("s", "S"); // returns "esentiS";
  /// ```
  String replaceLast(String pattern, String replacement) {
    int index = lastIndexOf(pattern);
    if (index == -1) {
      return this;
    }
    return replaceRange(index, index + pattern.length, replacement);
  }

  /// Capitalize each word inside string
  /// Example: your name => Your Name
  String get capitalize {
    if (isEmpty) return blankIfNull;
    return split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  String get capitalizeFirst {
    if (isEmpty) return blankIfNull;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Remove all whitespace inside string
  /// Example: your name => yourname
  String removeAllWhitespace() => replaceAll(' ', '');

  String replaceMustachesWithList(List<dynamic> params) => replaceWrappedWithList(values: params, openWrapChar: '{{');

  String replaceMustachesWithMap(Map<String, dynamic> params) => replaceWrappedWithMap(values: params, openWrapChar: "{{");

  String replaceWrappedWithMap({required Map<String, dynamic> values, required String openWrapChar, String? closeWrapChar}) {
    if (isBlank) return blankIfNull;

    string text = this;
    values.forEach((key, value) {
      String wrappedKey = key.wrap(openWrapChar, closeWrapChar);
      text = text.replaceAll(wrappedKey, value?.toString() ?? "");
    });
    return text;
  }

  String replaceWrappedWithList({required List<dynamic> values, required String openWrapChar, String? closeWrapChar}) {
    if (isBlank) return blankIfNull;
    return replaceWrappedWithMap(values: values.toMap((x) => MapEntry(values.indexOf(x).toString(), x)), openWrapChar: openWrapChar, closeWrapChar: closeWrapChar);
  }

  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  bool get isNumericOnly => hasMatch(r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool get isAlphabetOnly => hasMatch(r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  bool get hasCapitalletter => hasMatch(r'[A-Z]');

  /// Checks if string is boolean.
  bool get isBool => (this == 'true' || this == 'false');

  /// return a date from string
  date toDate([string? format, string? locale]) {
    try {
      return DateFormat(format, locale).parse(this);
    } catch (e) {
      return date.parse(this);
    }
  }

  /// Checks if a given [value] matches a [mask] pattern.
  ///
  /// The [mask] pattern can contain wildcard characters:
  /// - `*` matches any sequence of characters (including an empty sequence).
  /// - `?` matches any single character.
  ///
  /// Returns `true` if the [value] matches the [mask] pattern, `false` otherwise.
  bool isLike(string mask) => RegExp('^${RegExp.escape(mask).replaceAll('\\*', '.*').replaceAll('\\?', '.').toString()}\$', multiLine: true).hasMatch(this);

  /// change a date string from a format to another format
  string changeDateFormat(string toFormat, [string? fromFormat, string? locale]) => toDate(fromFormat, locale).format(toFormat);

  /// Interprets a string in various ways and transforms it into a `Size` object.
  ///
  /// Returns a `Size` object.
  Size get toSize {
    var text = this;
    text = text.replaceMany(["px", ";"], " ").toLowerCase().trimAll;
    text = text.replaceMany(["largura", "width", "a "], "w ");
    text = text.replaceMany(["altura", "height", "l "], "h ");

    try {
      if (text.isNumericOnly) {
        return Size(text.trimAll.toDoubleOrZero, text.trimAll.toDoubleOrZero);
      } else if (text.isLike("width*") && !text.isLike("*height*")) {
        return Size(text.after("width").trimAll.toDoubleOrZero, text.after("width").trimAll.toDoubleOrZero);
      } else if (text.isLike("height*") && !text.isLike("*width*")) {
        return Size(text.after("height").trimAll.toDoubleOrZero, text.after("height").trimAll.toDoubleOrZero);
      } else if (text.isLike("w*") && !text.isLike("*h*")) {
        return Size(text.after("w").trimAll.toDoubleOrZero, text.after("w").trimAll.toDoubleOrZero);
      } else if (text.isLike("h*") && !text.isLike("*w*")) {
        return Size(text.after("h").trimAll.toDoubleOrZero, text.after("h").trimAll.toDoubleOrZero);
      } else if (text.isLike("width*height*")) {
        return Size(text.between("width", "height").trimAll.toDoubleOrZero, text.after("height").trimAll.toDoubleOrZero);
      } else if (text.isLike("height*width*")) {
        return Size(text.between("height", "width").trimAll.toDoubleOrZero, text.after("width").trimAll.toDoubleOrZero);
      } else if (text.isLike("w*h*")) {
        return Size(text.between("w", "h").trimAll.toDoubleOrZero, text.after("h").trimAll.toDoubleOrZero);
      } else if (text.isLike("h*w*")) {
        return Size(text.between("h", "w").trimAll.toDoubleOrZero, text.after("w").trimAll.toDoubleOrZero);
      } else if (text.isLike("*x*")) {
        return Size(text.split("x").first.trimAll.toDoubleOrZero, text.split("x").last.trimAll.toDoubleOrZero);
      } else if (text.isLike("*by*")) {
        return Size(text.split("by").first.trimAll.toDoubleOrZero, text.split("by").last.trimAll.toDoubleOrZero);
      } else if (text.isLike("*por*")) {
        return Size(text.split("por").first.trimAll.toDoubleOrZero, text.split("por").last.trimAll.toDoubleOrZero);
      } else if (text.isLike("*,*")) {
        return Size(text.split(",").first.trimAll.toDoubleOrZero, text.split(",").last.toDoubleOrZero);
      } else if (text.isLike("*-*")) {
        return Size(text.split("-").first.trimAll.toDoubleOrZero, text.split("-").last.trimAll.toDoubleOrZero);
      } else if (text.isLike("*_*")) {
        return Size(text.split("_").first.trimAll.toDoubleOrZero, text.split("_").last.trimAll.toDoubleOrZero);
      } else if (text.isLike("*:*")) {
        return Size(text.split("_").first.trimAll.toDoubleOrZero, text.split("_").last.trimAll.toDoubleOrZero);
      } else {
        return Size(text.split(" ").first.trimAll.toDoubleOrZero, text.split(" ").last.trimAll.toDoubleOrZero);
      }
    } catch (e) {
      return Size.zero;
    }
  }

  /// Returns the first element after splitting the string using the specified [pattern].
  /// If the string cannot be split, it returns the original string.
  string firstSplit(Pattern pattern) => split(pattern).first;

  /// Returns the last element after splitting the string using the specified [pattern].
  /// If the string cannot be split, it returns the original string.
  string lastSplit(Pattern pattern) => split(pattern).last;

  /// Splits the string using the specified [pattern] and returns a list containing the last element and the remaining elements joined by the [pattern].
  /// If the string cannot be split, it returns a list containing the original string.
  List<string> splitLast(string pattern) {
    var parts = split(pattern);
    if (parts.length < 2) {
      return [this];
    }
    var last = parts.removeLast();
    return [parts.join(pattern), last];
  }

  /// Splits the string using the specified [pattern] and returns a list containing the first element and the remaining elements joined by the [pattern].
  /// If the string cannot be split, it returns a list containing the original string.
  List<string> splitFirst(string pattern) {
    var parts = split(pattern);
    if (parts.length < 2) {
      return [this];
    }
    var first = parts.removeAt(0);
    return [first, parts.join(pattern)];
  }

  Future<List<String>> fetchGoogleSuggestions({string language = ""}) async {
    if (isNotBlank) {
      final url = Uri.https('suggestqueries.google.com', '/complete/search', {
        'output': 'toolbar',
        if (language.isNotBlank) 'hl': language,
        'q': this,
        'gl': 'in',
      });
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // Parse the XML response
          final xmlData = response.body;
          // Extract suggestions from the XML (you can use an XML parsing library)
          // For simplicity, let's assume the suggestions are separated by '<suggestion data="..."/>'
          final suggestionRegex = RegExp(r'<suggestion data="([^"]+)"');
          final matches = suggestionRegex.allMatches(xmlData);
          final suggestions = matches.map((match) => match.group(1)?.urlDecode.trimAll).distinct().toList();
          return suggestions.whereNotNull().toList();
        }
      } catch (e) {
        consoleLog('Error fetching suggestions: $e');
      }
    }
    return [];
  }
}
