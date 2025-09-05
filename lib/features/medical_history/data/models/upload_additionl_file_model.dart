// To parse this JSON data, do
//
//     final uploadAdditionallFIleModel = uploadAdditionallFIleModelFromJson(jsonString);

import 'dart:convert';

UploadAdditionallFIleModel uploadAdditionallFIleModelFromJson(String str) => UploadAdditionallFIleModel.fromJson(json.decode(str));

String uploadAdditionallFIleModelToJson(UploadAdditionallFIleModel data) => json.encode(data.toJson());

class UploadAdditionallFIleModel {
  String file;

  UploadAdditionallFIleModel({
    required this.file,
  });

  factory UploadAdditionallFIleModel.fromJson(Map<String, dynamic> json) => UploadAdditionallFIleModel(
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "file": file,
  };
}
