// To parse this JSON data, do
//
//     final pataintResponse = pataintResponseFromJson(jsonString);

import 'dart:convert';

PataintResponse pataintResponseFromJson(String str) => PataintResponse.fromJson(json.decode(str));

String pataintResponseToJson(PataintResponse data) => json.encode(data.toJson());

class PataintResponse {
  String status;
  Doc doc;

  PataintResponse({
    required this.status,
    required this.doc,
  });

  factory PataintResponse.fromJson(Map<String, dynamic> json) => PataintResponse(
    status: json["status"],
    doc: Doc.fromJson(json["doc"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "doc": doc.toJson(),
  };
}

class Doc {
  String firstName;
  Object information;
  String lastName;
  String phone;
  String adderss;
  String sex;
  String blood;
  DateTime birthDay;
  String photo;
  String? insurance;
  String? imageInsurance;
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  Doc({
    required this.firstName,
    required this.information,
    required this.lastName,
    required this.phone,
    required this.adderss,
    required this.sex,
    required this.blood,
    required this.birthDay,
    required this.photo,
    required this.insurance,
    required this.imageInsurance,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    firstName: json["first_name"],
    information: json["information"],
    lastName: json["last_name"],
    phone: json["phone"],
    adderss: json["adderss"],
    sex: json["sex"],
    blood: json["blood"],
    birthDay: DateTime.parse(json["birth_day"]),
    photo: json["photo"],
    insurance: json["insurance"],
    imageInsurance: json["image_insurance"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "information": information,
    "last_name": lastName,
    "phone": phone,
    "adderss": adderss,
    "sex": sex,
    "blood": blood,
    "birth_day": birthDay.toIso8601String(),
    "photo": photo,
    "insurance": insurance,
    "image_insurance": imageInsurance,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
