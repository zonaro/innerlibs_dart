library innerlibs;

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
        if (c >= count) break;
        if (predicate(this[i])) {
          removeAt(i);
          c++;
        }
      }
    }
    return this;
  }

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
  Map<M, List<T>> groupAndMapBy<M>(M Function(T) f) {
    Map<M, List<T>> map = {};
    forEach((item) {
      M key = f(item);
      if (!map.containsKey(key)) {
        map[key] = [];
      }
      map[key]?.add(item);
    });
    return map;
  }

  /// Detach items from a list according to a
  /// function and return these items in a new list
  List<T> detachItems(bool Function(T) test) {
    var items = where(test).toList();
    removeWhere((e) => items.contains(e));
    return items;
  }

  /// Move items from one list into another list, and return these items
  List<T> moveTo(List<T> other, bool Function(T) test) {
    var i = detachItems(test);
    other.addAll(i);
    return i;
  }
}
