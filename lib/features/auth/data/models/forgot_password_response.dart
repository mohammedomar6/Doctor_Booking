// To parse this JSON data, do
//
//     final forgotPasswordResponse = forgotPasswordResponseFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));

String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());

class ForgotPasswordResponse {
  final String status;
  final String message;
  final String url;

  ForgotPasswordResponse({
    required this.status,
    required this.message,
    required this.url,
  });

  ForgotPasswordResponse copyWith({
    String? status,
    String? message,
    String? url,
  }) =>
      ForgotPasswordResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        url: url ?? this.url,
      );

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
    status: json["status"],
    message: json["message"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "url": url,
  };
}
