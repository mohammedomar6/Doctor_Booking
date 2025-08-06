import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/company/data/models/company_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/token_manger.dart';
class RemoteDataSourceCompany {
  
  Future<CompanyModel>getAllCompany()async{
   final res= await   http.get(Uri.parse('${MyStrings.baseUrl}companies',), headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
   'Content-Type': 'application/json'},);
   print('company ${res.statusCode}');
   if(res.statusCode==200){
     print(res.body);
   Map<String,dynamic> mapData=  jsonDecode(res.body);
   return  CompanyModel.fromJson(mapData);
   }
   else{
     throw Exception('error data');
   }
  }
  
}