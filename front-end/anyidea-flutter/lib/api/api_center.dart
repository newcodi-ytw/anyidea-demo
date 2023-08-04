import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCenter {
  final String _baseUrl = 'http://192.168.0.1/api/';

  httpPost(data, apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    data['token'] = await _getToken();

    print(data);
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  requestLogin(data) async {
    return await httpPost(data, 'login');
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('token');
    token ??= "";

    return token;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
