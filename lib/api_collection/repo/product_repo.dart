import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_deal_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_my_stock_requests_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_product_health_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_products_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_products_model_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
// !-----------------Get Products-----------------
  Future<GetProductsModel> getproducts() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/product.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getProductsModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get products!');
  }

// !-----------------Get Products By ID-----------------
  Future<GetProductsByIdModel> getProductsById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/product.get/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getProductsByIdModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get products!');
  }

// !-----------------Get Medicine-----------------
  Future<GetMedicineModel> getMedicine() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/product.medicine'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getMedicineModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get medicine!');
  }

// !-----------------Get Products Health-----------------
  Future<GetProductHealthModel> getProductsHealth() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/product.health'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getProductHealthModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get products Health!');
  }

// !------------------Post Stock Request-----------------
  Future<SuccessMessageWithIdModel> postStockRequest(
      Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}/stockRequest.add'),
        headers: MyApi.postHeaders,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return successMessageWithIdModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to post stock request!');
  }

// !-----------------Get My Stock Request-----------------
  Future<GetMyStockRequestModel> getStockRequest() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/stockRequest.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getMyStockRequestModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get stock request!');
  }

  // !-----------------Get Top Selling List---------------------
  Future<GetDealByIdModel> getTopSellingProductList(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/combo/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getDealByIdModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar(
            "Error",
            successMessageModel.message ??
                'Error", "An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API ko  Error: ${e.toString()}");
    }
    throw Exception('Failed to get Top Selling Items!');
  }
}
