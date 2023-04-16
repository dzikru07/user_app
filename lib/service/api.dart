import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _url = "https://grinder.koffiesoft.com";
  var _dio = Dio();

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  Future postApiData(String path, var data) async {
    var _fullUrl = _url + path;
    return await http.post(Uri.parse(_fullUrl),
        headers: _setHeaders(), body: data);
  }

  Future postApiDataFormData(String path, var formData) async {
    var _fullUrl = _url + path;
    return _dio.post(_url + path, data: formData);
  }
}
