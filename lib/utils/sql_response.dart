// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:innerlibs/innerlibs.dart';

class SQLResponse {
  final String sql;
  final String status;
  final dynamic data;
  final bool hasData;
  final bool hasError;
  final String message;
  final String dataSetType;

  SQLResponse({
    required this.hasData,
    required this.sql,
    required this.status,
    required this.data,
    required this.hasError,
    required this.dataSetType,
    this.message = "",
  });

  factory SQLResponse.fromData(dynamic data, {string sql = "", string dataSetType = "table"}) {
    bool haserror = false;
    string message = "";
    bool hasdata = false;
    string status = "OK";
    try {
      hasdata = data.isValid;
      if (data is Iterable) {
        status = List.from(data).isEmpty ? "empty" : "OK";
      }
      if (data is MapBase) {
        status = Map.from(data).isEmpty ? "empty" : "OK";
      }
    } catch (e) {
      message = "$e";
      haserror = true;
      status = "error";
    }

    return SQLResponse(hasData: hasdata, sql: sql, status: status, data: data, hasError: haserror, dataSetType: dataSetType, message: message);
  }
  factory SQLResponse.empty() => SQLResponse(hasData: false, sql: "", status: "empty", data: [], hasError: false, message: "empty data placeholder", dataSetType: "table");
  factory SQLResponse.error() => SQLResponse(hasData: false, sql: "", status: "error", data: [], hasError: true, message: "error placeholder", dataSetType: "table");

  factory SQLResponse.fromJson(JsonMap json) => SQLResponse(
        hasData: json['HasData'] as bool,
        sql: json['SQL'] as String,
        status: json['Status'] as String,
        data: json['Data'],
        hasError: json['HasError'] as bool,
        message: json['Message'] as String? ?? "",
        dataSetType: json['DataSetType'] as String? ?? "",
      );

  JsonMap toJson() => <String, dynamic>{
        'SQL': sql,
        'Status': status,
        'Data': data,
        'HasData': hasData,
        'HasError': hasError,
        'Message': message,
        "DataSetType": dataSetType,
      };
}
