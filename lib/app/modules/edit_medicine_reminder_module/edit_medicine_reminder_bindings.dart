import 'package:get/get.dart';

import 'edit_medicine_reminder_controller.dart';

class EditMedicineReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditMedicineReminderController());
  }
}
