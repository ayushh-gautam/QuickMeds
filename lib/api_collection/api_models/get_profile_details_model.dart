// To parse this JSON data, do
//
//     final getProfileDetailsModel = getProfileDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProfileDetailsModel getProfileDetailsModelFromJson(String str) =>
    GetProfileDetailsModel.fromJson(json.decode(str));

String getProfileDetailsModelToJson(GetProfileDetailsModel data) =>
    json.encode(data.toJson());

class GetProfileDetailsModel {
  bool? status;
  User? user;

  GetProfileDetailsModel({
    this.status,
    this.user,
  });

  factory GetProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetProfileDetailsModel(
        status: json["status"] ?? false,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? name;
  String? avatar;
  String? countryCode;
  String? phone;
  String? email;
  dynamic purchasedItems;

  User({
    this.id,
    this.name,
    this.avatar,
    this.countryCode,
    this.phone,
    this.email,
    this.purchasedItems,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        avatar: json["avatar"] ?? "",
        countryCode: json["countryCode"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        purchasedItems: json["purchasedItems"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "countryCode": countryCode,
        "phone": phone,
        "email": email,
        "purchasedItems": purchasedItems,
      };
}
