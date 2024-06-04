import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on JsonRow {
  /// Generates a SQL call string for a given stored procedure and database provider.
  ///
  /// This function constructs a SQL call command by wrapping the procedure name with
  /// the appropriate quote character and appending the necessary syntax based on the
  /// database provider. It extends `Map<String, dynamic>` to include the parameters
  /// for the SQL call.
  ///
  /// CAUTION: if yor [dataBaseProvider] is MySQL or MariaDB, the syntax will not include
  /// parameter names and the values will be concatenated in order
  ///
  /// [procedureName] is the name of the stored procedure to be called.
  /// [dataBaseProvider] is a string that specifies the database provider. It supports
  /// 'mysql', 'mariadb', 'mssql', and 'sqlserver'.
  /// [nullAsBlank] is an optional boolean flag that, when set to true, will treat null
  /// values as blank strings in the SQL call. Defaults to false.
  /// [quoteChar] is an optional string that specifies the character to use for quoting
  /// SQL identifiers. If not provided, it defaults to the value of `SqlUtil.defaultQuoteChar`.
  ///
  /// Throws an [ArgumentError] if the database provider is not recognized.
  ///
  /// Returns a [String] containing the SQL call command.
  String generateSqlCall(String procedureName, String dataBaseProvider, [bool nullAsBlank = false, string? quoteChar]) {
    var sqlCall = '';

    bool isMySql = dataBaseProvider.flatEqualAny(["mysql", "mariadb"]);
    bool isSqlServer = dataBaseProvider.flatEqualAny(["mssql", "sqlserver"]);
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    procedureName = procedureName.wrap(quoteChar);

    if (isMySql) {
      sqlCall += 'CALL $procedureName(';
    } else if (isSqlServer) {
      sqlCall += 'EXEC $procedureName ';
    } else {
      throw ArgumentError("Cannot identify database provider: $dataBaseProvider", "dataBaseProvider");
    }

    sqlCall += entries.map((e) {
      if (isMySql) {
        return (e.value as Object?).asSqlValue(nullAsBlank);
      } else if (isSqlServer) {
        return '@${e.key} = ${(e.value as Object?).asSqlValue(nullAsBlank)}';
      }
    }).join(", ");

    if (isMySql) {
      sqlCall += ');';
    }

    return sqlCall;
  }

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

mixin SqlUtil {
  static string defaultQuoteChar = '[';

  static string quoteCharFromProvider(string dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    if (dataBaseProvider.flatEqualAny(["mssql", "sqlserver"])) {
      return "[";
    }
    if (dataBaseProvider.flatEqualAny(["mysql", "mariadb"])) {
      return "`";
    }
    return defaultQuoteChar;
  }

  static string columnsFromList(strings items, [string? quoteChar]) => items.map((e) => e.wrap(quoteChar ?? SqlUtil.defaultQuoteChar)).join(",");

  static string columnsFromMap(Map items, [string? quoteChar]) => columnsFromList(items.keys.map((x) => "$x").toList(), quoteChar);

  static string valuesFromList(Iterable items, [bool nullAsBlank = false]) => items.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(", ");

  static string valuesFromMap(Map items, [bool nullAsBlank = false]) => valuesFromList(items.values, nullAsBlank);

  static string getIdentity(string dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    if (dataBaseProvider.flatEqualAny(["mssql", "sqlserver"])) {
      return "SCOPE_IDENTITY()";
    }
    if (dataBaseProvider.flatEqualAny(["mysql", "mariadb"])) {
      return "LAST_INSERT_ID()";
    }
    throw ArgumentError("Cannot identify database provider: $dataBaseProvider", "dataBaseProvider");
  }
}
