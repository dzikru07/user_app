import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/pages/login_register/models/login/login_models.dart';
import 'package:user_app/pages/login_register/models/register/register_form_models.dart';

import '../../../service/api.dart';
import '../models/login/login_form_models.dart';

class LoginRegisterViewModels {
  ApiService _apiService = ApiService();

  postRegister(RegisterFormModels data) async {
    try {
      http.Response response =
          await _apiService.postApiData('/users', jsonEncode(data));
      return response;
    } catch (e) {
      return e;
    }
  }

  postLogin(LoginFormModels data) async {
    final formData = FormData.fromMap({
      'username': data.username,
      'password': data.password,
    });
    try {
      Response response =
          await _apiService.postApiDataFormData('/login', formData);
      // var data = LoginModels.fromJson(response.data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
