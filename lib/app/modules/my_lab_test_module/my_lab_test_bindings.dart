import 'package:quickmeds_user/app/modules/my_lab_test_module/my_lab_test_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class MyLabTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLabTestController());
  }
}
