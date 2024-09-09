// To parse this JSON data, do
//
//     final getMedicineModel = getMedicineModelFromJson(jsonString);

import 'dart:convert';

GetMedicineModel getMedicineModelFromJson(String str) =>
    GetMedicineModel.fromJson(json.decode(str));

String getMedicineModelToJson(GetMedicineModel data) =>
    json.encode(data.toJson());

class GetMedicineModel {
  bool? status;
  List<Medicine>? medicines;

  GetMedicineModel({
    this.status,
    this.medicines,
  });

  factory GetMedicineModel.fromJson(Map<String, dynamic> json) =>
      GetMedicineModel(
        status: json["status"] ?? false,
        medicines: json["medicines"] == null
            ? []
            : List<Medicine>.from(
                json["medicines"]!.map((x) => Medicine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "medicines": medicines == null
            ? []
            : List<dynamic>.from(medicines!.map((x) => x.toJson())),
      };
}

class Medicine {
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

  Medicine({
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

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
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
