// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:innerlibs/innerlibs.dart';

class SQLResponse extends SQLResponseOf<dynamic> {
  SQLResponse({required super.sql, required super.status, required super.data, required super.dataSetType, super.message});

  factory SQLResponse.fromJson(JsonMap json) => SQLResponse(
        sql: json['sql'] as String? ?? "",
        status: json['status'] as String? ?? "",
        data: json['data'],
        message: json['message'] as String? ?? "",
        dataSetType: json['dataSetType'] as String? ?? "",
      );
}

class SQLResponseOf<T extends Object?> {
  final String sql;
  final String status;
  final T? data;

  final String message;
  final String dataSetType;
  SQLResponseOf({
    required this.sql,
    required this.status,
    required this.data,
    required this.dataSetType,
    this.message = "",
  });

  factory SQLResponseOf.empty({string? message, string dataSetType = "table", string? sql}) => SQLResponseOf<T>(sql: sql ?? "", status: "empty", message: message ?? "response is empty", dataSetType: dataSetType, data: null);

  factory SQLResponseOf.error({string? message, string dataSetType = "table", string? sql}) => SQLResponseOf<T>(sql: sql ?? "", status: "error", message: message ?? "error", dataSetType: dataSetType, data: null);

  factory SQLResponseOf.fromData(T data, {string sql = "", string dataSetType = "table"}) {
    string message = "";
    string status = "OK";
    try {
      if (data is Iterable) {
        status = List.from(data).isEmpty ? "empty" : "OK";
      }
      if (data is MapBase) {
        status = Map.from(data).isEmpty ? "empty" : "OK";
      }
    } catch (e) {
      message = "$e";
      status = "error";
    }

    return SQLResponseOf<T>(sql: sql, status: status, data: data, dataSetType: dataSetType, message: message);
  }
  factory SQLResponseOf.fromJson(JsonMap json) => SQLResponseOf(
        sql: json['SQL'] as String? ?? "",
        status: json['Status'] as String? ?? "",
        data: json['Data'],
        message: json['Message'] as String? ?? "",
        dataSetType: json['DataSetType'] as String? ?? "",
      );

  string get error {
    if (hasError) return message;
    return "";
  }

  bool get hasData => data != null;

  bool get hasError => status.flatEqual("error");

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
