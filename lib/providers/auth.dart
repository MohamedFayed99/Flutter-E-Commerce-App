import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

// signUpUrl = https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY];
// loginUrl  = https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY];
// apiKey = 'AIzaSyDwOS-hzAeg_QIBueeseoEmyAHssXboNck';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool isLoggedIn = false;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDwOS-hzAeg_QIBueeseoEmyAHssXboNck';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }


}
