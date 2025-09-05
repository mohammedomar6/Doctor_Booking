// To parse this JSON data, do
//
//     final additionallResponseModel = additionallResponseModelFromJson(jsonString);

import 'dart:convert';

AdditionallResponseModel additionallResponseModelFromJson(String str) => AdditionallResponseModel.fromJson(json.decode(str));

String additionallResponseModelToJson(AdditionallResponseModel data) => json.encode(data.toJson());

class AdditionallResponseModel {
  String status;
  int results;
  List<Doc> doc;

  AdditionallResponseModel({
    required this.status,
    required this.results,
    required this.doc,
  });

  factory AdditionallResponseModel.fromJson(Map<String, dynamic> json) => AdditionallResponseModel(
    status: json["status"],
    results: json["results"],
    doc: List<Doc>.from(json["doc"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "doc": List<dynamic>.from(doc.map((x) => x.toJson())),
  };
}

class Doc {
  String id;
  String recourd;
  String name;
  String type;
  String file;

  Doc({
    required this.id,
    required this.recourd,
    required this.name,
    required this.type,
    required this.file,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    recourd: json["recourd"],
    name: json["name"],
    type: json["type"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "recourd": recourd,
    "name": name,
    "type": type,
    "file": file,
  };
}
