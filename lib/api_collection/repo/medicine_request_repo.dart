import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_reminder_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_request_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class MedicineRequestRepo {
  // !-----------------Send Request-----------------
  Future<SuccessMessageWithIdModel> sendRequest(
      Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}/medicineRequest'),
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
    throw Exception('Failed to add medicine request!');
  }

  // !-----------------Get Request-----------------
  Future<GetMedicineRequestModel> getRequest(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/medicineRequest/$userId/user'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getMedicineRequestModelFromJson(response.body);
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
    throw Exception('Failed to get Medicine Request!');
  }

  // !-----------------Get Request By Id-----------------
  Future<GetMedicineReminderByIdModel> getAddressById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/medicineRequest/$id'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getMedicineReminderByIdModelFromJson(response.body);
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
    throw Exception('Failed to get medicine request by id!');
  }
}
