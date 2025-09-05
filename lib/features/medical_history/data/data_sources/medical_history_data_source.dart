import 'dart:convert';


import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/medical_history/data/models/additional_response_model.dart';
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
  Future<AdditionallResponseModel> getALlAdditional(String recordId) async {
    final res = await Http.get(Uri.parse('${MyStrings.baseUrl}recourds/$recordId/additonal'),
      headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},
    );
    print(res.body);
    if (res.statusCode == 200) {
      print('succussful record additnal');
      Map<String,dynamic> mapData =jsonDecode(res.body);
      AdditionallResponseModel medicalHistoryResponse = AdditionallResponseModel.fromJson(mapData);

      return medicalHistoryResponse;
    }
    else{
      throw Exception('  خطأ ${res.body}');
    }
  }
  Future<String> uploadFile(String recordId , String additionlId,UploadAdditionallFIleModel request) async {
    final Uri url = Uri.parse('${MyStrings.baseUrl}recourds/$recordId/additonal/$additionlId');
  final res = await Http.patch(url,    headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json'},body: jsonEncode(request.toJson()));

    if(res.statusCode==200){
       return 'تمت العملية بنجاح ';
    }
    else {
      throw Exception('فشلت العملية ');
    }
  }

}