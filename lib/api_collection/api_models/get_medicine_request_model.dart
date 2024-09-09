// To parse this JSON data, do
//
//     final getMedicineRequestModel = getMedicineRequestModelFromJson(jsonString);

import 'dart:convert';

GetMedicineRequestModel getMedicineRequestModelFromJson(String str) =>
    GetMedicineRequestModel.fromJson(json.decode(str));

String getMedicineRequestModelToJson(GetMedicineRequestModel data) =>
    json.encode(data.toJson());

class GetMedicineRequestModel {
  bool? status;
  List<MedicineRequest>? medicineRequests;

  GetMedicineRequestModel({
    this.status,
    this.medicineRequests,
  });

  factory GetMedicineRequestModel.fromJson(Map<String, dynamic> json) =>
      GetMedicineRequestModel(
        status: json["status"] ?? false,
        medicineRequests: json["medicineRequests"] == null
            ? []
            : List<MedicineRequest>.from(json["medicineRequests"]!
                .map((x) => MedicineRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "medicineRequests": medicineRequests == null
            ? []
            : List<dynamic>.from(medicineRequests!.map((x) => x.toJson())),
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
