// To parse this JSON data, do
//
//     final getLabTestByIdModel = getLabTestByIdModelFromJson(jsonString);

import 'dart:convert';

GetLabTestByIdModel getLabTestByIdModelFromJson(String str) =>
    GetLabTestByIdModel.fromJson(json.decode(str));

String getLabTestByIdModelToJson(GetLabTestByIdModel data) =>
    json.encode(data.toJson());

class GetLabTestByIdModel {
  bool? status;
  LabTest? labTest;

  GetLabTestByIdModel({
    this.status,
    this.labTest,
  });

  factory GetLabTestByIdModel.fromJson(Map<String, dynamic> json) =>
      GetLabTestByIdModel(
        status: json["status"] ?? false,
        labTest:
            json["labTest"] == null ? null : LabTest.fromJson(json["labTest"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "labTest": labTest?.toJson(),
      };
}

class LabTest {
  int? id;
  String? bannerImage;
  String? coverImage;
  String? testName;
  String? description;
  double? mrp;
  double? sellingPrice;
  String? preparations;
  String? sampleRequired;
  String? recommendedFor;
  dynamic others;
  dynamic faq;

  LabTest({
    this.id,
    this.bannerImage,
    this.coverImage,
    this.testName,
    this.description,
    this.mrp,
    this.sellingPrice,
    this.preparations,
    this.sampleRequired,
    this.recommendedFor,
    this.others,
    this.faq,
  });

  factory LabTest.fromJson(Map<String, dynamic> json) => LabTest(
        id: json["id"] ?? 0,
        bannerImage: json["bannerImage"] ?? "",
        coverImage: json["coverImage"] ?? "",
        testName: json["testName"] ?? "",
        description: json["description"] ?? "",
        mrp: json["mrp"].toDouble() ?? 0.0,
        sellingPrice: json["sellingPrice"].toDouble() ?? 0.0,
        preparations: json["preparations"] ?? "",
        sampleRequired: json["sampleRequired"] ?? "",
        recommendedFor: json["recommendedFor"] ?? "",
        others: json["others"],
        faq: json["faq"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bannerImage": bannerImage,
        "coverImage": coverImage,
        "testName": testName,
        "description": description,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "preparations": preparations,
        "sampleRequired": sampleRequired,
        "recommendedFor": recommendedFor,
         "others": others,
        "faq": faq,
      };
}

class Faq {
  String? answer;
  String? question;

  Faq({
    this.answer,
    this.question,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        answer: json["answer"] ?? "",
        question: json["question"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "question": question,
      };
}

class Other {
  String? body;
  String? heading;

  Other({
    this.body,
    this.heading,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        body: json["body"] ?? "",
        heading: json["heading"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "heading": heading,
      };
}
