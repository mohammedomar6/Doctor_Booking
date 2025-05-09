// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String status;
  final String token;
  final User user;

  LoginResponse({
    required this.status,
    required this.token,
    required this.user,
  });

  LoginResponse copyWith({
    String? status,
    String? token,
    User? user,
  }) =>
      LoginResponse(
        status: status ?? this.status,
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final String email;
  final String role;
  final String createdAt;
  final String id;

  User({
    required this.email,
    required this.role,
    required this.createdAt,
    required this.id,
  });

  User copyWith({
    String? email,
    String? role,
    String? createdAt,
    String? id,
  }) =>
      User(
        email: email ?? this.email,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    role: json["role"],
    createdAt: json["createdAt"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "role": role,
    "createdAt": createdAt,
    "_id": id,
  };
}
