import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_plus_id_model.dart';

import '../../../api_collection/repo/medicine_request_repo.dart';

class MedicineRequestScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool questionAddedSuccess = false.obs;

  TextEditingController medicineNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController prescriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  // !-----------Send Medicine Request-----------!
  Future<void> addMedicineRequest(Map<String, dynamic> body) async {
    MedicineRequestRepo medicineRequestRepo = MedicineRequestRepo();
    try {
      isLoading.value = true;
      SuccessMessageWithIdModel successMessageWithIdModel =
          await medicineRequestRepo.sendRequest(body);
      questionAddedSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageWithIdModel.message ?? 'Medicine Request added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending question: ${e.toString()}");
      Get.snackbar(
        "Error",
        "Failed to send medicine request. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    medicineNameController.dispose();
    companyNameController.dispose();
    prescriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }
}
