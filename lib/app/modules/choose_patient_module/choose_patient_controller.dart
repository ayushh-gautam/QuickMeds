import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_all_patient_model.dart';
import 'package:quickmeds_user/api_collection/repo/patient_repo.dart';

import '../../../api_collection/api_models/add_patient_model.dart';

class ChoosePatientController extends GetxController {
  List<bool> checkedItems(int count) =>
      List<bool>.generate(count, (index) => false);

  final patientNameController = TextEditingController();
  final dobController = TextEditingController();
  var selectedGender = ''.obs;
  var isLoading = false.obs;
  var iseditPatientTapped = false.obs;
  final editPatientKey = GlobalKey<FormState>();

  Rx<GetPatient>? getPatient = GetPatient().obs;

  GetPatient myPatientModel = GetPatient();

/////------------------------GetList of Patient-----------------------------///
  Future<GetPatient> getPatientList() async {
    getPatient?.value = GetPatient();
    PatientRepo patientRepo = PatientRepo();
    try {
      isLoading.value = true;
      myPatientModel = await patientRepo.getPatient();
      print("I Am Printer---------> $myPatientModel");
      isLoading.value = false;
      getPatient?.value = myPatientModel;
      update();
      return myPatientModel;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load tests, please try again :(',
          snackPosition: SnackPosition.BOTTOM);
    }
    throw Exception('try another year');
  }

  ///-------------------------Update Patient Detail---------------------------///
  Future<void> updatePatient(int patientId) async {
    PatientRepo patientRepo = PatientRepo();
    try {
      AddPatientModel newPatient = AddPatientModel(
          userId: 001,
          image: '',
          patientName: patientNameController.text,
          dob: dobController.text,
          gender: selectedGender.value);

      if (!editPatientKey.currentState!.validate()) return;

      await patientRepo.updatePatient(patientId, newPatient);
      getPatientList();
      update();
    } catch (e) {
      Get.snackbar('Exception', 'Error occurred, try again later',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  ///------------------------Delete the Patient-------------------------------///

  Future<void> deletePatient(int patientId) async {
    PatientRepo patientRepo = PatientRepo();

    await patientRepo.deletePatient(patientId);
    getPatientList();
    update();
  }

  @override
  void onClose() {
    patientNameController.clear();
    dobController.clear();
    super.onClose();
  }
}
