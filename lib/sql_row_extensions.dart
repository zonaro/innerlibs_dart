import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on JsonRow {
  String asUpsertCommand(String tableName, [Map<String, dynamic>? primaryKeys, bool nullAsBlank = false]) {
    if (primaryKeys.isValid) {
      return asUpdateCommand(tableName, primaryKeys!, nullAsBlank);
    } else {
      return asInsertCommand(tableName, nullAsBlank);
    }
  }

  string asInsertCommand(string tableName, [bool nullAsBlank = false]) {
    String columns = keys.map((e) => "[$e]").join(', ');
    String values = this.values.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(', ');
    return 'INSERT INTO $tableName ($columns) VALUES ($values);';
  }

  string asUpdateCommand(string tableName, JsonMap primaryKeys, [bool nullAsBlank = false]) {
    var upsertMap = Map.from(this);
    primaryKeys.keys.forEach(upsertMap.remove);
    String updates = upsertMap.entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
    String whereClause = primaryKeys.entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' AND ');
    return 'UPDATE $tableName SET $updates WHERE $whereClause;';
  }

  String asDeleteCommand(String tableName) {
    String whereClause = entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue()}").join(' AND ');
    return 'DELETE $tableName WHERE $whereClause;';
  }
}
