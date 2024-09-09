import 'package:quickmeds_user/app/modules/all_reminders_module/all_reminders_controller.dart';
import 'package:get/get.dart';

class AllRemindersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllRemindersController());
  }
}
