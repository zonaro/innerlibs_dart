import 'package:innerlibs/innerlibs.dart';

/// Implement a validator in your class
abstract class Validator {
  /// Function thats return an empty list if this instance is valid,
  /// otherwise return a [List<string>]  with messages,
  /// explaining whats is not valid in this class.
  strings validate();
}
