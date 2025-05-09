
import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/auth/data/models/sign_up_request.dart';
import 'package:http/http.dart' as http;

import '../models/login_request.dart' show LoginRequest;
import '../models/login_response.dart';

class LoginData {
  Future<LoginResponse> loginUser(LoginRequest request) async {
    final url = Uri.parse('${MyStrings.baseUrl}users/login');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request.toJson()),
  );
    print(response.statusCode);
    if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return LoginResponse.fromJson(data);
  } else {
      throw Exception('فشل تسجيل الدخول:${response.body}');
    }
  }
}

class SignUpData {
  Future<LoginResponse> signUpUser(SignUpRequest request) async {
    final url = Uri.parse('${MyStrings.baseUrl}users/SignUp');

    final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request.toJson()),
  );
    print(response.statusCode);
    if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      throw Exception('فشل انشاء الحساب:${response.body}');
    }
  }
}