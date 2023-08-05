import 'dart:convert';

import 'package:anyideas/models/account_user.dart';
import 'package:http/http.dart' as http;

class ApiCenter {
  final String _baseUrl = 'http://localhost:5000/api/';

  httpPost(data, apiUrl) async {
    var fullUrl = _baseUrl + apiUrl;
    data['user_token'] = UserAccount().token;
    
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

  _setHeaders() => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
}
