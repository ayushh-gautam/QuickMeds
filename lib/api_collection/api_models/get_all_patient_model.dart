// To parse this JSON data, do
//
//     final getPatient = getPatientFromJson(jsonString);

import 'dart:convert';

GetPatient getPatientFromJson(String str) => GetPatient.fromJson(json.decode(str));

String getPatientToJson(GetPatient data) => json.encode(data.toJson());

class GetPatient {
    bool? status;
    List<Patient>? patient;

    GetPatient({
         this.status,
        this.patient,
    });

    factory GetPatient.fromJson(Map<String, dynamic> json) => GetPatient(
        status: json["status"],
        patient: List<Patient>.from(json["patient"].map((x) => Patient.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "patient": List<dynamic>.from(patient!.map((x) => x.toJson())),
    };
}

class Patient {
    int id;
    int userId;
    String image;
    String patientName;
    DateTime dob;
    String gender;
    bool isDefault;
    DateTime createdAt;
    DateTime updatedAt;

    Patient({
        required this.id,
        required this.userId,
        required this.image,
        required this.patientName,
        required this.dob,
        required this.gender,
        required this.isDefault,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        userId: json["userId"],
        image: json["image"],
        patientName: json["patientName"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        isDefault: json["isDefault"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "image": image,
        "patientName": patientName,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "isDefault": isDefault,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
