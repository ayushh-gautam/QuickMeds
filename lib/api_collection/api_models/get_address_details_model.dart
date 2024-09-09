// To parse this JSON data, do
//
//     final getAddressDetailsModel = getAddressDetailsModelFromJson(jsonString);

import 'dart:convert';

GetAddressDetailsModel getAddressDetailsModelFromJson(String str) =>
    GetAddressDetailsModel.fromJson(json.decode(str));

String getAddressDetailsModelToJson(GetAddressDetailsModel data) =>
    json.encode(data.toJson());

class GetAddressDetailsModel {
  bool? status;
  List<Address>? addresses;

  GetAddressDetailsModel({
    this.status,
    this.addresses,
  });

  factory GetAddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetAddressDetailsModel(
        status: json["status"] ?? false,
        addresses: json["addresses"] == null
            ? []
            : List<Address>.from(
                json["addresses"]!.map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "addresses": addresses == null
            ? []
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
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
