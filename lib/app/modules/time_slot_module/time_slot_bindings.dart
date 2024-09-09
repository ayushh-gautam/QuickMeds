import 'package:quickmeds_user/app/modules/time_slot_module/time_slot_controller.dart';
import 'package:get/get.dart';

class TimeSlotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeSlotController());
  }
}
