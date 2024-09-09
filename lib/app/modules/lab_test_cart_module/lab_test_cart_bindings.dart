import 'package:quickmeds_user/app/modules/lab_test_cart_module/lab_test_cart_controller.dart';
import 'package:get/get.dart';

class LabTestCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabTestCartController());
  }
}
