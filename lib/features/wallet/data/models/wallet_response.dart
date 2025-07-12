// To parse this JSON data, do
//
//     final walletResponse = walletResponseFromJson(jsonString);

import 'dart:convert';

WalletResponse walletResponseFromJson(String str) =>
    WalletResponse.fromJson(json.decode(str));

String walletResponseToJson(WalletResponse data) => json.encode(data.toJson());

class WalletResponse {
  String status;
  int results;
  List<Doc> doc;

  WalletResponse({
    required this.status,
    required this.results,
    required this.doc,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) => WalletResponse(
        status: json["status"],
        results: json["results"],
        doc: List<Doc>.from(json["doc"].map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc": List<dynamic>.from(doc.map((x) => x.toJson())),
      };
}

class Doc {
  String id;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;

  Doc({
    required this.id,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
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
