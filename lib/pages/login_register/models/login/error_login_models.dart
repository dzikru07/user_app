// To parse this JSON data, do
//
//     final errorLoginModels = errorLoginModelsFromJson(jsonString);

import 'dart:convert';

ErrorLoginModels errorLoginModelsFromJson(String str) =>
    ErrorLoginModels.fromJson(json.decode(str));

String errorLoginModelsToJson(ErrorLoginModels data) =>
    json.encode(data.toJson());

class ErrorLoginModels {
  ErrorLoginModels({
    required this.status,
  });

  Status status;

  factory ErrorLoginModels.fromJson(Map<String, dynamic> json) =>
      ErrorLoginModels(
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
      };
}

class Status {
  Status({
    required this.kode,
    required this.keterangan,
  });

  String kode;
  String keterangan;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}
