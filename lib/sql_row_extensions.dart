import 'package:innerlibs/innerlibs.dart';

extension SqlRowExtensions on SQLResponseRow {
  String asUpsertCommand(String tableName, [Map<String, dynamic>? primaryKeys]) {
    if (primaryKeys != null && primaryKeys.isNotEmpty && primaryKeys.values.any((e) => e.isNotBlank)) {
      primaryKeys.keys.forEach(remove);
      String updates = entries.map((e) => "${e.key} = ${(e.value).asSqlValue}").join(', ');
      String whereClause = primaryKeys.entries.map((e) => "${e.key} = ${(e.value).asSqlValue}").join(' AND ');
      return 'UPDATE $tableName SET $updates WHERE $whereClause;';
    } else {
      String columns = keys.join(', ');
      String values = this.values.map((e) => (e).asSqlValue).join(', ');
      return 'INSERT INTO $tableName ($columns) VALUES ($values);';
    }
  }
}
