// To parse this JSON data, do
//
//     final doctorTabelReponse = doctorTabelReponseFromJson(jsonString);

import 'dart:convert';

DoctorTabelReponse doctorTabelReponseFromJson(String str) => DoctorTabelReponse.fromJson(json.decode(str));

String doctorTabelReponseToJson(DoctorTabelReponse data) => json.encode(data.toJson());

class DoctorTabelReponse {
  String status;
  List<Datum> data;

  DoctorTabelReponse({
    required this.status,
    required this.data,
  });

  factory DoctorTabelReponse.fromJson(Map<String, dynamic> json) => DoctorTabelReponse(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String department;
  List<Doctor> doctors;

  Datum({
    required this.department,
    required this.doctors,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    department: json["department"],
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "department": department,
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
  };
}

class Doctor {
  String firstName;
  String lastName;
  List<Schedule> schedule;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.schedule,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    firstName: json["first_name"],
    lastName: json["last_name"],
    schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule {
  int first;
  int last;
  String day;
  String id;

  Schedule({
    required this.first,
    required this.last,
    required this.day,
    required this.id,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    first: json["first"],
    last: json["last"],
    day: json["day"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "day": day,
    "_id": id,
  };
}
