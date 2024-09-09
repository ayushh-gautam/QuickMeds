
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_medicine_reminder_model.dart';
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';

import '../../../api_collection/repo/medicine_reminder_repo.dart';

class AllRemindersController extends GetxController {
  RxBool isPostLoading = false.obs;
  RxBool isGetLoading = false.obs;
  RxBool isDeleteSuccess = false.obs;

  GetMedicineReminderModel getMedicineReminderModel =
      GetMedicineReminderModel();

  @override
  void onInit() {
    getMedicineReminder();
    super.onInit();
  }

  // !--------------------- Get Medicine Reminder ---------------------
  Future<GetMedicineReminderModel> getMedicineReminder() async {
    MedicineReminderRepo medicineReminderRepo = MedicineReminderRepo();
    try {
      isGetLoading.value = true;
      getMedicineReminderModel =
          await medicineReminderRepo.getMedicineReminder();
      return getMedicineReminderModel;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isGetLoading.value = false;
    }
    throw Exception('Failed to get Medicine Reminder data!');
  }



  // !--------------------- Delete Medicine Reminder ---------------------
  Future<void> deleteMedicineReminder(String id) async {
    MedicineReminderRepo medicineReminderRepo = MedicineReminderRepo();
    try {
      isPostLoading.value = true;
      SuccessMessageModel successMessageModel =
          await medicineReminderRepo.deleteMedicineReminder(id);
      isDeleteSuccess.value = true;
      Get.snackbar(
        "Success",
        successMessageModel.message ?? "Medicine Reminder deleted successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete Medicine Reminder. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isPostLoading.value = false;
    }
  }
}
