// To parse this JSON data, do
//
//     final addPatientModel = addPatientModelFromJson(jsonString);

import 'dart:convert';

AddPatientModel addPatientModelFromJson(String str) => AddPatientModel.fromJson(json.decode(str));

String addPatientModelToJson(AddPatientModel data) => json.encode(data.toJson());

class AddPatientModel {
    int userId;
    String image;
    String patientName;
    String dob;
    String gender;

    AddPatientModel({
        required this.userId,
        required this.image,
        required this.patientName,
        required this.dob,
        required this.gender,
    });

    factory AddPatientModel.fromJson(Map<String, dynamic> json) => AddPatientModel(
        userId: json["userId"],
        image: json["image"],
        patientName: json["patientName"],
        dob: json["dob"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "image": image,
        "patientName": patientName,
        "dob": dob,
        "gender": gender,
    };
}