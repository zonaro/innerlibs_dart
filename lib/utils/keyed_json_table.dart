import 'dart:collection';

import 'package:innerlibs/innerlibs.dart';

/// A class representing a keyed JSON table.
///
/// This class extends the `Iterable` class and provides functionality for working with a table of JSON rows.
/// Each row in the table is associated with a unique key value.
///
/// The `KeyedJsonTable` class has the following properties and methods:
/// - `keyName`: The name of the key field in each JSON row.
/// - `table`: The underlying `JsonTable` that holds the JSON rows.
/// - `operator []`: Retrieves the JSON row with the specified key.
/// - `operator []=`: Sets the JSON row with the specified key.
/// - `addAll`: Adds multiple JSON rows to the table.
/// - `add`: Adds a single JSON row to the table.
/// - `containsKey`: Checks if a JSON row with the specified key exists in the table.
/// - `remove`: Removes the JSON row with the specified key from the table.
/// - `clear`: Clears all the JSON rows from the table.
///
/// Example usage:
/// ```dart
/// var table = KeyedJsonTable<int>(keyName: 'id');
/// table.addAll(JsonTable.fromList([
///   {'id': 1, 'name': 'John'},
///   {'id': 2, 'name': 'Jane'},
/// ]));
///
/// var row = table[1];
/// print(row); // {'id': 1, 'name': 'John'}
///
/// table[2] = {'id': 2, 'name': 'Jane Doe'};
///
/// print(table.containsKey(2)); // true
///
/// table.remove(1);
/// print(table.length); // 1
///
/// table.clear();
/// print(table.isEmpty); // true
/// ```

class KeyedJsonTable<T extends Comparable> extends Iterable<JsonRow> {
  final string keyName;
  late JsonTable table;

  /// Constructs a [KeyedJsonTable] with the specified [keyName] and [items].
  KeyedJsonTable({
    required this.keyName,
    JsonTable items = const [],
  }) {
    table = items.toList(growable: true);
  }

  /// Returns the [JsonRow] with the specified [key], or `null` if not found.
  JsonRow? operator [](T key) => table.where((row) => ((row[keyName] as Object?).parseTo<T>()) == key).singleOrNull;

  /// Sets the [JsonRow] with the specified [key] to the given [values].
  void operator []=(T key, JsonRow values) {
    var m = this[key];
    m = m ?? values;
    m.addAll(values);
  }

  /// Returns a pair of values computed from the given [key] using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  (T1, T2) getPair<T1, T2>(T key, T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => (keyFunc(this[key]!), valueFunc(this[key]!));

  /// Returns a [MapEntry] with the key and value computed from the given [key] using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  MapEntry<T1, T2> getMapEntry<T1, T2>(T key, T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => MapEntry(keyFunc(this[key]!), valueFunc(this[key]!));

  /// Returns a list of pairs computed from the elements in the table using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  List<(T1, T2)> getPairs<T1, T2>(T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => this.table.where((e) => e[keyName] != null).map((e) => getPair(e[keyName] as T, keyFunc, valueFunc)).toList();

  /// Returns a map computed from the elements in the table using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  Map<T1, T2> getMap<T1, T2>(T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => Map.fromEntries(table.where((e) => e[keyName] != null).map((e) => getMapEntry(e[keyName] as T, keyFunc, valueFunc)));

  /// Add rows to this JsonTable. Only rows with valid Ids will be added. Return a list of IDs
  List<T> addAll(JsonTable rows, [bool override = false]) {
    List<T> pks = [];
    for (var newRow in rows) {
      T? pk = add(newRow, override);
      if (pk.isValid()) {
        pks.add(pk as T);
      }
    }
    return pks;
  }

  /// Add a row to this JsonTable. Only rows with valid Ids will be added. Return the ID
  T? add(JsonRow row, [bool override = false]) {
    var pk = row[keyName] as T;
    if (pk.isValid()) {
      var exist = this[pk];
      if (exist == null || override) {
        this[pk] = row;
        return pk;
      }
    }
    return null;
  }

  /// Returns the value associated with the specified [key] in the [JsonRow].
  /// The [key] must be of type [T].
  T getKey(JsonRow row) => row[keyName] as T;

  /// Checks if the list contains the specified [key].
  /// Returns `true` if the [key] is found, `false` otherwise.
  bool containsKey(T key) => this[key] != null;

  /// Removes the [JsonRow] with the specified [key] from the list.
  /// Returns the removed [JsonRow], or `null` if the [key] is not found.
  JsonRow? remove(T key) => table.detachItems((e) => e[keyName] == key).singleOrNull;

  /// Removes all elements from the list.
  void clear() => table.clear();

  /// Returns an iterator over the elements in the list.
  ///
  /// The iterator provides access to the elements of the list in the same order as they appear in the list.
  /// Each call to [next] returns the next element in the list until there are no more elements.
  ///
  /// Example usage:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// Iterator<int> iterator = numbers.iterator;
  /// while (iterator.moveNext()) {
  ///   print(iterator.current);
  /// }
  /// ```
  @override
  Iterator<JsonRow> get iterator => table.iterator;
}

extension ListMapExtension<K, V> on JsonTable {
  /// Converts a list of maps to a keyed JSON table.
  KeyedJsonTable<T> toKeyedTable<T extends Comparable>(String keyName) => KeyedJsonTable<T>(keyName: keyName, items: this);
}

/// A map implementation that uses a function to generate keys for each value.
class SelfMap<K, V> implements MapBase<K, V> {
  /// Creates a new instance of [SelfMap] with the provided [items] and [keyFunc].
  ///
  /// The [keyFunc] is a function that generates a key for each value in the [items] list.
  /// A copy of [items] list is used to initialize the map.
  /// If [keyFunc] is not provided, the default key function is used, which returns the hash code of the value.
  /// The default key function is used to ensure that the keys are unique.
  /// If the [items] list contains duplicate keys, only the first value with the key is retained.
  /// 
  SelfMap(List<V> items, [K Function(V)? keyFunc]) {
    this._keyFunc = keyFunc ?? ((e) => e.hashCode as K);
    this._items = items.distinctBy(this._keyFunc).toList();
  }

  late K Function(V) _keyFunc;

  late List<V> _items;

  @override
  V? operator [](Object? key) {
    return _items.singleWhereOrNull((e) => _keyFunc(e) == key);
  }

  @override
  void operator []=(K key, V value) {
    if (containsKey(key) && _keyFunc(value) == key) {
      _items.removeWhere((e) => key == _keyFunc(value));
    }
    _items.add(value);
  }

  @override
  void addAll(Map<K, V> other) {
    for (var key in other.keys) {
      this[key] = other[key] as V;
    }
  }

  /// Adds a value to the map.
  void add(V value) => _items.add(value);

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    for (var entry in newEntries) {
      this[entry.key] = entry.value;
    }
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return map((key, value) => MapEntry(parseTo(key), parseTo(value)));
  }

  @override
  void clear() {
    _items.clear();
  }

  @override
  bool containsKey(Object? key) {
    return _items.any((e) => _keyFunc(parseTo(key)) == key);
  }

  @override
  bool containsValue(Object? value) {
    return _items.contains(parseTo(value));
  }

  @override
  Iterable<MapEntry<K, V>> get entries => _items.map((e) => MapEntry(_keyFunc(e), e));

  @override
  void forEach(void Function(K key, V value) action) {
    for (var item in _items) {
      action(_keyFunc(item), item);
    }
  }

  @override
  bool get isEmpty => _items.isEmpty;

  @override
  bool get isNotEmpty => _items.isNotEmpty;

  @override
  Iterable<K> get keys => _items.map((e) => _keyFunc(e));

  @override
  int get length => _items.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) transform) {
    return {for (var e in _items.map((e) => transform(_keyFunc(e), e))) e.key: e.value};
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    if (!containsKey(key)) {
      this[key] = ifAbsent();
    }
    return this[key]!;
  }

  @override
  V? remove(Object? key) {
    var item = _items.singleWhereOrNull((e) => _keyFunc(e) == key);
    if (item != null) {
      _items.remove(item);
      return item;
    }
    return null;
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    _items.removeWhere((e) => test(_keyFunc(e), e));
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    var item = this[key];
    if (item != null) {
      this[key] = update(item);
      return this[key]!;
    } else {
      if (ifAbsent != null) {
        this[key] = ifAbsent();
        return this[key]!;
      }
      throw Exception('Key not found');
    }
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    for (var item in _items) {
      this[_keyFunc(item)] = update(_keyFunc(item), item);
    }
  }

  @override
  Iterable<V> get values => _items;
}
