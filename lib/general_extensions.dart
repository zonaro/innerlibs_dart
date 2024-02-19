import 'package:innerlibs/innerlibs.dart';

extension ObjectExtensions on Object? {
  // return a string of this object as a SQL Value
  String asSqlValue([nullAsBlank = false]) {
    if (this == null) {
      return nullAsBlank ? "''" : "NULL";
    } else if (this is num) {
      return toString();
    } else if (this is bool) {
      return this == true ? "1" : "0";
    } else if (this is DateTime) {
      return "'${(this as DateTime).toIso8601String()}'";
    } else {
      string s = "$this";
      if (s.isBlank && nullAsBlank == false) {
        return 'NULL';
      } else {
        return "'${this!.toString().replaceAll("'", "''")}'";
      }
    }
  }

  /// Checks if [this] is a Blank value:
  ///( Null, empty or only white spaces for [String], 0 for [num] , [DateExtension.min] for [DateTime], Call [isNotValid] recursively on [List] or [Map] values. Other class types, call [ToString()] and check ).
  bool get isValid {
    try {
      if (this == null) {
        return false;
      }
      if (this is String) {
        return (this as String).trim().isNotEmpty;
      }
      if (this is num) {
        return this != 0;
      }
      if (this is DateTime) {
        return (this as DateTime) != DateExtensions.min;
      }

      if (this is Iterable) {
        var l = (this as Iterable);
        if (l.isEmpty) return false;
        for (var e in l) {
          if ((e as Object?).isValid) {
            return true;
          }
        }
      }
      if (this is Map) {
        var m = (this as Map);
        return m.isNotEmpty && m.values.isValid;
      }

      return toString().isValid;
    } catch (e) {
      return false;
    }
  }

  /// Checks if [this] is not a Blank value:
  ///( Null, empty or only white spaces for [String], 0 for [num] , [DateExtension.min] for [DateTime], Call [isNotValid] recursively on [List] or [Map] values. Other class types, call [ToString()] and check ).
  bool get isNotValid => !isValid;

  bool asBool({bool everythingIsTrue = true}) => asNullableBool(everythingIsTrue: everythingIsTrue) ?? false;

  bool? asNullableBool({bool everythingIsTrue = true}) {
    if (this == null) return null;
    var x = '$this'.toUpperCase().removeDiacritics();
    switch (x) {
      case 'NULL':
      case 'CANCEL':
      case 'CANCELAR':
        return null;
      case '':
      case '!':
      case '0':
      case 'FALSE':
      case 'NOT':
      case 'NAO':
      case 'NO':
      case 'NOP':
      case 'DISABLED':
      case 'DISABLE':
      case 'OFF':
      case 'DESATIVADO':
      case 'DESATIVAR':
      case 'DESATIVO':
      case 'N':
        return false;
      case '1':
      case 'S':
      case 'TRUE':
      case 'YES':
      case 'YEP':
      case 'SIM':
      case 'ENABLED':
      case 'ENABLE':
      case 'ON':
      case 'Y':
      case 'ATIVO':
      case 'ATIVAR':
      case 'ATIVADO':
        return true;
      default:
        return everythingIsTrue ? true : throw ArgumentError('The object does not represent a valid option and the EverythingIsTrue flag is set to false.');
    }
  }
}
