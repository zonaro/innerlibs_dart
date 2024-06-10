// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:innerlibs/innerlibs.dart';

class SQLResponse extends SQLResponseOf<dynamic> {
  SQLResponse({required super.hasData, required super.sql, required super.status, required super.data, required super.hasError, required super.dataSetType, super.message});

  factory SQLResponse.fromJson(JsonMap json) => SQLResponse(
        hasData: json['HasData'] as bool,
        sql: json['SQL'] as String? ?? "",
        status: json['Status'] as String? ?? "",
        data: json['Data'],
        hasError: json['HasError'] as bool,
        message: json['Message'] as String? ?? "",
        dataSetType: json['DataSetType'] as String? ?? "",
      );
}

class SQLResponseOf<T extends Object?> {
  final String sql;
  final String status;
  final T? data;
  final bool hasData;
  final bool hasError;
  final String message;
  final String dataSetType;

  string get error {
    if (hasError) return message;
    return "";
  }

  SQLResponseOf({
    required this.hasData,
    required this.sql,
    required this.status,
    required this.data,
    required this.hasError,
    required this.dataSetType,
    this.message = "",
  });

  factory SQLResponseOf.fromData(T data, {string sql = "", string dataSetType = "table"}) {
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

    return SQLResponseOf<T>(hasData: hasdata, sql: sql, status: status, data: data, hasError: haserror, dataSetType: dataSetType, message: message);
  }
  factory SQLResponseOf.empty({string? message, string dataSetType = "table", string? sql}) => SQLResponseOf<T>(hasData: false, sql: sql ?? "", status: "empty", hasError: false, message: message ?? "response is empty", dataSetType: dataSetType, data: null);
  factory SQLResponseOf.error({string? message, string dataSetType = "table", string? sql}) => SQLResponseOf<T>(hasData: false, sql: sql ?? "", status: "error", hasError: true, message: message ?? "error", dataSetType: dataSetType, data: null);

  factory SQLResponseOf.fromJson(JsonMap json) => SQLResponseOf(
        hasData: json['HasData'] as bool,
        sql: json['SQL'] as String? ?? "",
        status: json['Status'] as String? ?? "",
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
