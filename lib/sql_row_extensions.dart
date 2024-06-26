import 'package:innerlibs/innerlibs.dart';

///
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
    procedureName = SqlUtil.wrap(procedureName, quoteChar, dataBaseProvider);

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

  /// Generates an UPSERT command for the given table name, where clause, and other optional parameters.
  ///
  /// The [tableName] parameter specifies the name of the table to perform the UPSERT operation on.
  /// The [where] parameter is an optional map that represents the WHERE clause of the UPSERT command.
  /// The [nullAsBlank] parameter specifies whether null values should be treated as blank values.
  /// The [quoteChar] parameter is an optional string that represents the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter is an optional string that specifies the database provider.
  ///
  /// Returns the generated UPSERT command as a string.
  String asUpsertCommand({
    required String tableName,
    Map<String, dynamic>? where,
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    if (where.isValid) {
      return asUpdateCommand(
        tableName: tableName,
        where: where!,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      );
    } else {
      return asInsertCommand(
        tableName: tableName,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      );
    }
  }

  /// Generates an INSERT command for the given table name and map of values.
  ///
  /// The [tableName] parameter specifies the name of the table to insert into.
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter specifies the database provider.
  ///
  /// Returns the generated INSERT command as a string.
  String asInsertCommand({
    required String tableName,
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    String columns = SqlUtil.columnsFromMap(
      items: this,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );
    String values = SqlUtil.valuesFromMap(
      items: this,
      nullAsBlank: nullAsBlank,
    );
    return 'INSERT INTO ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} ($columns) VALUES ($values);';
  }

  /// Generates an UPDATE command for the given table name, WHERE clause, and map of values.
  ///
  /// The [tableName] parameter specifies the name of the table to update.
  /// The [where] parameter specifies the WHERE clause as a map of column names and values.
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter specifies the database provider.
  ///
  /// Returns the generated UPDATE command as a string.
  String asUpdateCommand({
    required String tableName,
    required Map<String, dynamic> where,
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    var upsertMap = JsonRow.from(this);
    String updates = upsertMap.entries.map((e) => "${SqlUtil.wrap(e.key, quoteChar, dataBaseProvider)} = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
    String whereClause = where.asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );

    return 'UPDATE ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} SET $updates WHERE $whereClause;';
  }

  /// Generates a DELETE command for the given table name.
  ///
  /// The [tableName] parameter specifies the name of the table to delete from.
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter specifies the database provider.
  ///
  /// Returns the generated DELETE command as a string.
  String asDeleteCommand({
    required String tableName,
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    String whereClause = asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );
    return 'DELETE FROM ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} WHERE $whereClause;';
  }

  /// Generates a DELETE command for deleting the top [count] rows from the given table.
  ///
  /// The [tableName] parameter specifies the name of the table to delete from.
  /// The [count] parameter specifies the number of rows to delete.
  /// The [idColumn] parameter specifies the name of the column used for ordering.
  /// The [asc] parameter determines whether to delete rows in ascending order.
  /// The [dataBaseProvider] parameter specifies the database provider.
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  ///
  /// Returns the generated DELETE command as a string.
  String asDeleteTopCommand(
    String tableName,
    int count,
    String idColumn,
    bool asc,
    String dataBaseProvider, [
    bool nullAsBlank = false,
    String? quoteChar,
  ]) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    String whereClause = asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );

    return """DELETE FROM ${SqlUtil.wrap(tableName)} WHERE $idColumn in (
                SELECT ${SqlUtil.isSqlServer(dataBaseProvider) ? "TOP($count)" : ""} $idColumn
                FROM ${SqlUtil.wrap(tableName)}
                WHERE $whereClause
                ORDER BY $idColumn ${asc ? "ASC" : "DESC"} ${SqlUtil.isMySql(dataBaseProvider) ? "LIMIT $count" : ""}
              );""";
  }

  /// Generates a SELECT command with a WHERE clause for the given table name and column names.
  ///
  /// The [tableName] parameter specifies the name of the table to select from.
  /// The [columns] parameter specifies the list of column names to select.
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter specifies the database provider.
  /// The [and] parameter determines whether to use "AND" or "OR" in the WHERE clause.
  ///
  /// Returns the generated SELECT command as a string.
  String asSelectWhereCommand({
    required String tableName,
    List<String> columns = const [],
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
    bool and = true,
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    String whereClause = asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
      and: and,
    );
    String columnString = SqlUtil.columnsFromList(
      items: columns,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    ).ifBlank("*");
    return 'SELECT $columnString FROM ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} WHERE $whereClause;';
  }

  /// Generates a WHERE clause for the given map of column names and values.
  ///
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  /// The [dataBaseProvider] parameter specifies the database provider.
  /// The [and] parameter determines whether to use "AND" or "OR" in the WHERE clause.
  ///
  /// Returns the generated WHERE clause as a string.
  String asWhereClausule({
    bool nullAsBlank = false,
    String? quoteChar,
    String dataBaseProvider = "",
    bool and = true,
  }) {
    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);
    return entries.map((e) => "${SqlUtil.wrap(e.key, quoteChar, dataBaseProvider)} ${e.value == null && nullAsBlank == false ? "is" : "="} ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' ${and ? "AND" : "OR"} ');
  }
}

extension SqlTableExtensions on JsonTable {
  /// Searches for [JsonRow] objects in the iterable based on a search term and specified keys.
  ///
  /// The [searchTerm] parameter is the term to search for.
  /// The [keys] parameter is a list of keys to search on. If empty, all keys in the [JsonRow] objects will be used.
  /// The [levenshteinDistance] parameter is the maximum allowed Levenshtein distance between the search term and a value in the [JsonRow] objects.
  /// The [allIfEmpty] parameter determines whether to return all [JsonRow] objects if the search term is empty.
  ///
  /// Returns an iterable of [JsonRow] objects that match the search criteria.
  Iterable<JsonRow> searchMap({required String searchTerm, List<String> keys = const [], int levenshteinDistance = 0, bool allIfEmpty = true}) {
    if (keys.isEmpty) {
      keys = selectMany((e, i) => e.keys).distinct().toList();
    }

    return search(searchTerm: searchTerm, searchOn: (row) => [for (var k in keys) "${row[k] ?? ""}"], levenshteinDistance: levenshteinDistance, allIfEmpty: allIfEmpty);
  }

  /// Searches for multiple [JsonRow] objects in the map based on the given search terms.
  ///
  /// The [searchTerms] parameter is a required list of strings representing the search terms.
  /// The [keys] parameter is an optional list of strings representing the keys to search within the map.
  /// The [levenshteinDistance] parameter is an optional integer representing the maximum Levenshtein distance allowed for fuzzy matching.
  /// The [allIfEmpty] parameter is an optional boolean indicating whether to return all results if the search terms are empty.
  ///
  /// Returns an iterable of [JsonRow] objects that match the search criteria.
  Iterable<JsonRow> searchMapMany({required strings searchTerms, strings keys = const [], int levenshteinDistance = 0, bool allIfEmpty = true}) => searchTerms.selectMany((e, i) => searchMap(searchTerm: e, keys: keys, levenshteinDistance: levenshteinDistance, allIfEmpty: allIfEmpty));
}

/// A mixin that provides utility functions for working with SQL.
mixin SqlUtil {
  /// The default quote character used for wrapping column names.
  static String? defaultQuoteChar = '[';

  /// Returns the appropriate quote character based on the given database provider.
  ///
  /// If the provider is SQL Server, it returns "[". If the provider is MySQL, it returns "`".
  /// Otherwise, it returns the [defaultQuoteChar].
  static String? quoteCharFromProvider(String dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    if (isSqlServer(dataBaseProvider)) {
      return "[";
    }
    if (isMySql(dataBaseProvider)) {
      return "`";
    }
    return defaultQuoteChar;
  }

  /// Wraps the given object name with the specified quote character.
  /// If the quote character is not provided and the database provider is specified, it uses the appropriate quote character.
  /// Otherwise, it uses the [defaultQuoteChar].
  static wrap(String objectName, [String? quoteChar, String dataBaseProvider = ""]) => objectName.wrap(quoteChar ?? SqlUtil.quoteCharFromProvider(dataBaseProvider));

  /// Checks if the given database provider is SQL Server.
  static bool isSqlServer(String dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    return dataBaseProvider.flatEqualAny(["sqlserver", "mssql", "microsoftsqlserver", "sqlclient", "ms"]);
  }

  /// Checks if the given database provider is MySQL.
  static bool isMySql(String dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    return dataBaseProvider.flatEqualAny(["mysql", "maria", "mariadb", "my", "mysqlconnector"]);
  }

  /// Returns a comma-separated string of wrapped column names from the given list.
  ///
  /// The [quoteChar] parameter specifies the quote character to use for wrapping column names.
  /// The [dataBaseProvider] parameter is used to determine the appropriate quote character if [quoteChar] is not provided.
  static String columnsFromList({required List<String> items, String? quoteChar, String dataBaseProvider = ""}) => items.map((e) => SqlUtil.wrap(e, quoteChar, dataBaseProvider)).join(", ");

  /// Returns a comma-separated string of wrapped column names from the given map.
  ///
  /// The [quoteChar] parameter specifies the quote character to use for wrapping column names.
  /// The [dataBaseProvider] parameter is used to determine the appropriate quote character if [quoteChar] is not provided.
  static String columnsFromMap<K, V>({required Map<K, V> items, String? quoteChar, String dataBaseProvider = ""}) => columnsFromList(items: items.keys.map((x) => "$x").toList(), quoteChar: quoteChar, dataBaseProvider: dataBaseProvider);

  /// Returns a comma-separated string of SQL values from the given list.
  ///
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  static String valuesFromList({required Iterable<dynamic> items, bool nullAsBlank = false}) => items.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(", ");

  /// Returns a comma-separated string of SQL values from the given map.
  ///
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  static String valuesFromMap({required Map<dynamic, dynamic> items, bool nullAsBlank = false}) => valuesFromList(items: items.values, nullAsBlank: nullAsBlank);

  /// Returns the appropriate identity function based on the given database provider.
  ///
  /// If the provider is SQL Server, it returns "SCOPE_IDENTITY()". If the provider is MySQL, it returns "LAST_INSERT_ID()".
  /// Otherwise, it throws an ArgumentError.
  static String getIdentity(String dataBaseProvider) {
    if (isSqlServer(dataBaseProvider)) {
      return "SCOPE_IDENTITY()";
    }
    if (isMySql(dataBaseProvider)) {
      return "LAST_INSERT_ID()";
    }
    throw ArgumentError("Cannot identify database provider: $dataBaseProvider", "dataBaseProvider");
  }

  /// Returns the appropriate "TOP" or "LIMIT" clause based on the given database provider and count.
  ///
  /// If [count] is not null, it returns "TOP(count)" for SQL Server and "LIMIT count" for MySQL.
  /// Otherwise, it returns an empty string.
  static String topOrLimit(String dataBaseProvider, int? count) {
    if (count != null) {
      if (isSqlServer(dataBaseProvider)) {
        return "TOP($count)";
      }
      if (isMySql(dataBaseProvider)) {
        return "LIMIT $count";
      }
    }
    return "";
  }
}
