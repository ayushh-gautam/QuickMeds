import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/add_patient_model.dart';
import 'package:quickmeds_user/api_collection/repo/patient_repo.dart';

class AddPatientController extends GetxController {
  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  final patientNameController = TextEditingController();
  final dobController = TextEditingController();
  var selectedGender = 'Male'.obs;
  var isAddPatientTapped = false.obs;
  final addPatientKey = GlobalKey<FormState>();

  Future<void> addPatient() async {
    PatientRepo patientRepo = PatientRepo();
    try {
      AddPatientModel newPatient = AddPatientModel(
          userId: 001,
          image: '',
          patientName: patientNameController.text,
          dob: dobController.text,
          gender: selectedGender.value);

      if (!addPatientKey.currentState!.validate()) return;

      await patientRepo.addPatient(newPatient);
    } catch (e) {
      Get.snackbar('Exception', 'Error occurred, try again later',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    patientNameController.dispose();
    dobController.dispose();
    super.onClose();
  }
}
