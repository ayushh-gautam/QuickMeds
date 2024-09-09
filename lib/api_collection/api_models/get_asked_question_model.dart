// To parse this JSON data, do
//
//     final getAskedQuestionModel = getAskedQuestionModelFromJson(jsonString);

import 'dart:convert';

GetAskedQuestionModel getAskedQuestionModelFromJson(String str) =>
    GetAskedQuestionModel.fromJson(json.decode(str));

String getAskedQuestionModelToJson(GetAskedQuestionModel data) =>
    json.encode(data.toJson());

class GetAskedQuestionModel {
  bool? status;
  List<AskedQuestion>? askedQuestions;

  GetAskedQuestionModel({
    this.status,
    this.askedQuestions,
  });

  factory GetAskedQuestionModel.fromJson(Map<String, dynamic> json) =>
      GetAskedQuestionModel(
        status: json["status"] ?? false,
        askedQuestions: json["askedQuestions"] == null
            ? []
            : List<AskedQuestion>.from(
                json["askedQuestions"]!.map((x) => AskedQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "askedQuestions": askedQuestions == null
            ? []
            : List<dynamic>.from(askedQuestions!.map((x) => x.toJson())),
      };
}

class AskedQuestion {
  int? id;
  int? userId;
  String? question;
  String? answer;
  bool? isReplied;
  DateTime? createdAt;
  DateTime? updatedAt;

  AskedQuestion({
    this.id,
    this.userId,
    this.question,
    this.answer,
    this.isReplied,
    this.createdAt,
    this.updatedAt,
  });

  factory AskedQuestion.fromJson(Map<String, dynamic> json) => AskedQuestion(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        question: json["question"] ?? "",
        answer: json["answer"] ?? "",
        isReplied: json["isReplied"] ?? false,
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
        "question": question,
        "answer": answer,
        "isReplied": isReplied,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
