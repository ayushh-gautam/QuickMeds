import 'package:get/get.dart';

import 'medicine_request_screen_controller.dart';

class MedicineRequestScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineRequestScreenController());
  }
}
