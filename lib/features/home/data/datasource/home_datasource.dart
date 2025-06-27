import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/home/data/models/doctor_models.dart';
import 'package:http/http.dart' as http;

class HomeData {
  Future<List<DoctorModel>> getAllDoctors() async {
    final url = Uri.parse('${MyStrings.baseUrl}doctors');
    print('Fetching doctors from: $url');
    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NWM3NWRlNmE1YmM0ZGFhMGEwZDEwZiIsImlhdCI6MTc1MDk4MTk3MCwiZXhwIjoxNzU4NzU3OTcwfQ.Lb86omR0b3Af46WCcF3nKeNKYdtLlsr16i_vEcwZ85w',
        'Content-Type': 'application/json'
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> doctorsJson = data['doc'];
      return doctorsJson.map((json) => DoctorModel.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  Future<DoctorModel> getDoctorById(String id) async {
    final url = Uri.parse('${MyStrings.baseUrl}/doctors/$id');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return DoctorModel.fromJson(data['doc']);
    } else {
      throw Exception();
    }
  }
}