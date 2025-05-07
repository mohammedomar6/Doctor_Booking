// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String status;
  final User user;
  final String tokens;

  LoginResponse({
    required this.status,
    required this.user,
    required this.tokens,
  });

  LoginResponse copyWith({
    String? status,
    User? user,
    String? tokens,
  }) =>
      LoginResponse(
        status: status ?? this.status,
        user: user ?? this.user,
        tokens: tokens ?? this.tokens,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    user: User.fromJson(json["user"]),
    tokens: json["tokens"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user.toJson(),
    "tokens": tokens,
  };
}

class User {
  final String id;
  final String email;
  final String name;
  final String role;
  final String photo;
  final String active;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.photo,
    required this.active,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? role,
    String? photo,
    String? active,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        photo: photo ?? this.photo,
        active: active ?? this.active,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    role: json["role"],
    photo: json["photo"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "role": role,
    "photo": photo,
    "active": active,
  };
}
