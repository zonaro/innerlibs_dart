import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on SQLResponseRow {
  String asUpsertCommand(String tableName, [Map<String, dynamic>? primaryKeys, bool nullAsBlank = false]) {
    var upsertMap = Map.from(this);
    if (primaryKeys.isValid) {
      primaryKeys!.keys.forEach(upsertMap.remove);
      String updates = upsertMap.entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
      String whereClause = primaryKeys.entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' AND ');
      return 'UPDATE $tableName SET $updates WHERE $whereClause;';
    } else {
      String columns = upsertMap.keys.map((e) => "[$e]").join(', ');
      String values = upsertMap.values.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(', ');
      return 'INSERT INTO $tableName ($columns) VALUES ($values);';
    }
  }

  String asDeleteCommand(String tableName) {
    String whereClause = entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue()}").join(' AND ');
    return 'DELETE $tableName WHERE $whereClause;';
  }
}
