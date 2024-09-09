// To parse this JSON data, do
//
//     final getDealByIdModel = getDealByIdModelFromJson(jsonString);

import 'dart:convert';

GetDealByIdModel getDealByIdModelFromJson(String str) =>
    GetDealByIdModel.fromJson(json.decode(str));

String getDealByIdModelToJson(GetDealByIdModel data) =>
    json.encode(data.toJson());

class GetDealByIdModel {
  bool? status;
  Combo? combo;

  GetDealByIdModel({
    this.status,
    this.combo,
  });

  factory GetDealByIdModel.fromJson(Map<String, dynamic> json) =>
      GetDealByIdModel(
        status: json["status"] ?? false,
        combo: json["combo"] == null ? null : Combo.fromJson(json["combo"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "combo": combo?.toJson(),
      };
}

class Combo {
  int? id;
  String? name;
  List<Product>? products;

  Combo({
    this.id,
    this.name,
    this.products,
  });

  factory Combo.fromJson(Map<String, dynamic> json) => Combo(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
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
