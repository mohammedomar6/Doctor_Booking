class AvailableDateModel {
  final DateTime date;
  final String day;
  final int hour;
  final int minute;

  AvailableDateModel({
    required this.date,
    required this.day,
    required this.hour,
    required this.minute,
  });

  factory AvailableDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableDateModel(
      date: DateTime.parse(json['date']).toLocal(),
      day: json['day'],
      hour: json['hour'],
      minute: json['minute'],
    );
  }

  String get formattedTime {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  DateTime get dateOnly {
    return DateTime(date.year, date.month, date.day);
  }
}
