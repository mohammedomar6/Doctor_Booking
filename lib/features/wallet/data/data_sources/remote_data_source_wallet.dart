import 'dart:convert';

import 'package:doctor_booking1/constant/my_strings.dart';

import '../../../../core/token_manger.dart';
import '../models/wallet_response.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceWallet {
  Future<WalletResponse> getWallet() async {
    Uri uri = Uri.parse('${MyStrings.baseUrl}wallets/mine');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = jsonDecode(response.body);
      return WalletResponse.fromJson(mapData);
    } else {
      throw Exception('data base error');
    }
  }
  Future<Doc> withdrawFromWallet(int amount) async {
    final uri = Uri.parse('${MyStrings.baseUrl}wallets/withdrawal');
    final response = await http.patch(
      uri,
      headers: {
        'Authorization': 'Bearer ${await TokenManager1.getToken()}',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({'balance': amount}),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final doc = Doc.fromJson(jsonBody['doc2']);
      return doc;
    } else {
      throw Exception('Wallet withdrawal failed');
    }
  }


}
