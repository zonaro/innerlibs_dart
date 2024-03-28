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
    String whereClause = primaryKeys.entries.map((e) => "${e.key.wrap(quoteChar ?? defaultQuoteChar)} = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' AND ');
    return 'UPDATE ${tableName.wrap(quoteChar ?? defaultQuoteChar)} SET $updates WHERE $whereClause;';
  }

  String asDeleteCommand(String tableName, [string? quoteChar]) {
    String whereClause = entries.map((e) => "${e.key.wrap(quoteChar ?? defaultQuoteChar)} = ${(e.value as Object?).asSqlValue()}").join(' AND ');
    return 'DELETE FROM ${tableName.wrap(quoteChar ?? defaultQuoteChar)} WHERE $whereClause;';
  }
}
