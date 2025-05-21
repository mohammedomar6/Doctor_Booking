// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) => ForgotPasswordRequest.fromJson(json.decode(str));

String forgotPasswordRequestToJson(ForgotPasswordRequest data) => json.encode(data.toJson());

class ForgotPasswordRequest {
  final String email;

  ForgotPasswordRequest({
    required this.email,
  });

  ForgotPasswordRequest copyWith({
    String? email,
  }) =>
      ForgotPasswordRequest(
        email: email ?? this.email,
      );

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => ForgotPasswordRequest(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
