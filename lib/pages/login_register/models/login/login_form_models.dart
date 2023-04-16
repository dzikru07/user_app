// To parse this JSON data, do
//
//     final loginFormModels = loginFormModelsFromJson(jsonString);

import 'dart:convert';

LoginFormModels loginFormModelsFromJson(String str) =>
    LoginFormModels.fromJson(json.decode(str));

String loginFormModelsToJson(LoginFormModels data) =>
    json.encode(data.toJson());

class LoginFormModels {
  LoginFormModels({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory LoginFormModels.fromJson(Map<String, dynamic> json) =>
      LoginFormModels(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
