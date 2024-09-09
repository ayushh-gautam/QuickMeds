import 'package:quickmeds_user/app/modules/add_medicine_reminder_module/add_medicine_reminder_controller.dart';
import 'package:get/get.dart';

class AddMedicineReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMedicineReminderController());
  }
}
