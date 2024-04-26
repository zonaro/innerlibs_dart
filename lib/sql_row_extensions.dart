import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on JsonRow {
  static string defaultQuoteChar = '[';

  String asUpsertCommand(String tableName, [Map<String, dynamic>? where, bool nullAsBlank = false, string? quoteChar]) {
    if (where.isValid) {
      return asUpdateCommand(tableName, where!, nullAsBlank, quoteChar ?? defaultQuoteChar);
    } else {
      return asInsertCommand(tableName, nullAsBlank, quoteChar ?? defaultQuoteChar);
    }
  }

  string asInsertCommand(string tableName, [bool nullAsBlank = false, string? quoteChar]) {
    String columns = keys.map((e) => e.wrap(quoteChar ?? defaultQuoteChar)).join(', ');
    String values = this.values.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(', ');
    return 'INSERT INTO ${tableName.wrap(quoteChar ?? defaultQuoteChar)} ($columns) VALUES ($values);';
  }

  string asUpdateCommand(string tableName, JsonMap where, [bool nullAsBlank = false, string? quoteChar]) {
    var upsertMap = JsonRow.from(this);
    where.keys.forEach(upsertMap.remove);
    String updates = upsertMap.entries.map((e) => "${e.key.wrap(quoteChar ?? defaultQuoteChar)} = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
    String whereClause = where.asWhereClausule(nullAsBlank, quoteChar);

    return 'UPDATE ${tableName.wrap(quoteChar ?? defaultQuoteChar)} SET $updates WHERE $whereClause;';
  }

  String asDeleteCommand(String tableName, [bool nullAsBlank = false, string? quoteChar]) {
    String whereClause = asWhereClausule(nullAsBlank, quoteChar);
    return 'DELETE FROM ${tableName.wrap(quoteChar ?? defaultQuoteChar)} WHERE $whereClause;';
  }

  String asSelectWhereCommand(String tableName, [strings columns = const [], bool nullAsBlank = false, string? quoteChar]) {
    String whereClause = asWhereClausule(nullAsBlank, quoteChar);
    string columnString = columns.map((e) => e.wrap(quoteChar ?? defaultQuoteChar)).join(", ").ifBlank("*")!;
    return 'SELECT $columnString FROM ${tableName.wrap(quoteChar ?? defaultQuoteChar)} WHERE $whereClause;';
  }

  String asWhereClausule([bool nullAsBlank = false, string? quoteChar]) => entries.map((e) => "${e.key.wrap(quoteChar ?? defaultQuoteChar)} ${e.value == null && nullAsBlank == false ? "is" : "="} ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' AND ');
}

extension SqlTableExtensions on JsonTable {
  /// Perform a search into a [JsonTable] comparing each term in [searchTerms] against each [JsonRow] entry value using [string.flatContains].
  /// Optionally use a max [levenshteinDistance] if the first comparison wont find nothing
  Iterable<JsonRow> search({required string searchTerm, strings keys = const [], int levenshteinDistance = 0}) {
    if (keys.isEmpty) {
      keys = selectMany((e, i) => e.keys).distinct().toList();
    }

    searchFunc(JsonRow row) => keys.where((k) => "${row[k]}".flatContains(searchTerm)).length;

    levFunc(JsonRow row) => levenshteinDistance <= 0 ? 0 : keys.selectMany((e, i) => "${row[e]}".getUniqueWords.map((t) => searchTerm.getLevenshtein(t, true)!)).count((e) => e <= levenshteinDistance.lockMin(1));

    var l = where((row) => searchFunc(row) > 0);
    if (l.isEmpty && levenshteinDistance > 0) {
      l = where((row) => levFunc(row) > 0);
    }

    return l.orderByDescending(searchFunc).thenByDescending(levFunc);
  }

  Iterable<JsonRow> searchMany({required strings searchTerms, strings keys = const [], int levenshteinDistance = 0}) => searchTerms.selectMany((e, i) => search(searchTerm: e, keys: keys, levenshteinDistance: levenshteinDistance));
}
