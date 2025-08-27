import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/features/pataint/data/models/patiant_requast.dart';
import 'package:doctor_booking1/features/pataint/data/models/profile_response.dart';

import '../../../../core/token_manger.dart';
import '../models/pataint_response.dart';
import 'package:http/http.dart' as http;
class PataintRemoteDataSource {
  Future<PataintResponse> createPataint( PataintRequast request )  async{
     Uri url=  Uri.parse('${MyStrings.baseUrl}pataints');
        final res= await  http.post(url,body: jsonEncode(request.toJson()), headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
          'Content-Type': 'application/json'});
        print(res.statusCode);
        print(res.body);
        if(res.statusCode==200){

           final data =jsonDecode(res.body);
           PataintResponse pataintResponse= PataintResponse.fromJson(data);
           return  pataintResponse;
        }
        else {
          throw Exception('error for data base');
        }
   }
    Future<PataintResponse> UpdatePataint(PataintRequast request) async {
      Uri url=  Uri.parse('${MyStrings.baseUrl}pataints/updateMe');
      final res= await  http.patch(url,body: jsonEncode(request.toJson()),  headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json'},);
      print(res.body);print(res.statusCode);
      if(res.statusCode==200){
        final data =jsonDecode(res.body);
        PataintResponse pataintResponse= PataintResponse.fromJson(data);
        return  pataintResponse;
      }
      else {
        throw Exception('error for data base');
      }
    }
       Future<ProfileResponse> getProfile() async{
         print ('ss ${await TokenManager1.getToken()}');
        Uri url=  Uri.parse('${MyStrings.baseUrl}pataints/me');
        final res= await  http.get(url,  headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},);
        print(res.body);
        print(res.statusCode);
        if(res.statusCode==200){
          final data =jsonDecode(res.body);
          ProfileResponse  profileResponse = ProfileResponse.fromJson(data);
          return  profileResponse;
        }
        else {
          throw Exception('error for data base');
        }
      }


 }