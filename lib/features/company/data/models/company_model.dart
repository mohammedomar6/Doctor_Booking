// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  String status;
  int results;
  List<Doc>? doc;

  CompanyModel({
    required this.status,
    required this.results,
     this.doc,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    status: json["status"],
    results: json["results"],
    doc: List<Doc>.from(json["doc"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "doc": List<dynamic>.from(doc!.map((x) => x.toJson())),
  };
}

class Doc {
  String id;
  String name;
  int sall;
  String descreption;
  DateTime createdAt;
  DateTime updatedAt;

  Doc({
    required this.id,
    required this.name,
    required this.sall,
    required this.descreption,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    name: json["name"],
    sall: json["sall"],
    descreption: json["descreption"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "sall": sall,
    "descreption": descreption,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
