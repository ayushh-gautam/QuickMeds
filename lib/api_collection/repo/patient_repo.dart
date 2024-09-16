import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickmeds_user/api_collection/api_models/get_all_patient_model.dart';
import '../api_models/add_patient_model.dart';
import '../api_models/success_message_model.dart';
import '../config/api_config.dart';

class PatientRepo {
  //---------------------------Add Patient------------------------------------//

  Future<void> addPatient(AddPatientModel newPatient) async {
    try {
      var response = await http.post(
        Uri.parse('${MyApi.baseUrl}/patient.add'),
        headers: MyApi.postHeaders,
        body: jsonEncode(newPatient.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Patient added successfully');

      } else {
        Get.snackbar('Error', 'Error while adding patient: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Exception', 'Error occurred, try again later');
    }
  }

//----------------Get Patient Detail------------------------//

  Future<GetPatient> getPatient() async {
    try {
      final response = await http.get(
        Uri.parse('${MyApi.baseUrl}/patient.getAll'),
        headers: MyApi.getHeaders,
      );

      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return getPatientFromJson(response.body);
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

//---------------------------Update Patient------------------------------------//
  Future<void> updatePatient(
      int patientId, AddPatientModel updatedPatient) async {
    try {
      final response = await http.put(
        Uri.parse('${MyApi.baseUrl}/patient.update/$patientId'),
        headers: MyApi.postHeaders,
        body: json.encode(updatedPatient.toJson()),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Detail updated successfully');
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar('Error',
            successMessageModel.message ?? 'An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API Error: ${e.toString()}");
      Get.snackbar('Exception', 'Error occurred, try again later');
    }
  }

//---------------------------------Delete Patient------------------------------//
  Future<void> deletePatient(int patientId) async {
    try {
      var response = await http.delete(
        Uri.parse('${MyApi.baseUrl}/patient.delete/$patientId'),
        headers: MyApi.postHeaders,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Patient removed successfully');
      } else {
        Get.snackbar('Error', 'Error while removing patient: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Exception', 'Error occurred, try again later');
    }
  }
}
