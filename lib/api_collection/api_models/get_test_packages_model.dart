// To parse this JSON data, do
//
//     final getTestPackagesModel = getTestPackagesModelFromJson(jsonString);

import 'dart:convert';

GetTestPackagesModel getTestPackagesModelFromJson(String str) =>
    GetTestPackagesModel.fromJson(json.decode(str));

String getTestPackagesModelToJson(GetTestPackagesModel data) =>
    json.encode(data.toJson());

class GetTestPackagesModel {
  bool? status;
  List<TestPackage>? testPackages;

  GetTestPackagesModel({
    this.status,
    this.testPackages,
  });

  factory GetTestPackagesModel.fromJson(Map<String, dynamic> json) =>
      GetTestPackagesModel(
        status: json["status"] ?? false,
        testPackages: json["testPackages"] == null
            ? []
            : List<TestPackage>.from(
                json["testPackages"]!.map((x) => TestPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "testPackages": testPackages == null
            ? []
            : List<dynamic>.from(testPackages!.map((x) => x.toJson())),
      };
}

class TestPackage {
  int? id;
  String? name;
  String? image;
  List<Test>? tests;
  DateTime? createdAt;
  DateTime? updatedAt;

  TestPackage({
    this.id,
    this.name,
    this.image,
    this.tests,
    this.createdAt,
    this.updatedAt,
  });

  factory TestPackage.fromJson(Map<String, dynamic> json) => TestPackage(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        tests: json["tests"] == null
            ? []
            : List<Test>.from(json["tests"]!.map((x) => Test.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "tests": tests == null
            ? []
            : List<dynamic>.from(tests!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Test {
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
  List<Other>? others;
  List<dynamic>? containsMultipleTest;
  List<Faq>? faq;
  DateTime? createdAt;
  DateTime? updatedAt;

  Test({
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
    this.containsMultipleTest,
    this.faq,
    this.createdAt,
    this.updatedAt,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
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
        others: json["others"] == null
            ? []
            : List<Other>.from(json["others"]!.map((x) => Other.fromJson(x))),
        containsMultipleTest: json["containsMultipleTest"] == null
            ? []
            : List<dynamic>.from(json["containsMultipleTest"]!.map((x) => x)),
        faq: json["faq"] == null
            ? []
            : List<Faq>.from(json["faq"]!.map((x) => Faq.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        "others": others == null
            ? []
            : List<dynamic>.from(others!.map((x) => x.toJson())),
        "containsMultipleTest": containsMultipleTest == null
            ? []
            : List<dynamic>.from(containsMultipleTest!.map((x) => x)),
        "faq":
            faq == null ? [] : List<dynamic>.from(faq!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
