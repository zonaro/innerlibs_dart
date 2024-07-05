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
