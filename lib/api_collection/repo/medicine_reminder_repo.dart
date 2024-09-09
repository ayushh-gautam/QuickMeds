import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_reminder_by_id_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_reminder_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:http/http.dart' as http;

class MedicineReminderRepo {
  // !-----------------Send Medicine Reminder-----------------
  Future<SuccessMessageWithIdModel> sendMedicineReminder(dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse('${MyApi.baseUrl}/medicineReminder.add'),
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
    throw Exception('Failed to send medicine reminder!');
  }

  // !-----------------Get Medicine Reminder-----------------
  Future<GetMedicineReminderModel> getMedicineReminder() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/medicineReminder.get'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getMedicineReminderModelFromJson(response.body);
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
    throw Exception('Failed to get medicine Reminder!');
  }

  // !-----------------Get Medicine Reminder By ID-----------------
  Future<GetMedicineReminderByIdModel> getMedicineReminderById(
      String id) async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/medicineReminder/$id'),
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
    throw Exception('Failed to get medicine Reminder!');
  }

  // !-----------------Update Medicine Reminder-----------------
  Future<SuccessMessageWithIdModel> updateMedicineReminder(
      {required String id, required dynamic body}) async {
    try {
      final response = await http.put(
        Uri.parse('${MyApi.baseUrl}/medicineReminder.update/$id'),
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
    throw Exception('Failed to update medicine reminder!');
  }

  // !-----------------Delete Medicine Reminder-----------------
  Future<SuccessMessageModel> deleteMedicineReminder(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${MyApi.baseUrl}/medicineReminder.delete/$id'),
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
    throw Exception('Failed to delete medicine Reminder!');
  }
}
