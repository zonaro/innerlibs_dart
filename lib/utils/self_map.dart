import 'package:innerlibs/innerlibs.dart';

/// A map implementation that uses a function to generate keys for each value.
class SelfMap<K, V> implements Map<K, V> {
  /// Creates a new instance of [SelfMap] with the provided [items] and [keyFunc].
  ///
  /// - A copy of [items] list is used to initialize the map.
  /// - The keys are generated using the [keyFunc] function, and the values are the corresponding items in the [items] list. if the key changes in a value, the key in map will reflect its changes.
  /// - If [keyFunc] is not provided, the default key function is used, which returns the hash code of the value.
  /// - The [keyFunc] function is used to ensure that the keys are unique. If the [items] list contains duplicate keys, only the first value with the key is retained.
  SelfMap(List<V> items, [K Function(V)? keyFunc]) {
    this._keyFunc = keyFunc ?? ((e) => e.hashCode as K);
    this._items = items.distinctBy(this._keyFunc);
  }

  late K Function(V) _keyFunc;

  late Set<V> _items;

  @override
  V? operator [](Object? key) {
    return _items.singleWhereOrNull((e) => _keyFunc(e) == key);
  }

  /// Returns the value associated with the specified [key] in the map.
  /// The [key] must be of type [K].
  /// if Map contains key and the key is different than the key of the value, the old value is not removed.
  @override
  void operator []=(K key, V value) {
    if (containsKey(key) && _keyFunc(value) == key) {
      _items.removeWhere((e) => key == _keyFunc(value));
    }
    add(value);
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
  void removeWhere(bool Function(K key, V value) test) => _items.removeWhere((e) => test(_keyFunc(e), e));

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
  Iterable<V> get values => [..._items];
}
