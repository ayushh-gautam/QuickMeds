import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_collection/api_models/success_message_plus_id_model.dart';
import '../../../api_collection/repo/address_repo.dart';

class AddAddressController extends GetxController {
  int selectedCategory = -1;
  bool isSelected = false;
  RxBool isLoading = false.obs;
  RxBool addressAddedSuccess = false.obs;
  int isDefault = -1;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  // !-----------------Send Address-----------------
  Future<void> addAddress(Map<String, dynamic> body) async {
    AddressRepo addressRepo = AddressRepo();
    try {
      isLoading.value = true;
      SuccessMessageWithIdModel successMessageModel =
          await addressRepo.sendAddress(body);
      addressAddedSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? 'Address added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log("Error sending address: ${e.toString()}");
      Get.snackbar(
        "Error",
        'An unexpected error occurred.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

    setDefault(int value) {
    isDefault = value;
    update();
  }


   @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    zipCodeController.dispose();
    stateController.dispose();
    cityController.dispose();
    fullAddressController.dispose();
    countryController.dispose();
    super.dispose();
  }
}
