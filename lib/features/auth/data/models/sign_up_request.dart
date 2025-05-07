// To parse this JSON data, do
//
//     final signUpRequest = signUpRequestFromJson(jsonString);

import 'dart:convert';

SignUpRequest signUpRequestFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String signUpRequestToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
  final String name;
  final String email;
  final String password;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  SignUpRequest copyWith({
    String? name,
    String? email,
    String? password,
  }) =>
      SignUpRequest(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}
