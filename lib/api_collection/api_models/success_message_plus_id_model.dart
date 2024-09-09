// To parse this JSON data, do
//
//     final successMessageWithIdModel = successMessageWithIdModelFromJson(jsonString);

import 'dart:convert';

SuccessMessageWithIdModel successMessageWithIdModelFromJson(String str) =>
    SuccessMessageWithIdModel.fromJson(json.decode(str));

String successMessageWithIdModelToJson(SuccessMessageWithIdModel data) =>
    json.encode(data.toJson());

class SuccessMessageWithIdModel {
  bool? status;
  String? message;
  int? id;

  SuccessMessageWithIdModel({
    this.status,
    this.message,
    this.id,
  });

  factory SuccessMessageWithIdModel.fromJson(Map<String, dynamic> json) =>
      SuccessMessageWithIdModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
      };
}
