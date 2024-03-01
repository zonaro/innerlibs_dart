extension BooleanExtensions on bool? {
  /// Returns [true] if the value is not null and true.
  /// Otherwise [false] is returned.
  bool get isTrue => this != null && this == true;

  /// Returns [true] if the value is not null and false.
  /// Otherwise [false] is returned.
  bool get isFalse => this != null && this == false;

  /// Returns [true] if the value is null or false.
  /// Otherwise [false] is returned.
  bool get isNotTrue => this == null || this == false;

  /// Returns [true] if the value is null and true.
  /// Otherwise [false] is returned.
  bool get isNotFalse => this == true;
  

  bool? get toNullableBool => this;

  /// Returns `1` if the value is `false`
  /// otherwise `0` is returned.
  int get toInt => toNullableInt ?? 0;

  int? get toNullableInt => this != null ? (this! ? 1 : 0) : null;
}
