// To parse this JSON data, do
//
//     final getWishListDetailsModel = getWishListDetailsModelFromJson(jsonString);

import 'dart:convert';

GetWishListDetailsModel getWishListDetailsModelFromJson(String str) =>
    GetWishListDetailsModel.fromJson(json.decode(str));

String getWishListDetailsModelToJson(GetWishListDetailsModel data) =>
    json.encode(data.toJson());

class GetWishListDetailsModel {
  bool? status;
  List<Wishlist>? wishlist;

  GetWishListDetailsModel({
    this.status,
    this.wishlist,
  });

  factory GetWishListDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetWishListDetailsModel(
        status: json["status"] ?? false,
        wishlist: json["wishlist"] == null
            ? []
            : List<Wishlist>.from(
                json["wishlist"]!.map((x) => Wishlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "wishlist": wishlist == null
            ? []
            : List<dynamic>.from(wishlist!.map((x) => x.toJson())),
      };
}

class Wishlist {
  int? id;
  String? productName;
  double? mrp;
  double? sellingPrice;
  String? brand;
  String? productForm;
  String? uses;
  String? age;
  int? categoryId;
  String? category;
  String? manufacturer;
  String? consumeType;
  DateTime? expireDate;
  String? packagingDetails;
  List<String>? images;
  List<Variant>? variants;
  String? composition;
  String? productIntroduction;
  String? usesOfMedication;
  String? benefits;
  String? contradictions;
  bool? isPrescriptionRequired;
  ExpertAdvice? expertAdvice;
  int? totalSales;

  Wishlist({
    this.id,
    this.productName,
    this.mrp,
    this.sellingPrice,
    this.brand,
    this.productForm,
    this.uses,
    this.age,
    this.categoryId,
    this.category,
    this.manufacturer,
    this.consumeType,
    this.expireDate,
    this.packagingDetails,
    this.images,
    this.variants,
    this.composition,
    this.productIntroduction,
    this.usesOfMedication,
    this.benefits,
    this.contradictions,
    this.isPrescriptionRequired,
    this.expertAdvice,
    this.totalSales,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"] ?? 0,
        productName: json["productName"] ?? "",
        mrp: json["mrp"].toDouble() ?? 0.0, 
        sellingPrice: json["sellingPrice"].toDouble() ?? 0.0,
        brand: json["brand"] ?? "",
        productForm: json["productForm"] ?? "",
        uses: json["uses"] ?? "",
        age: json["age"] ?? "",
        categoryId: json["categoryId"] ?? 0,
        category: json["category"] ?? "",
        manufacturer: json["manufacturer"] ?? "",
        consumeType: json["consumeType"] ?? "",
        expireDate: json["expireDate"] == null
            ? null
            : DateTime.parse(json["expireDate"]),
        packagingDetails: json["packagingDetails"] ?? "",
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        composition: json["composition"] ?? "",
        productIntroduction: json["productIntroduction"] ?? "",
        usesOfMedication: json["usesOfMedication"] ?? "",
        benefits: json["benefits"] ?? "",
        contradictions: json["contradictions"] ?? "",
        isPrescriptionRequired: json["isPrescriptionRequired"] ?? false,
        expertAdvice: json["expertAdvice"] == null
            ? null
            : ExpertAdvice.fromJson(json["expertAdvice"]),
        totalSales: json["totalSales"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "mrp": mrp,
        "sellingPrice": sellingPrice,
        "brand": brand,
        "productForm": productForm,
        "uses": uses,
        "age": age,
        "categoryId": categoryId,
        "category": category,
        "manufacturer": manufacturer,
        "consumeType": consumeType,
        "expireDate":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "packagingDetails": packagingDetails,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "composition": composition,
        "productIntroduction": productIntroduction,
        "usesOfMedication": usesOfMedication,
        "benefits": benefits,
        "contradictions": contradictions,
        "isPrescriptionRequired": isPrescriptionRequired,
        "expertAdvice": expertAdvice?.toJson(),
        "totalSales": totalSales,
      };
}

class ExpertAdvice {
  String? advice;
  String? avatar;
  String? doctorName;
  String? designation;

  ExpertAdvice({
    this.advice,
    this.avatar,
    this.doctorName,
    this.designation,
  });

  factory ExpertAdvice.fromJson(Map<String, dynamic> json) => ExpertAdvice(
        advice: json["advice"] ?? "",
        avatar: json["avatar"] ?? "",
        doctorName: json["doctorName"] ?? "",
        designation: json["designation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "advice": advice,
        "avatar": avatar,
        "doctorName": doctorName,
        "designation": designation,
      };
}

class Variant {
  double? mrp;
  String? stock;
  String? units;
  double? sellingPrice;

  Variant({
    this.mrp,
    this.stock,
    this.units,
    this.sellingPrice,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        mrp: json["mrp"].toDouble() ?? 0.0,
        stock: json["stock"] ?? "",
        units: json["units"] ?? "",
        sellingPrice: json["sellingPrice"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "mrp": mrp,
        "stock": stock,
        "units": units,
        "sellingPrice": sellingPrice,
      };
}
