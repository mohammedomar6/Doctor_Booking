import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:http/http.dart' as http ;

import '../../../../core/token_manger.dart';
import '../models/doctor_tabel_response.dart';
class RemoteDataSourceDoctorTabel {
  
  Future<DoctorTabelReponse> getDoctorTabels() async{
    Uri url = Uri.parse('${MyStrings.baseUrl}doctors/dates');
    print(url);
     final response = await http.get(url,   headers: {
     'Authorization': 'Bearer ${await TokenManager1.getToken()}',
     'Content-Type': 'application/json'
     });
     print(response.body);
      if(response.statusCode==200){
        Map<String ,dynamic> mapData= jsonDecode(response.body);
        return DoctorTabelReponse.fromJson(mapData);
      }
      else{
        throw  Exception(response.body);
      }
  }
}