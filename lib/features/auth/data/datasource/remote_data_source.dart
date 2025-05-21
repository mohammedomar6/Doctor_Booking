
import 'dart:convert';
import 'dart:developer';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/auth/data/models/forgot_password_request.dart';
import 'package:doctor_booking1/features/auth/data/models/forgot_password_response.dart';
import 'package:doctor_booking1/features/auth/data/models/reset_password_request.dart';
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

    if (response.statusCode == 200) {
      print('sucssefully login user ${response.statusCode}');
    final data = jsonDecode(response.body);
    return LoginResponse.fromJson(data);
  } else {
      print('faild login user ${response.statusCode}');
      throw Exception('فشل تسجيل الدخول:${response.body}');
    }
  }
}

class SignUpData {
  Future<LoginResponse> signUpUser(SignUpRequest request) async {
    final url = Uri.parse('${MyStrings.baseUrl}users/signup');

    final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request.toJson()),
  );

    if (response.statusCode == 201) {
      print('sucssefully Sign up user ${response.statusCode}');
    final data = jsonDecode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      print('faild sign up user ${response.statusCode}');
      throw Exception('فشل انشاء الحساب:${response.body}');
    }
  }
}
class ForgotPasswordData{
  String? token ;
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request) async {
    final url = Uri.parse('${MyStrings.baseUrl}users/forgotPassword');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );


    if (response.statusCode == 200) {
      print('sucssefully send email  ${response.statusCode}');
      final data = jsonDecode(response.body);
      log(data['url'].toString());
      Uri uri = Uri.parse(data['url']);
      token= uri.pathSegments.last;
      return ForgotPasswordResponse.fromJson(data);
    } else if(response.statusCode==404) {
      print('faild send email  ${response.statusCode}');
      throw Exception('  الايميل غير موجود :${response.body}');
    }
    else{
      throw Exception('     :${response.body}');
    }
  }
  Future<LoginResponse> resetPassword(ResetPasswordRequest request) async {
    final url = Uri.parse('${MyStrings.baseUrl}users/resetpassword/$token');

    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      print('sucssefully reset password  ${response.statusCode}');
      final data = jsonDecode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      print('faild  reset password  ${response.statusCode}');
      throw Exception('  Token is invalid or has expired :${response.body}');
    }
  }
}
