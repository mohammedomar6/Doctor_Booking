// To parse this JSON data, do
//
//     final pataintRequast = pataintRequastFromJson(jsonString);

import 'dart:convert';

PataintRequast pataintRequastFromJson(String str) => PataintRequast.fromJson(json.decode(str));

String pataintRequastToJson(PataintRequast data) => json.encode(data.toJson());

class PataintRequast {
  String firstName;
  String lastName;
  String information;
  String phone;
  String adderss;
  String sex;
  String blood;
  String birthDay;
  String photo;
  String? insurance;
  String? imageInsurance;

  PataintRequast({
    required this.firstName,
    required this.lastName,
    required this.information,
    required this.phone,
    required this.adderss,
    required this.sex,
    required this.blood,
    required this.birthDay,
    required this.photo,
     this.insurance,
     this.imageInsurance,
  });

  factory PataintRequast.fromJson(Map<String, dynamic> json) => PataintRequast(
    firstName: json["first_name"],
    lastName: json["last_name"],
    information: json["information"],
    phone: json["phone"],
    adderss: json["adderss"],
    sex: json["sex"],
    blood: json["blood"],
    birthDay: json["birth_day"],
    photo: json["photo"],
    insurance: json["insurance"],
    imageInsurance: json["image_insurance"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "information": information,
    "phone": phone,
    "adderss": adderss,
    "sex": sex,
    "blood": blood,
    "birth_day": birthDay,
    "photo": photo,
    "insurance": insurance,
    "image_insurance": imageInsurance,
  };
}
