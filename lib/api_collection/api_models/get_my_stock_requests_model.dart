// To parse this JSON data, do
//
//     final getMyStockRequestModel = getMyStockRequestModelFromJson(jsonString);

import 'dart:convert';

GetMyStockRequestModel getMyStockRequestModelFromJson(String str) =>
    GetMyStockRequestModel.fromJson(json.decode(str));

String getMyStockRequestModelToJson(GetMyStockRequestModel data) =>
    json.encode(data.toJson());

class GetMyStockRequestModel {
  bool? status;
  List<StockRequest>? stockRequests;

  GetMyStockRequestModel({
    this.status,
    this.stockRequests,
  });

  factory GetMyStockRequestModel.fromJson(Map<String, dynamic> json) =>
      GetMyStockRequestModel(
        status: json["status"] ?? false,
        stockRequests: json["stockRequests"] == null
            ? []
            : List<StockRequest>.from(
                json["stockRequests"]!.map((x) => StockRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "stockRequests": stockRequests == null
            ? []
            : List<dynamic>.from(stockRequests!.map((x) => x.toJson())),
      };
}

class StockRequest {
  int? id;
  int? userId;
  bool? isFilled;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  StockRequest({
    this.id,
    this.userId,
    this.isFilled,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory StockRequest.fromJson(Map<String, dynamic> json) => StockRequest(
        id: json["id"] ?? 0,
        userId: json["userId"] ?? 0,
        isFilled: json["isFilled"] ?? false,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "isFilled": isFilled,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
      };
}

class Product {
  int? id;
  String? productName;
  int? mrp;
  int? sellingPrice;
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        productName: json["productName"] ?? "",
        mrp: json["mrp"] ?? 0,
        sellingPrice: json["sellingPrice"] ?? 0,
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
        productIntroduction: json["productIntroduction"] ,
        usesOfMedication: json["usesOfMedication"],
        benefits: json["benefits"],
        contradictions: json["contradictions"],
        isPrescriptionRequired: json["isPrescriptionRequired"],
        expertAdvice: json["expertAdvice"] == null
            ? null
            : ExpertAdvice.fromJson(json["expertAdvice"]),
        totalSales: json["totalSales"],
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
        advice: json["advice"],
        avatar: json["avatar"],
        doctorName: json["doctorName"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "advice": advice,
        "avatar": avatar,
        "doctorName": doctorName,
        "designation": designation,
      };
}

class Variant {
  int? mrp;
  String? stock;
  String? units;
  int? sellingPrice;

  Variant({
    this.mrp,
    this.stock,
    this.units,
    this.sellingPrice,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        mrp: json["mrp"],
        stock: json["stock"],
        units: json["units"],
        sellingPrice: json["sellingPrice"],
      );

  Map<String, dynamic> toJson() => {
        "mrp": mrp,
        "stock": stock,
        "units": units,
        "sellingPrice": sellingPrice,
      };
}
