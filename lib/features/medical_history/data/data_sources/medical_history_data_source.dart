import 'dart:convert';


import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/medical_history/data/models/medical_history_response.dart';
import 'package:doctor_booking1/features/medical_history/data/models/upload_additionl_file_model.dart';
import 'package:http/http.dart' as Http;

class MedicalHistoryData {

  Future<MedicalHistoryResponse?> getMedicalHistory() async {
    final res = await Http.get(Uri.parse('${MyStrings.baseUrl}recourds/mine'),
      headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},
    );
    print(res.body);
    if (res.statusCode == 200) {
      print('succussful');
      Map<String,dynamic> mapData =jsonDecode(res.body);
      MedicalHistoryResponse medicalHistoryResponse = MedicalHistoryResponse.fromJson(mapData);

      return medicalHistoryResponse;
    }
    else{
      throw Exception('  خطأ  {response.body}');
    }
  }
  Future<MedicalHistoryResponse?> getALlAdditional(int recordId) async {
    final res = await Http.get(Uri.parse('${MyStrings.baseUrl}recourds/$recordId/additonal'),
      headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},
    );
    print(res.body);
    if (res.statusCode == 200) {
      print('succussful record additnal');
      Map<String,dynamic> mapData =jsonDecode(res.body);
      MedicalHistoryResponse medicalHistoryResponse = MedicalHistoryResponse.fromJson(mapData);

      return medicalHistoryResponse;
    }
    else{
      throw Exception('  خطأ ${res.body}');
    }
  }
  Future<void> uploadFile(int recordId , int additionlId,UploadAdditionallFIleModel request) async {
    final Uri url = Uri.parse('${MyStrings.baseUrl}recourds/$recordId/additonal/$additionlId');
  final res = await Http.patch(url,    headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json'},body: jsonEncode(request.toJson()));
  }

}