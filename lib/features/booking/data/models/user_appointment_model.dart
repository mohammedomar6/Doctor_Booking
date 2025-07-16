class UserAppointmentModel {
  final String id;
  final bool canceled;
  final String status;
  final int fees;
  final DateTime date;
  final String day;
  final int hour;
  final int minute;
  final DoctorInfo doctor;

  UserAppointmentModel({
    required this.id,
    required this.canceled,
    required this.status,
    required this.fees,
    required this.date,
    required this.day,
    required this.hour,
    required this.minute,
    required this.doctor,
  });

  factory UserAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UserAppointmentModel(
      id: json['_id'],
      canceled: json['canceled'],
      status: json['status'],
      fees: json['fees'],
      date: DateTime.parse(json['date']),
      day: json['day'],
      hour: json['hour'],
      minute: json['minute'],
      doctor: DoctorInfo.fromJson(json['doctor']),
    );
  }
}

class DoctorInfo {
  final String firstName;
  final String lastName;
  final String department;

  DoctorInfo({
    required this.firstName,
    required this.lastName,
    required this.department,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) {
    return DoctorInfo(
      firstName: json['first_name'],
      lastName: json['last_name'],
      department: json['department'],
    );
  }
}