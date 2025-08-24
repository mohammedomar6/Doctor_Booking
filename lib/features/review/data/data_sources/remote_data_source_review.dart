import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../constant/my_strings.dart';
import '../../../../core/token_manger.dart';
import '../models/review_request_model.dart';
import '../models/review_response_model.dart';
class RemoteDataSourceReview {
  Future<ReviewReponseModel> addReview( ReviewRequestModel request )  async{
    Uri url=  Uri.parse('${MyStrings.baseUrl}reviews');
    final res= await  http.post(url,body: jsonEncode(request.toJson()), headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
      'Content-Type': 'application/json'});
    print(res.statusCode);
    print(res.body);
    if(res.statusCode==201){

      final data =jsonDecode(res.body);
      ReviewReponseModel reviewResponse= ReviewReponseModel.fromJson(data);
      return  reviewResponse;
    }
    else {
      throw Exception(res.body);
    }
  }
}