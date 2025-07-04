// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  String status;
  int results;
  List<Doc> doc;

  ProfileResponse({
    required this.status,
    required this.results,
    required this.doc,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
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
  String firstName;
  String information;
  String lastName;
  String phone;
  String adderss;
  String sex;
  String blood;
  DateTime birthDay;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;
  String? insurance;

  Doc({
    required this.id,
    required this.firstName,
    required this.information,
    required this.lastName,
    required this.phone,
    required this.adderss,
    required this.sex,
    required this.blood,
    required this.birthDay,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.insurance,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    firstName: json["first_name"],
    information: json["information"],
    lastName: json["last_name"],
    phone: json["phone"],
    adderss: json["adderss"],
    sex: json["sex"],
    blood: json["blood"],
    birthDay: DateTime.parse(json["birth_day"]),
    photo: json["photo"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    insurance: json["insurance"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "information": information,
    "last_name": lastName,
    "phone": phone,
    "adderss": adderss,
    "sex": sex,
    "blood": blood,
    "birth_day": birthDay.toIso8601String(),
    "photo": photo,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "insurance": insurance,
  };
}
