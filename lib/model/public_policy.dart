// To parse this JSON data, do
//
//     final PublicPolicy = PublicPolicyFromJson(jsonString);

import 'dart:convert';

PublicPolicy publicPolicyFromJson(String str) =>
    PublicPolicy.fromJson(json.decode(str));

String publicPolicyToJson(PublicPolicy data) => json.encode(data.toJson());

class PublicPolicy {
  PublicPolicy({
    required this.status,
    required this.message,
    this.data,
  });

  bool status;
  String message;
  String? data;

  factory PublicPolicy.fromJson(Map<String, dynamic> json) => PublicPolicy(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
