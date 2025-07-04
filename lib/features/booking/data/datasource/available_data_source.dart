import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/booking/data/models/available_date_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/token_manger.dart';

class AvailableBookingData {
  Future<List<AvailableDateModel>> getAvailableDates(String doctorId) async {
    final url =
        Uri.parse('${MyStrings.baseUrl}dates/doctor/$doctorId/available');
    final response = await http.get(url, headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List list = data['freeDate'];
      return list.map((e) => AvailableDateModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load available dates');
    }
  }

  Future<void> bookDate({
    required String doctorId,
    required DateTime date,
  }) async {
    final url = Uri.parse('${MyStrings.baseUrl}dates');
    final response = await http.post(url,
        headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
          'Content-Type': 'application/json'},
        body: json.encode({
          'doctor': doctorId,
          'date': date.toIso8601String(),
          'day': _getDayFromDate(date),
          'hour': date.hour,
          'minute': date.minute,
        }));

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to book appointment');
    }
  }

  String _getDayFromDate(DateTime date) {
    const days = [
      'sunday',
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday'
    ];
    return days[date.weekday % 7];
  }
}
