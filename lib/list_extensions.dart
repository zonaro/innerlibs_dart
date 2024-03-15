import 'package:innerlibs/innerlibs.dart';

extension StringListExtensions on StringList {
  ///Verify if any [String] in a [StringList]  contains the specified [String]
  bool containsLike(String s) {
    for (var item in this) {
      if (item.toString().contains(s)) return true;
    }
    return false;
  }

  ///Verify if any [String] in a [StringList]  contains the specified [String] ignoring the accents and character case

  bool flatContainsLike(String s) {
    for (var item in this) {
      if (item.toString().flatContains(s)) return true;
    }
    return false;
  }

  ///Verify if any [String] in a [StringList]  contains any  [String] of other [StringList] ignoring the accents and character case

  bool flatContainsAny(StringList s) {
    for (var item in this) {
      if (s.flatContainsLike(item)) return true;
    }
    return false;
  }

  /// Removes duplicate elements from a [StringList].
  ///
  /// Use the [flatEqual] function to compare strings.
  List<string> distinctFlat<E>() {
    Set<string> uniqueElements = {};
    for (string element in this) {
      if (!uniqueElements.any((e) => e.flatEqual(element))) {
        uniqueElements.add(element);
      }
    }
    return uniqueElements.toList();
  }
}

/// Adds extensions to the `List` class
extension ListExtension<T> on List<T> {
  /// Removes duplicate elements from a list.
  ///
  /// Elements with the same hashCode are considered duplicates
  /// and only the first occurrence is retained.
  List<T> distinct() => distinctBy((x) => x.hashCode);

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

  /// Groups the items in the list by the item returned by the lambda function.
  ///
  /// The lambda function takes an item of type T and returns a item of type M used as key.
  /// The function returns a Map<M,List<T>> where each key is a item of type M
  /// returned by the lambda function and each value is a list of items that have that key.
  Map<M, List<T>> groupAndMapBy<M>(M Function(T) keyFunction) {
    Map<M, List<T>> map = {};
    forEach((item) {
      M key = keyFunction(item);
      if (!map.containsKey(key)) {
        map[key] = [];
      }
      map[key]?.add(item);
    });
    return map;
  }

  /// Groups the items in the list by the item returned by the lambda function and remaps the values.
  ///
  /// The lambda function takes an item of type T and returns a item of type M used as key.
  /// The function returns a Map<M,V> where each key is a item of type M
  /// returned by the lambda function and each value is a List<T> that have that key remmaped as V.
  Map<M, V> groupAndRemapBy<M, V>(M Function(T) keyFunction, V Function(List<T>) valueFunction) => groupAndMapBy(keyFunction).map((key, value) => MapEntry(key, valueFunction(value)));

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

  /// Group the itens of a list
  List<List<T>> groupInPage(int pageSize) => List.generate((length / pageSize).ceil(), (index) {
        int start = index * pageSize;
        int end = start + pageSize > length ? length : start + pageSize;
        return sublist(start, end);
      });

  /// Checks if this list contains all elements from [otherList].
  bool containsAll(List<T> otherList) {
    for (final element in otherList) {
      if (!contains(element)) {
        return false;
      }
    }
    return true;
  }

  List<(T?, T?)> pairUp(List<T> other) {
    return pairUpIndexes(other).map((e) {
      if (e.$1 == -1) {
        return (null, other[e.$2]);
      } else if (e.$2 == -1) {
        return (this[e.$1], null);
      } else {
        return (this[e.$1], other[e.$2]);
      }
    }).toList();
  }

  List<(int, int)> pairUpIndexes(List<T> other) {
    final r = <(int, int)>[];
    for (var i = 0; i < length; i++) {
      r.add((i, other.indexOf(this[i])));
    }
    for (var j = 0; j < other.length; j++) {
      final index1 = indexOf(other[j]);
      if (index1 == -1) {
        r.add((-1, j));
      }
    }

    return r;
  }

  /// return only valid items (see [Object.isValid])
  Iterable<T> get whereValid => where((e) => e.isValid);
}
