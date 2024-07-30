extension MapExtensions<K, V> on Map<K, V> {
  /// Function to convert the map into a List<T>.
  /// Takes a function as parameter that defines how the key and value are mapped into T
  List<T> toList<T>(T Function(K key, V value) mapFunction) => entries.map((e) => mapFunction(e.key, e.value)).toList();
}
