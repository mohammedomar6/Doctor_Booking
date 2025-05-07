// To parse this JSON data, do
//
//     final loginRequast = loginRequastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginRequast loginRequastFromJson(String str) => LoginRequast.fromJson(json.decode(str));

String loginRequastToJson(LoginRequast data) => json.encode(data.toJson());

class LoginRequast {
  final String email;
  final String password;

  LoginRequast({
    required this.email,
    required this.password,
  });

  LoginRequast copyWith({
    String? email,
    String? password,
  }) =>
      LoginRequast(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory LoginRequast.fromJson(Map<String, dynamic> json) => LoginRequast(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
