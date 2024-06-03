import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on JsonRow {
  String asUpsertCommand(String tableName, [Map<String, dynamic>? where, bool nullAsBlank = false, string? quoteChar]) {
    if (where.isValid) {
      return asUpdateCommand(tableName, where!, nullAsBlank, quoteChar ?? SqlUtil.defaultQuoteChar);
    } else {
      return asInsertCommand(tableName, nullAsBlank, quoteChar ?? SqlUtil.defaultQuoteChar);
    }
  }

  string asInsertCommand(string tableName, [bool nullAsBlank = false, string? quoteChar]) {
    String columns = SqlUtil.columnsFromMap(this, quoteChar);
    String values = SqlUtil.valuesFromMap(this, nullAsBlank);
    return 'INSERT INTO ${tableName.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} ($columns) VALUES ($values);';
  }

  string asUpdateCommand(string tableName, JsonMap where, [bool nullAsBlank = false, string? quoteChar]) {
    var upsertMap = JsonRow.from(this);
    where.keys.forEach(upsertMap.remove);
    String updates = upsertMap.entries.map((e) => "${e.key.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
    String whereClause = where.asWhereClausule(nullAsBlank, quoteChar);

    return 'UPDATE ${tableName.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} SET $updates WHERE $whereClause;';
  }

  String asDeleteCommand(String tableName, [bool nullAsBlank = false, string? quoteChar]) {
    String whereClause = asWhereClausule(nullAsBlank, quoteChar);
    return 'DELETE FROM ${tableName.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} WHERE $whereClause;';
  }

  String asSelectWhereCommand(String tableName, [strings columns = const [], bool nullAsBlank = false, string? quoteChar, bool and = true]) {
    String whereClause = asWhereClausule(nullAsBlank, quoteChar, and);
    string columnString = SqlUtil.columnsFromList(columns, quoteChar).ifBlank("*");
    return 'SELECT $columnString FROM ${tableName.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} WHERE $whereClause;';
  }

  String asWhereClausule([bool nullAsBlank = false, string? quoteChar, bool and = true]) => entries.map((e) => "${e.key.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)} ${e.value == null && nullAsBlank == false ? "is" : "="} ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' ${and ? "AND" : "OR"} ');
}

extension SqlTableExtensions on JsonTable {
  /// Perform a search into a [JsonTable] comparing each term in [searchTerms] against each [JsonRow] entry value using [string.flatContains].
  /// Optionally use a max [levenshteinDistance] if the first comparison wont find nothing
  Iterable<JsonRow> search({required string searchTerm, strings keys = const [], int levenshteinDistance = 0, bool allIfEmpty = true}) {
    if (searchTerm.isBlank) {
      if (allIfEmpty) {
        return orderBy((e) => true);
      } else {
        return <JsonRow>[].orderBy((e) => true);
      }
    }

    if (keys.isEmpty) {
      keys = selectMany((e, i) => e.keys).distinct().toList();
    }

    searchFunc(JsonRow row) => keys.where((k) => "${row[k]}".flatContains(searchTerm)).length;

    levFunc(JsonRow row) => levenshteinDistance <= 0 ? 0 : keys.selectMany((e, i) => "${row[e]}".asFlat.getUniqueWords.map((t) => searchTerm.asFlat.getLevenshtein(t, true)!)).count((e) => e <= levenshteinDistance.lockMin(1));

    var l = where((row) => searchFunc(row) > 0);
    if (l.isEmpty && levenshteinDistance > 0) {
      l = where((row) => levFunc(row) > 0);
    }

    return l.orderByDescending(searchFunc).thenBy(levFunc);
  }

  Iterable<JsonRow> searchMany({required strings searchTerms, strings keys = const [], int levenshteinDistance = 0, bool allIfEmpty = true}) => searchTerms.selectMany((e, i) => search(searchTerm: e, keys: keys, levenshteinDistance: levenshteinDistance, allIfEmpty: allIfEmpty));
}
