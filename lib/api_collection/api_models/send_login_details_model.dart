// To parse this JSON data, do
//
//     final sendLoginDetailsModel = sendLoginDetailsModelFromJson(jsonString);

import 'dart:convert';

SendLoginDetailsModel sendLoginDetailsModelFromJson(String str) =>
    SendLoginDetailsModel.fromJson(json.decode(str));

String sendLoginDetailsModelToJson(SendLoginDetailsModel data) =>
    json.encode(data.toJson());

class SendLoginDetailsModel {
  bool? status;
  String? message;
  String? token;

  SendLoginDetailsModel({
    this.status,
    this.message,
    this.token,
  });

  factory SendLoginDetailsModel.fromJson(Map<String, dynamic> json) =>
      SendLoginDetailsModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
      };
}
