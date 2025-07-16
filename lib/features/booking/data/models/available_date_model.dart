class AvailableDateModel {
  final DateTime date;
  final String day;
  final int hour;
  final int minute;
  final String? id;
  final bool? canceled;
  final String? status;
  final int? fees;
  final String? patientId;
  final String? doctorId;

  AvailableDateModel({
    required this.date,
    required this.day,
    required this.hour,
    required this.minute,
    this.id,
    this.canceled,
    this.status,
    this.fees,
    this.patientId,
    this.doctorId,
  });

  factory AvailableDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableDateModel(
      id: json['_id'],
      canceled: json['canceled'],
      status: json['status'],
      fees: json['fees'],
      date: DateTime.parse(json['date']),
      day: json['day'],
      hour: json['hour'],
      minute: json['minute'],
      patientId: json['pataint'],
      doctorId: json['doctor'],
    );
  }

  DateTime get dateOnly => DateTime(date.year, date.month, date.day);

  String get formattedTime {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}