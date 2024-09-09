// To parse this JSON data, do
//
//     final getProductsByIdModel = getProductsByIdModelFromJson(jsonString);

import 'dart:convert';

GetProductsByIdModel getProductsByIdModelFromJson(String str) =>
    GetProductsByIdModel.fromJson(json.decode(str));

String getProductsByIdModelToJson(GetProductsByIdModel data) =>
    json.encode(data.toJson());

class GetProductsByIdModel {
  bool? status;
  Product? product;

  GetProductsByIdModel({
    this.status,
    this.product,
  });

  factory GetProductsByIdModel.fromJson(Map<String, dynamic> json) =>
      GetProductsByIdModel(
        status: json["status"] ?? false,
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "product": product?.toJson(),
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
  List<dynamic>? substituteProducts;
  double? averageRating;
  List<Review>? reviews;

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
    this.substituteProducts,
    this.averageRating,
    this.reviews,
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
        substituteProducts: json["substituteProducts"] == null
            ? []
            : List<dynamic>.from(json["substituteProducts"]!.map((x) => x)),
        averageRating: json["averageRating"].toDouble() ?? 0.0,
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
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
        "substituteProducts": substituteProducts == null
            ? []
            : List<dynamic>.from(substituteProducts!.map((x) => x)),
        "averageRating": averageRating,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
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

class Review {
  int? id;
  int? productId;
  int? userId;
  double? rating;
  String? ipAddress;
  String? title;
  String? review;
  String? userName;
  String? email;
  bool? recommendOthers;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({
    this.id,
    this.productId,
    this.userId,
    this.rating,
    this.ipAddress,
    this.title,
    this.review,
    this.userName,
    this.email,
    this.recommendOthers,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] ?? 0,
        productId: json["productId"] ?? 0,
        userId: json["userId"] ?? 0,
        rating: json["rating"].toDouble() ?? 0.0,
        ipAddress: json["ipAddress"] ?? "",
        title: json["title"] ?? "",
        review: json["review"] ?? "",
        userName: json["userName"] ?? "",
        email: json["email"] ?? "",
        recommendOthers: json["recommendOthers"] ?? false,
        isVerified: json["isVerified"] ?? false,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "userId": userId,
        "rating": rating,
        "ipAddress": ipAddress,
        "title": title,
        "review": review,
        "userName": userName,
        "email": email,
        "recommendOthers": recommendOthers,
        "isVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
