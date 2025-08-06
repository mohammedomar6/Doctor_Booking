// To parse this JSON data, do
//
//     final walletAddMoneyModelResponse = walletAddMoneyModelResponseFromJson(jsonString);

import 'dart:convert';

WalletAddMoneyModelResponse walletAddMoneyModelResponseFromJson(String str) => WalletAddMoneyModelResponse.fromJson(json.decode(str));

String walletAddMoneyModelResponseToJson(WalletAddMoneyModelResponse data) => json.encode(data.toJson());

class WalletAddMoneyModelResponse {
  String status;
  Doc2 doc2;

  WalletAddMoneyModelResponse({
    required this.status,
    required this.doc2,
  });

  factory WalletAddMoneyModelResponse.fromJson(Map<String, dynamic> json) => WalletAddMoneyModelResponse(
    status: json["status"],
    doc2: Doc2.fromJson(json["doc2"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "doc2": doc2.toJson(),
  };
}

class Doc2 {
  String id;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;

  Doc2({
    required this.id,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc2.fromJson(Map<String, dynamic> json) => Doc2(
    id: json["_id"],
    balance: json["balance"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "balance": balance,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
