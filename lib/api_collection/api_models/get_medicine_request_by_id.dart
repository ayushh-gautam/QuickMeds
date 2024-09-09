// To parse this JSON data, do
//
//     final getMedicineRequestByIdModel = getMedicineRequestByIdModelFromJson(jsonString);

import 'dart:convert';

GetMedicineRequestByIdModel getMedicineRequestByIdModelFromJson(String str) =>
    GetMedicineRequestByIdModel.fromJson(json.decode(str));

String getMedicineRequestByIdModelToJson(GetMedicineRequestByIdModel data) =>
    json.encode(data.toJson());

class GetMedicineRequestByIdModel {
  bool? status;
  MedicineRequest? medicineRequest;

  GetMedicineRequestByIdModel({
    this.status,
    this.medicineRequest,
  });

  factory GetMedicineRequestByIdModel.fromJson(Map<String, dynamic> json) =>
      GetMedicineRequestByIdModel(
        status: json["status"] ?? false,
        medicineRequest: json["medicineRequest"] == null
            ? null
            : MedicineRequest.fromJson(json["medicineRequest"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "medicineRequest": medicineRequest?.toJson(),
      };
}

class MedicineRequest {
  int? id;
  int? userId;
  String? prescription;
  String? medicineName;
  String? companyName;
  int? qty;
  String? status;
  dynamic externalId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MedicineRequest({
    this.id,
    this.userId,
    this.prescription,
    this.medicineName,
    this.companyName,
    this.qty,
    this.status,
    this.externalId,
    this.createdAt,
    this.updatedAt,
  });

  factory MedicineRequest.fromJson(Map<String, dynamic> json) =>
      MedicineRequest(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        prescription: json["prescription"] ?? "",
        medicineName: json["medicineName"] ?? "",
        companyName: json["companyName"] ?? "",
        qty: json["qty"] ?? 0,
        status: json["status"] ?? "",
        externalId: json["externalId"] ?? "",
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "prescription": prescription,
        "medicineName": medicineName,
        "companyName": companyName,
        "qty": qty,
        "status": status,
        "externalId": externalId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
