// To parse this JSON data, do
//
//     final reviewReponseModel = reviewReponseModelFromJson(jsonString);

import 'dart:convert';

ReviewReponseModel reviewReponseModelFromJson(String str) => ReviewReponseModel.fromJson(json.decode(str));

String reviewReponseModelToJson(ReviewReponseModel data) => json.encode(data.toJson());

class ReviewReponseModel {
  String status;
  Doc doc;

  ReviewReponseModel({
    required this.status,
    required this.doc,
  });

  factory ReviewReponseModel.fromJson(Map<String, dynamic> json) => ReviewReponseModel(
    status: json["status"],
    doc: Doc.fromJson(json["doc"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "doc": doc.toJson(),
  };
}

class Doc {
  String message;
  num rate;
  String pataint;
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  Doc({
    required this.message,
    required this.rate,
    required this.pataint,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    message: json["message"],
    rate: json["rate"],
    pataint: json["pataint"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "rate": rate,
    "pataint": pataint,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
