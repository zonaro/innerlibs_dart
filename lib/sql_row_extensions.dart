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
  Iterable<JsonRow> search({required strings searchTerms, strings keys = const [], int? levenshteinDistance}) {
    if (keys.isEmpty) {
      keys = selectMany((e, i) => e.keys).distinct().toList();
    }

    searchFunc(JsonRow row) {
      var hasFlat = keys.where((e) => "${row[e]}".flatContainsAny(searchTerms)).length;
      if (levenshteinDistance != null) {
        var hasLev = keys.selectMany((e, i) {
          var terms = "${row[e]}".getUniqueWords;
          var levs = searchTerms.selectMany((st, i) {
            var lev = terms.selectMany((t, i) => st.getUniqueWords.map((stw) => t.getLevenshtein(stw, true)!));
            return lev;
          });
          return levs;
        }).count((element) => element <= levenshteinDistance);
        return hasFlat + hasLev;
      }
      return hasFlat;
    }

    return where((row) => searchFunc(row) > 0).orderByDescending(searchFunc);
  }
}
