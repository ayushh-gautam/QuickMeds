// To parse this JSON data, do
//
//     final getAddressDetailsByIdModel = getAddressDetailsByIdModelFromJson(jsonString);

import 'dart:convert';

GetAddressDetailsByIdModel getAddressDetailsByIdModelFromJson(String str) =>
    GetAddressDetailsByIdModel.fromJson(json.decode(str));

String getAddressDetailsByIdModelToJson(GetAddressDetailsByIdModel data) =>
    json.encode(data.toJson());

class GetAddressDetailsByIdModel {
  bool? status;
  Address? address;

  GetAddressDetailsByIdModel({
    this.status,
    this.address,
  });

  factory GetAddressDetailsByIdModel.fromJson(Map<String, dynamic> json) =>
      GetAddressDetailsByIdModel(
        status: json["status"] ?? false,
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "address": address?.toJson(),
      };
}

class Address {
  int? id;
  String? name;
  String? type;
  String? street;
  String? city;
  String? state;
  String? country;
  String? phone;
  String? zip;

  Address({
    this.id,
    this.name,
    this.type,
    this.street,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        type: json["type"] ?? "",
        street: json["street"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        phone: json["phone"] ?? "",
        zip: json["zip"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "phone": phone,
        "zip": zip,
      };
}
