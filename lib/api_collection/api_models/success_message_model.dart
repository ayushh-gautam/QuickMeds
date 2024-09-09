// To parse this JSON data, do
//
//     final successMessageModel = successMessageModelFromJson(jsonString);

import 'dart:convert';

SuccessMessageModel successMessageModelFromJson(String str) =>
    SuccessMessageModel.fromJson(json.decode(str));

String successMessageModelToJson(SuccessMessageModel data) =>
    json.encode(data.toJson());

class SuccessMessageModel {
  bool? status;
  String? message;

  SuccessMessageModel({
    this.status,
    this.message,
  });

  factory SuccessMessageModel.fromJson(Map<String, dynamic> json) =>
      SuccessMessageModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
