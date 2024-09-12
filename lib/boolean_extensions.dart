extension BooleanExtensions on bool? {
  /// Returns `1` if the value is `true`
  /// otherwise `0` is returned.
  int get toInt => toNullableInt ?? 0;

  bool? get toNullableBool => this;

  int? get toNullableInt => this != null ? (this! ? 1 : 0) : null;
}
