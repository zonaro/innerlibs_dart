import 'dart:collection';

import 'package:innerlibs/innerlibs.dart';

extension StringListExtensions on strings {
  ///Verify if any [String] in a [strings]  contains the specified [String]
  bool containsLike(String s) {
    for (var item in this) {
      if (item.toString().contains(s)) return true;
    }
    return false;
  }

  ///Verify if any [String] in a [strings]  contains the specified [String] ignoring the accents and character case

  bool flatContainsLike(String s) {
    for (var item in this) {
      if (item.toString().flatContains(s)) return true;
    }
    return false;
  }

  ///Verify if any [String] in a [strings]  contains any  [String] of other [strings] ignoring the accents and character case

  bool flatContainsAny(strings s) {
    for (var item in this) {
      if (s.flatContainsLike(item)) return true;
    }
    return false;
  }

  bool flatContains(string s) => flatContainsAny([s]);

  bool flatContainsAll(Iterable<string> s) => map((e) => e.asFlat).toList().containsAll(s.map((e) => e.asFlat).toList());

  bool flatContainsAtLeast(int count, Iterable<string> s) => map((e) => e.asFlat).toList().containsAtLeast(count, s.map((e) => e.asFlat).toList());

  /// Removes duplicate elements from a [strings].
  ///
  /// Use the [flatEqual] function to compare strings.
  List<string> distinctFlat() {
    Set<string> uniqueElements = {};
    for (string element in this) {
      if (!uniqueElements.any((e) => e.flatEqual(element))) {
        uniqueElements.add(element);
      }
    }
    return uniqueElements.toList();
  }

  String generateSQLSearch(List<String> columns, [string? quoteChar]) {
    var whereClause = "";

    for (string column in columns.whereValid) {
      for (string value in whereValid) {
        if (whereClause.isNotEmpty) {
          whereClause += ' OR ';
        }
        whereClause += "${column.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} LIKE ${value.wrap("%").asSqlValue()}";
      }
    }

    return whereClause.wrap("(");
  }
}

extension ListExtension<T> on List<T> {
  /// Detach items from a list according to a
  /// function and return these items
  Iterable<T> detachItems([bool Function(T)? predicate]) {
    predicate = predicate ?? (x) => true;
    var items = where(predicate);
    removeWhere((e) => items.contains(e));
    return items;
  }

  /// Move items from one list into another list, and return these items
  Iterable<T> moveTo(List<T> other, [bool Function(T)? predicate]) {
    predicate = predicate ?? (x) => true;
    var i = detachItems(predicate);
    other.addAll(i);
    return i;
  }

  /// Remove the last [count] items of a list thats satisfy the [predicate]
  List<T> removeLastWhere(bool Function(T) predicate, [int count = 1]) {
    if (count > 0) {
      int c = 0;
      for (int i = length - 1; i >= 0; i--) {
        if (predicate(this[i])) {
          if (c >= count) break;
          removeAt(i);
          c++;
        }
      }
    }
    return this;
  }

  /// Remove the first [count] items of a list thats satisfy the [predicate]
  List<T> removeFirstWhere(bool Function(T) predicate, [int count = 1]) {
    if (count > 0) {
      int c = 0;
      for (int i = 0; i < length; i++) {
        if (predicate(this[i])) {
          if (c >= count) break;
          removeAt(i);
          c++;
        }
      }
    }
    return this;
  }

  /// Inserts the same element of type `T` between each element in a `List<T>`.
  ///
  /// This function takes a list and an element as input. It modifies the original list
  /// and adds the given element after each element, except after the last element of the list.
  /// Finally, it returns the modified list.
  ///
  /// Usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4, 5];
  ///   int element = 0;
  ///   numbers.insertBetween(element);
  ///   print(result);  // prints: [1, 0, 2, 0, 3, 0, 4, 0, 5]
  /// }
  /// ```
  ///
  /// @param list The original list of elements of type `T`.
  /// @param element The element of type `T` to be inserted between each element in the list.
  /// @return The modified list with the element inserted between each element.
  List<T> insertBetween(T element) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, element);
    }
    return this;
  }
}

/// Adds extensions to the `List` class
extension IterableExtension<T> on Iterable<T> {
  /// Removes duplicate elements from a list based on a provided predicate.
  ///
  /// The [predicate] function should return a value that uniquely identifies
  /// each element. Elements with the same value returned by the predicate
  /// are considered duplicates and only the first occurrence is retained.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<Map<String, dynamic>> inputList = [
  ///     {'id': 1, 'name': 'Alice'},
  ///     {'id': 2, 'name': 'Bob'},
  ///     {'id': 1, 'name': 'Charlie'},
  ///     {'id': 3, 'name': 'David'},
  ///   ];
  ///
  ///   // Distinct by 'id'
  ///   List<Map<String, dynamic>> result = distinctBy(inputList, (element) => element['id']);
  ///   print(result);  // Output: [{'id': 1, 'name': 'Alice'}, {'id': 2, 'name': 'Bob'}, {'id': 3, 'name': 'David'}]
  /// }
  /// ```
  List<T> distinctBy<E>(E Function(T) predicate) {
    Set<T> uniqueElements = {};
    for (T element in this) {
      if (!uniqueElements.any((e) => predicate(e) == predicate(element))) {
        uniqueElements.add(element);
      }
    }
    return uniqueElements.toList();
  }

  /// Groups the items in the list by the item returned by the lambda function.
  ///
  /// The lambda function takes an item of type T and returns a item of type M used as key.
  /// The function returns a Map<M,List<T>> where each key is a item of type M
  /// returned by the lambda function and each value is a list of items that have that key.
  Map<M, List<T>> groupAndMapBy<M>(M Function(T) keyFunction) => groupBy(keyFunction).toMap((e) => MapEntry(e.key, e.elements), modifiable: true);

  /// Groups the items in the list by the item returned by the lambda function and remaps the values.
  ///
  /// The lambda function takes an item of type T and returns a item of type M used as key.
  /// The function returns a Map<M,V> where each key is a item of type M
  /// returned by the lambda function and each value is a List<T> that have that key remmaped as V.
  Map<M, V> groupAndRemapBy<M, V>(M Function(T) keyFunction, V Function(List<T>) valueFunction) => groupAndMapBy(keyFunction).map((key, value) => MapEntry(key, valueFunction(value)));

  /// Group the itens of a list
  List<List<T>> groupInPage(int pageSize) => List.generate((length / pageSize).ceil(), (index) {
        int start = index * pageSize;
        int end = start + pageSize > length ? length : start + pageSize;
        return toList().sublist(start, end);
      });

  /// Checks if this list contains all elements from [otherList].
  bool containsAll(Iterable<T> otherList) {
    for (final element in otherList) {
      if (!contains(element)) {
        return false;
      }
    }
    return true;
  }

  List<(T?, T?)> pairUp(List<T> other) {
    var l = toList();
    return pairUpIndexes(other).map((e) {
      if (e.$1 == -1) {
        return (null, other[e.$2]);
      } else if (e.$2 == -1) {
        return (l[e.$1], null);
      } else {
        return (l[e.$1], other[e.$2]);
      }
    }).toList();
  }

  List<(int, int)> pairUpIndexes(List<T> other) {
    var l = toList();
    final r = <(int, int)>[];
    for (var i = 0; i < l.length; i++) {
      r.add((i, other.indexOf(l[i])));
    }
    for (var j = 0; j < other.length; j++) {
      final index1 = l.indexOf(other[j]);
      if (index1 == -1) {
        r.add((-1, j));
      }
    }

    return r;
  }

  /// return only valid items (see [Object.isValid])
  Iterable<T> get whereValid => where((e) => e.isValid);

  /// Checks if a list contains at least [count] values from [values].
  ///
  /// Returns `true` if [this] has at least [count] values that also exist in [values],
  /// otherwise returns `false`.
  ///
  /// Example usage:
  /// ```dart
  /// final list1 = [1, 2, 3, 4, 5];
  /// final list2 = [3, 5, 6, 7, 8];
  /// final count = 2; // Specify the minimum count
  ///
  /// final result = list1.containsAtLeast(count,list2);
  /// print(result ? 'List 1 has at least $count values from List 2.' : 'Not enough matching values.');
  /// ```
  bool containsAtLeast(int count, List<T> values) {
    // Convert list2 to a set for efficient lookups
    final set2 = values.toSet();

    // Initialize a counter for matching values
    int matchingCount = 0;

    // Iterate through list1 and check if each value is in set2
    for (final value in this) {
      if (set2.contains(value)) {
        matchingCount++;
        if (matchingCount >= count) {
          return true; // Found enough matching values
        }
      }
    }

    return false; // Not enough matching values
  }

  /// Returns the most frequent element in the list.
  ///
  /// Throws an exception if the list is empty.
  T? get mostFrequent {
    if (isEmpty) {
      return null;
    }

    // Create a map to store the frequency of each element
    final frequencyMap = <T, int>{};

    // Iterate over the list and update the frequency map
    for (final element in this) {
      frequencyMap[element] = (frequencyMap[element] ?? 0) + 1;
    }

    // Find the element with the highest frequency
    T? mostFrequentElement;
    int maxFrequency = 0;

    for (final entry in frequencyMap.entries) {
      if (entry.value > maxFrequency) {
        maxFrequency = entry.value;
        mostFrequentElement = entry.key;
      }
    }

    return mostFrequentElement;
  }

  /// Returns the least frequent element in the list.
  ///
  /// Throws an exception if the list is empty.
  T? get leastFrequent {
    if (isEmpty) {
      return null;
    }

    // Create a map to store the frequency of each element
    final frequencyMap = <T, int>{};

    // Iterate over the list and update the frequency map
    for (final element in this) {
      frequencyMap[element] = (frequencyMap[element] ?? 0) + 1;
    }

    // Find the element with the lowest frequency
    T? leastFrequentElement;
    int minFrequency = length + 1;

    for (final entry in frequencyMap.entries) {
      if (entry.value < minFrequency) {
        minFrequency = entry.value;
        leastFrequentElement = entry.key;
      }
    }

    return leastFrequentElement;
  }
}

class KeyedJsonTable<T extends Comparable> extends Iterable<JsonRow> {
  final string keyName;
  JsonTable table;

  KeyedJsonTable({
    this.table = const [],
    required this.keyName,
  });

  JsonRow? operator [](T key) => table.where((row) => (row[keyName] as T) == (key)).singleOrNull;

  void operator []=(T key, JsonRow values) {
    var m = this[key];
    m = m ?? values;
    m.addAll(values);
  }

  /// Add rows to this JsonTable. Only rows with valid Ids will be added. Return a list of IDs

  List<T> addAll(JsonTable rows, [bool override = false]) {
    List<T> pks = [];
    for (var newRow in rows) {
      T? pk = add(newRow, override);
      if (pk.isValid) {
        pks.add(pk as T);
      }
    }
    return pks;
  }

  T? add(JsonRow row, [bool override = false]) {
    var pk = row[keyName] as T;
    if (pk.isValid) {
      var exist = this[pk];
      if (exist == null || override) {
        this[pk] = row;
        return pk;
      }
    }
    return null;
  }

  bool containsKey(T key) => this[key] != null;

  JsonRow? remove(T key) => table.detachItems((e) => e[keyName] == key).singleOrNull;

  void clear() => table.clear();

  @override
  Iterator<JsonRow> get iterator => table.iterator;
}
