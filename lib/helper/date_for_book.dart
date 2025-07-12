
import 'package:doctor_booking1/features/booking/data/models/available_date_model.dart';
import 'package:intl/intl.dart';

List<AvailableDateModel> generateMockSlots() {
  final List<AvailableDateModel> mockSlots = [];
  final now = DateTime.now();
  final baseDate = DateTime(now.year, now.month, now.day);

  for (int hour = 10; hour <= 13; hour++) {
    mockSlots.add(AvailableDateModel(
      date: baseDate,
      day: DateFormat('EEEE').format(baseDate),
      hour: hour,
      minute: 0,
    ));
    mockSlots.add(AvailableDateModel(
      date: baseDate,
      day: DateFormat('EEEE').format(baseDate),
      hour: hour,
      minute: 30,
    ));
  }
  mockSlots.add(AvailableDateModel(
    date: baseDate,
    day: DateFormat('EEEE').format(baseDate),
    hour: 14,
    minute: 0,
  ));

  return mockSlots;
}
