import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_address_details_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_address_details_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class AddressRepo {
  // !-----------------Send Address-----------------
  Future<SuccessMessageWithIdModel> sendAddress(
      Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}/address.add'),
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
    throw Exception('Failed to add address!');
  }

  // !-----------------Get Address-----------------
  Future<GetAddressDetailsModel> getAddress() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/address.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getAddressDetailsModelFromJson(response.body);
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
    throw Exception('Failed to get address!');
  }

  // !-----------------Get Address By Id-----------------
  Future<GetAddressDetailsByIdModel> getAddressById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/address.get/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getAddressDetailsByIdModelFromJson(response.body);
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
    throw Exception('Failed to get address by Id!');
  }

  // !-----------------Update Address-----------------
  Future<SuccessMessageModel> updateAddress(
      {required String id, required dynamic body}) async {
    try {
      final response = await http.put(
        Uri.parse('${MyApi.baseUrl}/address.update'),
        headers: MyApi.postHeaders,
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return successMessageModelFromJson(response.body);
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
    throw Exception('Failed to update address!');
  }

  // !-----------------Delete Address-----------------
  Future<SuccessMessageModel> deleteAddress(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${MyApi.baseUrl}/address.delete/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return successMessageModelFromJson(response.body);
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
    throw Exception('Failed to delete address!');
  }
}
