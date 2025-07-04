// To parse this JSON data, do
//
//     final medicalHistoryResponse = medicalHistoryResponseFromJson(jsonString);

import 'dart:convert';

MedicalHistoryResponse medicalHistoryResponseFromJson(String str) => MedicalHistoryResponse.fromJson(json.decode(str));

String medicalHistoryResponseToJson(MedicalHistoryResponse data) => json.encode(data.toJson());

class MedicalHistoryResponse {
  String status;
  int results;
  List<Doc> doc;

  MedicalHistoryResponse({
    required this.status,
    required this.results,
    required this.doc,
  });

  factory MedicalHistoryResponse.fromJson(Map<String, dynamic> json) => MedicalHistoryResponse(
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
  String symptoms;
  String diagnosis;
  List<Recipe> recipe;
  String department;
  DateId dateId;
  String pataint;
  Doctor doctor;
  DateTime createdAt;
  DateTime updatedAt;

  Doc({
    required this.id,
    required this.symptoms,
    required this.diagnosis,
    required this.recipe,
    required this.department,
    required this.dateId,
    required this.pataint,
    required this.doctor,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    symptoms: json["symptoms"],
    diagnosis: json["diagnosis"],
    recipe: List<Recipe>.from(json["recipe"].map((x) => Recipe.fromJson(x))),
    department: json["department"],
    dateId: DateId.fromJson(json["dateId"]),
    pataint: json["pataint"],
    doctor: Doctor.fromJson(json["doctor"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "symptoms": symptoms,
    "diagnosis": diagnosis,
    "recipe": List<dynamic>.from(recipe.map((x) => x.toJson())),
    "department": department,
    "dateId": dateId.toJson(),
    "pataint": pataint,
    "doctor": doctor.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class DateId {
  String status;
  DateTime date;
  DateTime? nextDate;

  DateId({
    required this.status,
    required this.date,
    this.nextDate,
  });

  factory DateId.fromJson(Map<String, dynamic> json) => DateId(
    status: json["status"],
    date: DateTime.parse(json["date"]),
    nextDate: json["nextDate"] == null ? null : DateTime.parse(json["nextDate"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "date": date.toIso8601String(),
    "nextDate": nextDate?.toIso8601String(),
  };
}

class Doctor {
  String firstName;
  String lastName;

  Doctor({
    required this.firstName,
    required this.lastName,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
  };
}

class Recipe {
  String name;
  int count;
  String details;
  String id;

  Recipe({
    required this.name,
    required this.count,
    required this.details,
    required this.id,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    name: json["name"],
    count: json["count"],
    details: json["details"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "count": count,
    "details": details,
    "_id": id,
  };
}
