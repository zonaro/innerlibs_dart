import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on JsonRow {
  static string defaultQuoteChar = '[';

  String asUpsertCommand(String tableName, [Map<String, dynamic>? primaryKeys, bool nullAsBlank = false, string? quoteChar]) {
    if (primaryKeys.isValid) {
      return asUpdateCommand(tableName, primaryKeys!, nullAsBlank, quoteChar ?? defaultQuoteChar);
    } else {
      return asInsertCommand(tableName, nullAsBlank, quoteChar ?? defaultQuoteChar);
    }
  }

  string asInsertCommand(string tableName, [bool nullAsBlank = false, string? quoteChar]) {
    String columns = keys.map((e) => e.wrap(quoteChar ?? defaultQuoteChar)).join(', ');
    String values = this.values.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(', ');
    return 'INSERT INTO ${tableName.wrap(quoteChar ?? defaultQuoteChar)} ($columns) VALUES ($values);';
  }

  string asUpdateCommand(string tableName, JsonMap primaryKeys, [bool nullAsBlank = false, string? quoteChar]) {
    var upsertMap = JsonRow.from(this);
    primaryKeys.keys.forEach(upsertMap.remove);
    String updates = upsertMap.entries.map((e) => "${e.key.wrap(quoteChar ?? defaultQuoteChar)} = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
    String whereClause = primaryKeys.asWhereClausule(nullAsBlank, quoteChar);

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
