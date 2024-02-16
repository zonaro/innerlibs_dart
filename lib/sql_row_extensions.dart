import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on SQLResponseRow {
  String asUpsertCommand(String tableName, [Map<String, dynamic>? primaryKeys, bool nullAsBlank = false]) {
    if (primaryKeys.isValid) {
      primaryKeys!.keys.forEach(remove);
      String updates = entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(', ');
      String whereClause = primaryKeys.entries.map((e) => "[${e.key}] = ${(e.value as Object?).asSqlValue(nullAsBlank)}").join(' AND ');
      return 'UPDATE $tableName SET $updates WHERE $whereClause;';
    } else {
      String columns = keys.join(', ');
      String values = this.values.map((e) => (e as Object?).asSqlValue(nullAsBlank)).join(', ');
      return 'INSERT INTO $tableName ($columns) VALUES ($values);';
    }
  }
}
