import 'dart:convert';

import 'package:innerlibs/innerlibs.dart';

/// A class representing a Data Access Object (DAO) for executing SQL queries and operations.
class Dao {
  final String dataBaseProvider;
  String? quoteChar;
  final dynamic Function(string) sqlFunction;

  /// Constructs a new instance of the [Dao] class.
  ///
  /// The [dataBaseProvider] parameter specifies the database provider.
  /// The [sqlFunction] parameter is a function that executes SQL queries.
  /// The [quoteChar] parameter specifies the character used for quoting identifiers.
  Dao({required this.dataBaseProvider, required this.sqlFunction, this.quoteChar});

  /// Executes an SQL DELETE query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to delete from.
  /// The [where] parameter is a [JsonRow] object representing the WHERE clause.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  /// The [transform] parameter is an optional function to transform the query result.
  Future<SQLResponseOf<T>> executeDelete<T>({required String tableName, JsonRow where = const {}, bool nullAsBlank = false, T Function(dynamic)? transform}) {
    return executeSQL(
      dataSetType: "table",
      transform: transform,
      sql: where.asDeleteCommand(
        tableName: tableName,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      ),
    );
  }

  /// Executes an SQL DELETE TOP query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to delete from.
  /// The [count] parameter specifies the number of rows to delete.
  /// The [idColumn] parameter specifies the column to order by.
  /// The [asc] parameter specifies whether to order in ascending or descending order.
  /// The [where] parameter is a [JsonRow] object representing the WHERE clause.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  Future<SQLResponseOf<void>> executeDeleteTop<T>({required String tableName, required int count, required String idColumn, required bool asc, JsonRow where = const {}, bool nullAsBlank = false}) {
    return executeSQL(
        dataSetType: "value",
        sql: where.asDeleteTopCommand(
          tableName,
          count,
          idColumn,
          asc,
          dataBaseProvider,
          nullAsBlank,
          quoteChar,
        ));
  }

  /// Executes an SQL INSERT query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to insert into.
  /// The [values] parameter is a [JsonRow] object representing the values to insert.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  Future<SQLResponseOf<void>> executeInsert({
    required String tableName,
    required JsonRow values,
    bool nullAsBlank = false,
  }) {
    return executeSQL(
      dataSetType: "value",
      sql: values.asInsertCommand(
        tableName: tableName,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      ),
    );
  }

  /// Executes an SQL SELECT query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to query.
  /// The [columns] parameter is a list of column names to select.
  /// The [where] parameter is a [JsonRow] object representing the WHERE clause.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  /// The [and] parameter specifies whether to use the AND operator in the WHERE clause.
  /// The [transform] parameter is an optional function to transform the query result.
  Future<SQLResponseOf<T>> executeSelect<T>(
      {required String tableName, List<String> columns = const [], JsonRow where = const {}, bool nullAsBlank = false, bool and = true, T Function(dynamic)? transform}) {
    return executeSQL(
      dataSetType: "table",
      transform: transform,
      sql: where.asSelectWhereCommand(
        tableName: tableName,
        columns: columns,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
        and: and,
      ),
    );
  }

  /// Executes an SQL query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [sql] parameter specifies the SQL query to execute.
  /// The [transform] parameter is an optional function to transform the query result.
  /// The [dataSetType] parameter specifies the type of data set being queried.
  Future<SQLResponseOf<T>> executeSQL<T>({required String sql, T Function(dynamic)? transform, dataSetType = 'set'}) async {
    try {
      var result = await sqlFunction(sql);
      transform ??= (x) => x as T;
      T data = transform(result);
      return SQLResponseOf<T>.fromData(data, sql: sql, dataSetType: dataSetType);
    } catch (e) {
      return SQLResponseOf<T>.error(message: e.toString(), sql: sql, dataSetType: dataSetType);
    }
  }

  /// Executes an SQL UPDATE query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to update.
  /// The [values] parameter is a [JsonRow] object representing the new values.
  /// The [where] parameter is a [JsonRow] object representing the WHERE clause.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  Future<SQLResponseOf<void>> executeUpdate({required String tableName, required JsonRow values, required JsonRow where, bool nullAsBlank = false}) {
    return executeSQL(
      dataSetType: "table",
      sql: values.asUpdateCommand(
        tableName: tableName,
        where: where,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      ),
    );
  }

  /// Executes an SQL UPSERT query and returns the result as a [SQLResponseOf] object.
  ///
  /// The [tableName] parameter specifies the name of the table to upsert into.
  /// The [values] parameter is a [JsonRow] object representing the values to upsert.
  /// The [where] parameter is a [JsonRow] object representing the WHERE clause.
  /// The [nullAsBlank] parameter specifies whether to treat null values as blank.
  Future<SQLResponseOf<void>> executeUpsert({
    required String tableName,
    required JsonRow values,
    JsonRow where = const {},
    bool nullAsBlank = false,
  }) {
    return executeSQL(
      dataSetType: "table",
      sql: values.asUpsertCommand(
        tableName: tableName,
        where: where,
        nullAsBlank: nullAsBlank,
        quoteChar: quoteChar,
        dataBaseProvider: dataBaseProvider,
      ),
    );
  }
}

/// A mixin that provides utility functions for working with SQL.
mixin SqlUtil {
  /// The default quote character used for wrapping column names.
  static String? defaultQuoteChar = '[';

  /// Returns a comma-separated string of wrapped column names from the given list.
  ///
  /// The [quoteChar] parameter specifies the quote character to use for wrapping column names.
  /// The [dataBaseProvider] parameter is used to determine the appropriate quote character if [quoteChar] is not provided.
  static String columnsFromList({required List<String> items, dynamic quoteChar, String dataBaseProvider = ""}) =>
      items.map((x) => x.split(".").map((e) => SqlUtil.wrap(e, quoteChar, dataBaseProvider)).join(".")).join(", ");

  /// Returns a comma-separated string of wrapped column names from the given map.
  ///
  /// The [quoteChar] parameter specifies the quote character to use for wrapping column names.
  /// The [dataBaseProvider] parameter is used to determine the appropriate quote character if [quoteChar] is not provided.
  static String columnsFromMap<K, V>({required Map<K, V> items, dynamic quoteChar, String dataBaseProvider = ""}) =>
      columnsFromList(items: items.keys.map((x) => "$x").toList(), quoteChar: quoteChar, dataBaseProvider: dataBaseProvider);

  static String generateSQLSearch(List<dynamic> values, List<String> columns, [string? quoteChar, String dataBaseProvider = ""]) {
    var whereClause = "";

    for (string column in columns.whereValid) {
      for (var value in values.whereValid) {
        if (whereClause.isNotEmpty) {
          whereClause += ' OR ';
        }
        whereClause += "${SqlUtil.wrap(column, quoteChar, dataBaseProvider)} LIKE ${SqlUtil.value(value, true)}";
      }
    }

    return whereClause.wrap("(");
  }

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

  /// Checks if the given database provider is MySQL.
  static bool isMySql(String dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    return dataBaseProvider.flatEqualAny(["mysql", "maria", "mariadb", "my", "mysqlconnector"]);
  }

  /// Checks if the given database provider is SQL Server.
  static bool isSqlServer(String dataBaseProvider) {
    dataBaseProvider = dataBaseProvider - " ";
    return dataBaseProvider.flatEqualAny(["sqlserver", "mssql", "microsoftsqlserver", "sqlclient", "ms"]);
  }

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

  static String replaceSQLParameters(string s, JsonRow params, [bool nullAsBlank = true, string parameterMatch = ":"]) =>
      s.replaceParameters(params.map((k, v) => MapEntry(k, value(v, nullAsBlank))), parameterMatch);

  /// Returns the appropriate "TOP" or "LIMIT" clause based on the given database provider and count.
  ///
  /// If [count] is not null, it returns "TOP(count)" for SQL Server and "LIMIT count" for MySQL.
  /// Otherwise, it returns an empty string.
  static String topOrLimit(String dataBaseProvider, int? count) {
    if (count != null && count > 0) {
      if (isSqlServer(dataBaseProvider)) {
        return "TOP($count)";
      }
      if (isMySql(dataBaseProvider)) {
        return "LIMIT $count";
      }
    }
    return "";
  }

  static string value<T>(T? value, [bool nullAsBlank = false, bool quoteStrings = true]) {
    // return a string of this object as a SQL Value
    if (value == null) {
      if (quoteStrings) {
        return nullAsBlank ? "''" : "NULL";
      } else {
        return "";
      }
    } else if (value is Map) {
      return SqlUtil.value(jsonEncode(value), nullAsBlank);
    } else if (value is Iterable) {
      return value.map((e) => SqlUtil.value(e, nullAsBlank, quoteStrings)).join(", ").wrap("(");
    } else if (value is num) {
      return value.toString();
    } else if (value is bool) {
      return value == true ? "1" : "0";
    } else if (value is DateTime) {
      return quoteStrings ? "'${value.toIso8601String()}'" : value.toIso8601String();
    } else {
      string s = changeTo(value);
      if (s.isBlank && nullAsBlank == false) {
        return quoteStrings ? "NULL" : "";
      } else {
        return quoteStrings ? "'${s.replaceAll("'", "''")}'" : s.replaceAll("'", "''");
      }
    }
  }

  /// Returns a comma-separated string of SQL values from the given list.
  ///
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  static String valuesFromList({required Iterable<dynamic> items, bool nullAsBlank = false}) => items.map((e) => value(e, nullAsBlank)).join(", ");

  /// Returns a comma-separated string of SQL values from the given map.
  ///
  /// The [nullAsBlank] parameter determines whether null values should be treated as blank strings.
  static String valuesFromMap({required Map<dynamic, dynamic> items, bool nullAsBlank = false}) => valuesFromList(items: items.values, nullAsBlank: nullAsBlank);

  /// Wraps the given object name with the specified quote character.
  /// If the quote character is not provided and the database provider is specified, it uses the appropriate quote character.
  /// Otherwise, it uses the [defaultQuoteChar].
  static wrap(String objectName, [dynamic quoteChar, String dataBaseProvider = ""]) {
    if (quoteChar is bool) {
      if (quoteChar == false) {
        return objectName;
      } else {
        quoteChar = null;
      }
    }

    quoteChar ??= SqlUtil.quoteCharFromProvider(dataBaseProvider);

    if (quoteChar is List) {
      quoteChar = quoteChar.map((x) => flatString(x));
    } else if (quoteChar != null && quoteChar is! String) {
      quoteChar = flatString(quoteChar);
    }

    if (quoteChar is String) {
      quoteChar = [quoteChar];
    }

    if (quoteChar is List && quoteChar.isNotEmpty) {
      var oq = quoteChar.firstOrNull ?? SqlUtil.quoteCharFromProvider(dataBaseProvider);
      var cq = quoteChar.skip(1).lastOrNull;
      return objectName.wrap(flatString(oq), flatString(cq));
    } else {
      return objectName;
    }
  }
}

///
extension SqlRowExtensions on JsonRow {
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
    dynamic quoteChar,
    String dataBaseProvider = "",
  }) {
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
    dynamic quoteChar,
  ]) {
    String whereClause = asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );

    return """DELETE FROM ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} WHERE $idColumn in (
                SELECT ${SqlUtil.isSqlServer(dataBaseProvider) ? "TOP($count)" : ""} $idColumn
                FROM ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)}
                WHERE $whereClause
                ORDER BY $idColumn ${asc ? "ASC" : "DESC"} ${SqlUtil.isMySql(dataBaseProvider) ? "LIMIT $count" : ""}
              );""";
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
    dynamic quoteChar,
    String dataBaseProvider = "",
  }) {
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
    dynamic quoteChar,
    String dataBaseProvider = "",
    bool and = true,
  }) {
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
    dynamic quoteChar,
    String dataBaseProvider = "",
  }) {
    var upsertMap = JsonRow.from(this);
    String updates = upsertMap.entries.map((e) => "${SqlUtil.wrap(e.key, quoteChar, dataBaseProvider)} = ${SqlUtil.value(e.value, nullAsBlank)}").join(', ');
    String whereClause = where.asWhereClausule(
      nullAsBlank: nullAsBlank,
      quoteChar: quoteChar,
      dataBaseProvider: dataBaseProvider,
    );

    return 'UPDATE ${SqlUtil.wrap(tableName, quoteChar, dataBaseProvider)} SET $updates WHERE $whereClause;';
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
    dynamic quoteChar,
    String dataBaseProvider = "",
  }) {
    if (where.isValid()) {
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
    dynamic quoteChar,
    String dataBaseProvider = "",
    bool and = true,
  }) {
    return entries
        .map((e) => "${SqlUtil.wrap(e.key, quoteChar, dataBaseProvider)} ${e.value == null && nullAsBlank == false ? "is" : "="} ${SqlUtil.value(e.value, nullAsBlank)}")
        .join(' ${and ? "AND" : "OR"} ');
  }

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
  String generateSqlCall(String procedureName, String dataBaseProvider, [bool nullAsBlank = false, dynamic quoteChar]) {
    var sqlCall = '';

    bool isMySql = dataBaseProvider.flatEqualAny(["mysql", "mariadb"]);
    bool isSqlServer = dataBaseProvider.flatEqualAny(["mssql", "sqlserver"]);

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
        return SqlUtil.value(e.value, nullAsBlank);
      } else if (isSqlServer) {
        return '@${e.key} = ${SqlUtil.value(e.value, nullAsBlank)}';
      }
    }).join(", ");

    if (isMySql) {
      sqlCall += ');';
    }

    return sqlCall;
  }
}
