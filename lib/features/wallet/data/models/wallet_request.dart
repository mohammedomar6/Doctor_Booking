// To parse this JSON data, do
//
//     final walletRequest = walletRequestFromJson(jsonString);

import 'dart:convert';

WalletRequest walletRequestFromJson(String str) => WalletRequest.fromJson(json.decode(str));

String walletRequestToJson(WalletRequest data) => json.encode(data.toJson());

class WalletRequest {
  int balance;

  WalletRequest({
    required this.balance,
  });

  factory WalletRequest.fromJson(Map<String, dynamic> json) => WalletRequest(
    balance: json["balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
  };
}
