import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';

import '../../../../core/token_manger.dart';
import '../models/wallet_response.dart';
import 'package:http/http.dart' as http;
class RemoteDataSourceWallet {

   Future<WalletResponse> getWallet() async{
     Uri uri = Uri.parse('${MyStrings.baseUrl}wallets/mine');
      final res =  await http.get(uri,    headers: { 'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'},);
      if(res.statusCode==200){
        Map<String,dynamic> mapData= jsonDecode(res.body);
        return WalletResponse.fromJson(mapData);
      }
      else {
        throw Exception('data base error');
      }
   }

}