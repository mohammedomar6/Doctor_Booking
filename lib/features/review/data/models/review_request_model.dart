// To parse this JSON data, do
//
//     final reviewRequestModel = reviewRequestModelFromJson(jsonString);

import 'dart:convert';

ReviewRequestModel reviewRequestModelFromJson(String str) => ReviewRequestModel.fromJson(json.decode(str));

String reviewRequestModelToJson(ReviewRequestModel data) => json.encode(data.toJson());

class ReviewRequestModel {
  String message;
  num rate;

  ReviewRequestModel({
    required this.message,
    required this.rate,
  });

  factory ReviewRequestModel.fromJson(Map<String, dynamic> json) => ReviewRequestModel(
    message: json["message"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rate": rate,
  };
}
