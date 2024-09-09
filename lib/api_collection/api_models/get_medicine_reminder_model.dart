// To parse this JSON data, do
//
//     final getMedicineReminderModel = getMedicineReminderModelFromJson(jsonString);

import 'dart:convert';

GetMedicineReminderModel getMedicineReminderModelFromJson(String str) =>
    GetMedicineReminderModel.fromJson(json.decode(str));

String getMedicineReminderModelToJson(GetMedicineReminderModel data) =>
    json.encode(data.toJson());

class GetMedicineReminderModel {
  bool? status;
  List<MedicineReminder>? medicineReminders;

  GetMedicineReminderModel({
    this.status,
    this.medicineReminders,
  });

  factory GetMedicineReminderModel.fromJson(Map<String, dynamic> json) =>
      GetMedicineReminderModel(
        status: json["status"] ?? "false",
        medicineReminders: json["medicineReminders"] == null
            ? []
            : List<MedicineReminder>.from(json["medicineReminders"]!
                .map((x) => MedicineReminder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "medicineReminders": medicineReminders == null
            ? []
            : List<dynamic>.from(medicineReminders!.map((x) => x.toJson())),
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
