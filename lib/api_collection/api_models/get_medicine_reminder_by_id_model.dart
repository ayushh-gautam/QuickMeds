// To parse this JSON data, do
//
//     final getMedicineReminderByIdModel = getMedicineReminderByIdModelFromJson(jsonString);

import 'dart:convert';

GetMedicineReminderByIdModel getMedicineReminderByIdModelFromJson(String str) =>
    GetMedicineReminderByIdModel.fromJson(json.decode(str));

String getMedicineReminderByIdModelToJson(GetMedicineReminderByIdModel data) =>
    json.encode(data.toJson());

class GetMedicineReminderByIdModel {
  bool? status;
  MedicineReminder? medicineReminder;

  GetMedicineReminderByIdModel({
    this.status,
    this.medicineReminder,
  });

  factory GetMedicineReminderByIdModel.fromJson(Map<String, dynamic> json) =>
      GetMedicineReminderByIdModel(
        status: json["status"] ?? false,
        medicineReminder: json["medicineReminder"] == null
            ? null
            : MedicineReminder.fromJson(json["medicineReminder"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "medicineReminder": medicineReminder?.toJson(),
      };
}

class MedicineReminder {
  int? id;
  int? userId;
  String? medicineName;
  String? category;
  String? type;
  String? value;
  DateTime? startDate;
  String? duration;
  String? days;
  String? time;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  MedicineReminder({
    this.id,
    this.userId,
    this.medicineName,
    this.category,
    this.type,
    this.value,
    this.startDate,
    this.duration,
    this.days,
    this.time,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MedicineReminder.fromJson(Map<String, dynamic> json) =>
      MedicineReminder(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        medicineName: json["medicineName"] ?? "",
        category: json["category"] ?? "",
        type: json["type"] ?? "",
        value: json["value"] ?? "",
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        duration: json["duration"] ?? "",
        days: json["days"] ?? "",
        time: json["time"] ?? "",
        status: json["status"] ?? false,
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
        "medicineName": medicineName,
        "category": category,
        "type": type,
        "value": value,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "duration": duration,
        "days": days,
        "time": time,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
