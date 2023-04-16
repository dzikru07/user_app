// To parse this JSON data, do
//
//     final registerFormModels = registerFormModelsFromJson(jsonString);

import 'dart:convert';

RegisterFormModels registerFormModelsFromJson(String str) =>
    RegisterFormModels.fromJson(json.decode(str));

String registerFormModelsToJson(RegisterFormModels data) =>
    json.encode(data.toJson());

class RegisterFormModels {
  RegisterFormModels({
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.role,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.password,
    required this.strictPassword,
    required this.referralCode,
  });

  String email;
  String hp;
  String firstname;
  String lastname;
  String grup;
  String role;
  String tglLahir;
  int jenisKelamin;
  String password;
  bool strictPassword;
  String referralCode;

  factory RegisterFormModels.fromJson(Map<String, dynamic> json) =>
      RegisterFormModels(
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        role: json["role"],
        tglLahir: json["tgl_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        password: json["password"],
        strictPassword: json["strict_password"],
        referralCode: json["referral_code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "role": role,
        "tgl_lahir": tglLahir,
        "jenis_kelamin": jenisKelamin,
        "password": password,
        "strict_password": strictPassword,
        "referral_code": referralCode,
      };
}
