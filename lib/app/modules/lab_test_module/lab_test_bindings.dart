import 'package:quickmeds_user/app/modules/lab_test_module/lab_test_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class LabTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabTestController());
  }
}
