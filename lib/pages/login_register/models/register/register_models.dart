// To parse this JSON data, do
//
//     final registerModels = registerModelsFromJson(jsonString);

import 'dart:convert';

RegisterModels registerModelsFromJson(String str) =>
    RegisterModels.fromJson(json.decode(str));

String registerModelsToJson(RegisterModels data) => json.encode(data.toJson());

class RegisterModels {
  RegisterModels({
    required this.status,
    required this.data,
  });

  RegisterModelsStatus status;
  Data data;

  factory RegisterModels.fromJson(Map<String, dynamic> json) => RegisterModels(
        status: RegisterModelsStatus.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.status,
    this.refBy,
  });

  int id;
  String email;
  String hp;
  String firstname;
  String lastname;
  String grup;
  DataStatus status;
  dynamic refBy;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        status: DataStatus.fromJson(json["status"]),
        refBy: json["ref_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "status": status.toJson(),
        "ref_by": refBy,
      };
}

class DataStatus {
  DataStatus({
    required this.kode,
    required this.keterangan,
  });

  int kode;
  String keterangan;

  factory DataStatus.fromJson(Map<String, dynamic> json) => DataStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}

class RegisterModelsStatus {
  RegisterModelsStatus({
    required this.kode,
    required this.keterangan,
  });

  String kode;
  String keterangan;

  factory RegisterModelsStatus.fromJson(Map<String, dynamic> json) =>
      RegisterModelsStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}
