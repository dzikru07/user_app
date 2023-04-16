// To parse this JSON data, do
//
//     final errorRegisterModels = errorRegisterModelsFromJson(jsonString);

import 'dart:convert';

ErrorRegisterModels errorRegisterModelsFromJson(String str) =>
    ErrorRegisterModels.fromJson(json.decode(str));

String errorRegisterModelsToJson(ErrorRegisterModels data) =>
    json.encode(data.toJson());

class ErrorRegisterModels {
  ErrorRegisterModels({
    required this.status,
  });

  Status status;

  factory ErrorRegisterModels.fromJson(Map<String, dynamic> json) =>
      ErrorRegisterModels(
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
