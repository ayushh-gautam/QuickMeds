// To parse this JSON data, do

//     final getLabTestsModel = getLabTestsModelFromJson(jsonString);

import 'dart:convert';

GetLabTestsModel getLabTestsModelFromJson(String str) => GetLabTestsModel.fromJson(json.decode(str));

String getLabTestsModelToJson(GetLabTestsModel data) => json.encode(data.toJson());

class GetLabTestsModel {
    bool? status;
    List<LabTest>? labTests;

    GetLabTestsModel({
         this.status,
         this.labTests,
    });

    factory GetLabTestsModel.fromJson(Map<String, dynamic> json) => GetLabTestsModel(
        status: json["status"],
        labTests: List<LabTest>.from(json["labTests"].map((x) => LabTest.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "labTests": List<dynamic>.from(labTests!.map((x) => x.toJson())),
    };
}

class LabTest {
    int id;
    String bannerImage;
    String coverImage;
    String testName;
    String description;
    double mrp;
    double sellingPrice;
    String preparations;
    String sampleRequired;
    String recommendedFor;
    dynamic others;
    dynamic faq;

    LabTest({
        required this.id,
        required this.bannerImage,
        required this.coverImage,
        required this.testName,
        required this.description,
        required this.mrp,
        required this.sellingPrice,
        required this.preparations,
        required this.sampleRequired,
        required this.recommendedFor,
        required this.others,
        required this.faq,
    });

    factory LabTest.fromJson(Map<String, dynamic> json) => LabTest(
        id: json["id"],
        bannerImage: json["bannerImage"],
        coverImage: json["coverImage"],
        testName: json["testName"],
        description: json["description"],
        mrp: json["mrp"]?.toDouble(),
        sellingPrice: json["sellingPrice"]?.toDouble(),
        preparations: json["preparations"],
        sampleRequired: json["sampleRequired"],
        recommendedFor: json["recommendedFor"],
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

class FaqElement {
    String? ans;
    String question;
    String? answer;

    FaqElement({
        this.ans,
        required this.question,
        this.answer,
    });

    factory FaqElement.fromJson(Map<String, dynamic> json) => FaqElement(
        ans: json["ans"],
        question: json["question"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "ans": ans,
        "question": question,
        "answer": answer,
    };
}

class Other {
    String body;
    String heading;

    Other({
        required this.body,
        required this.heading,
    });

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        body: json["body"],
        heading: json["heading"],
    );

    Map<String, dynamic> toJson() => {
        "body": body,
        "heading": heading,
    };
}