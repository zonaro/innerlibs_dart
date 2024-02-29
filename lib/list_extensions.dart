import 'package:innerlibs/general_extensions.dart';

extension StringListExtensions on List<String> {
  ///Verify if any [String] in a [List<String>]  contains the specified [String]
  bool containsLike(String s) {
    for (var item in this) {
      if (item.toString().contains(s)) return true;
    }
    return false;
  }
}

/// Adds extensions to the `List` class
extension ListExtension<T> on List<T> {
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
  /// function and return these items in a new list
  List<T> detachItems([bool Function(T)? test]) {
    test = test ?? (x) => true;
    var items = where(test).toList();
    removeWhere((e) => items.contains(e));
    return items;
  }

  /// Move items from one list into another list, and return these items
  List<T> moveTo(List<T> other, [bool Function(T)? test]) {
    test = test ?? (x) => true;
    var i = detachItems(test);
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
    final resultado = <(int, int)>[];

    for (var i = 0; i < length; i++) {
      resultado.add((i, other.indexOf(this[i])));
    }
    for (var j = 0; j < other.length; j++) {
      final index1 = indexOf(other[j]);
      if (index1 == -1) {
        resultado.add((-1, j));
      }
    }

    return resultado;
  }
/// return only valid items
  Iterable<T> get whereValid => where((e) => e.isValid);
}
