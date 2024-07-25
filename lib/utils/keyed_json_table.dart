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
  late JsonTable _table;

  /// Constructs a [KeyedJsonTable] with the specified [keyName] and [items].
  KeyedJsonTable({
    required this.keyName,
    JsonTable items = const [],
  }) {
    _table = [];
    if (items.isNotEmpty) {
      addAll(items);
    }
  }

  /// Returns the [JsonRow] with the specified [key], or `null` if not found.
  JsonRow? operator [](T key) => _table.where((row) => parseTo(row[keyName]) == key).singleOrNull;

  /// Sets the [JsonRow] with the specified [key] to the given [values].
  void operator []=(T key, JsonRow values) => add(values..[keyName] = key);

  /// Returns a pair of values computed from the given [key] using the provided [func] and [valueFunc].
  /// The [func] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  (T1, T2) getPair<T1, T2>(T key, (T1, T2) Function(JsonRow) func) => func(this[key]!);

  /// Returns a [MapEntry] with the key and value computed from the given [key] using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  MapEntry<T1, T2> getMapEntry<T1, T2>(T key, T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => MapEntry(keyFunc(this[key]!), valueFunc(this[key]!));

  /// Returns a list of pairs computed from the elements in the table using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  List<(T1, T2)> getPairs<T1, T2>((T1, T2) Function(JsonRow) func) => this._table.where((e) => e[keyName] != null).map((e) => getPair(e[keyName] as T, func)).toList();

  /// Returns a map computed from the elements in the table using the provided [keyFunc] and [valueFunc].
  /// The [keyFunc] is a function that takes a [JsonRow] and returns a value of type [T1].
  /// The [valueFunc] is a function that takes a [JsonRow] and returns a value of type [T2].
  Map<T1, T2> getMap<T1, T2>(T1 Function(JsonRow) keyFunc, T2 Function(JsonRow) valueFunc) => Map.fromEntries(_table.where((e) => e[keyName] != null).map((e) => getMapEntry(e[keyName] as T, keyFunc, valueFunc)));

  /// Add rows to this JsonTable. Only rows with valid Ids will be added. Return a list of IDs
  Iterable<T> addAll(JsonTable rows, [bool override = false]) => [for (var newRow in rows) add(newRow, override)].whereNotNull();

  /// Add a row to this JsonTable. Only rows with valid Ids will be added. Return the ID
  T? add(JsonRow row, [bool override = false]) {
    var pk = row[keyName] as T;
    if (pk.isValid()) {
      var exist = this[pk];
      if (exist == null || override) {
        exist ??= row;
        exist.addAll(row);
        if (_table.contains(exist) == false) {
          _table.add(exist);
        }
      }
    }
    return null;
  }

  /// Reload the table with the provided rows.
  /// Only rows with valid Ids will be added.
  Iterable<T> reloadWith(JsonTable rows) {
    _table.clear();
    return addAll(rows);
  }

  /// Returns the value associated with the specified [key] in the [JsonRow].
  /// The [key] must be of type [T].
  T getKey(JsonRow row) => row[keyName] as T;

  /// Checks if the list contains the specified [key].
  /// Returns `true` if the [key] is found, `false` otherwise.
  bool containsKey(T key) => _table.map((e) => getKey(e) == key).isNotEmpty;

  /// Removes the [JsonRow] with the specified [key] from the list.
  /// Returns the removed [JsonRow], or `null` if the [key] is not found.
  JsonRow? remove(T key) => _table.detachItems((e) => e[keyName] == key).singleOrNull;

  /// Removes all elements from the list.
  void clear() => _table.clear();

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
  Iterator<JsonRow> get iterator => _table.iterator;
}

extension ListMapExtension<K, V> on JsonTable {
  /// Converts a list of maps to a keyed JSON table.
  KeyedJsonTable<T> toKeyedTable<T extends Comparable>(String keyName) => KeyedJsonTable<T>(keyName: keyName, items: this);
}
