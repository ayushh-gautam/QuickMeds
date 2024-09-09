// To parse this JSON data, do
//
//     final getBannersModel = getBannersModelFromJson(jsonString);

import 'dart:convert';

GetBannersModel getBannersModelFromJson(String str) =>
    GetBannersModel.fromJson(json.decode(str));

String getBannersModelToJson(GetBannersModel data) =>
    json.encode(data.toJson());

class GetBannersModel {
  bool? status;
  List<Banner>? banners;

  GetBannersModel({
    this.status,
    this.banners,
  });

  factory GetBannersModel.fromJson(Map<String, dynamic> json) =>
      GetBannersModel(
        status: json["status"] ?? false,
        banners: json["banners"] == null
            ? []
            : List<Banner>.from(
                json["banners"]!.map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
      };
}

class Banner {
  int? id;
  String? image;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;

  Banner({
    this.id,
    this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        link: json["link"] ?? "",
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
