import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';
import 'package:doctor_booking1/features/home/data/models/doctor_models.dart';
import 'package:http/http.dart' as http;

class HomeData {
  Future<List<DoctorModel>> getAllDoctors() async {
    final url = Uri.parse('${MyStrings.baseUrl}doctors');
    print('Fetching doctors from: $url');
    print(TokenManager1.getToken());
    final response = await http.get(
      url,
      headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},
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

  Future<List<DepartmentModel>> getAllDepartmentsHome() async {
    final url = Uri.parse('${MyStrings.baseUrl}departments');
    print('Fetching departments from: $url');
    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final data = json.decode(response.body);
      final List<dynamic> departmentsJson = data['doc'];
      return departmentsJson
          .map((json) => DepartmentModel.fromJson(json))
          .toList();
    } else {
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load departments');
    }
  }
}