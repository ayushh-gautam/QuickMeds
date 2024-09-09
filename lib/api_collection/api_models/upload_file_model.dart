// To parse this JSON data, do
//
//     final uploadFileModel = uploadFileModelFromJson(jsonString);

import 'dart:convert';

UploadFileModel uploadFileModelFromJson(String str) =>
    UploadFileModel.fromJson(json.decode(str));

String uploadFileModelToJson(UploadFileModel data) =>
    json.encode(data.toJson());

class UploadFileModel {
  bool? status;
  String? message;
  String? fileUrl;

  UploadFileModel({
    this.status,
    this.message,
    this.fileUrl,
  });

  factory UploadFileModel.fromJson(Map<String, dynamic> json) =>
      UploadFileModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
        fileUrl: json["fileUrl"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "fileUrl": fileUrl,
      };
}
