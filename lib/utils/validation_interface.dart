/// The `Validator` class is used to implement validation logic in other classes.
abstract class Validator {
  /// Validates the current instance and returns a list of error messages if the instance is invalid.
  ///
  /// Returns an empty list if the instance is valid.
  ///
  /// Example usage:
  /// ```dart
  /// class MyValidator implements Validator {
  ///   @override
  ///   List<String> validate() {
  ///     List<String> errors = [];
  ///
  ///     // Perform validation logic here
  ///
  ///     return errors;
  ///   }
  /// }
  /// ```
  List<String> validate();
}

extension ValidatorClassExtensions on Validator {
  /// Returns `true` if the instance is valid, otherwise returns `false`.
  bool get isValid => validate().isEmpty;

  /// Returns `true` if the instance is invalid, otherwise returns `false`.
  bool get isNotValid => !isValid;
}
