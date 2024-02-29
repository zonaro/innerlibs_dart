/// implement a validator in your class
abstract class Validator {
  /// Function thats return null if this instance is valid, otherwise return a message thats explain whats is not valid in this class
  String? validate();
}
