import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';
import 'package:http/http.dart' as http;

class DepartmentsData {
  Future<List<DepartmentModel>> getAllDepartmentsBooking() async {
    final url = Uri.parse('${MyStrings.baseUrl}departments');
    print('Fetching departments from book: $url');
    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NWM3NWRlNmE1YmM0ZGFhMGEwZDEwZiIsImlhdCI6MTc1MDk4MTk3MCwiZXhwIjoxNzU4NzU3OTcwfQ.Lb86omR0b3Af46WCcF3nKeNKYdtLlsr16i_vEcwZ85w',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('Response body book : ${response.body}');
      final data = json.decode(response.body);
      final List<dynamic> departmentsJson = data['doc'];
      return departmentsJson
          .map((json) => DepartmentModel.fromJson(json))
          .toList();
    } else {
      print('Response status code book: ${response.statusCode}');
      print('Response body booooooooook: ${response.body}');
      throw Exception('Failed to load departments book');
    }
  }
}
