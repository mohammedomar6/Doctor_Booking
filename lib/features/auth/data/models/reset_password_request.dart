// To parse this JSON data, do
//
//     final resetPasswordRequest = resetPasswordRequestFromJson(jsonString);

import 'dart:convert';

ResetPasswordRequest resetPasswordRequestFromJson(String str) => ResetPasswordRequest.fromJson(json.decode(str));

String resetPasswordRequestToJson(ResetPasswordRequest data) => json.encode(data.toJson());

class ResetPasswordRequest {
  final String password;

  ResetPasswordRequest({
    required this.password,
  });

  ResetPasswordRequest copyWith({
    String? password,
  }) =>
      ResetPasswordRequest(
        password: password ?? this.password,
      );

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) => ResetPasswordRequest(
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
  };
}
