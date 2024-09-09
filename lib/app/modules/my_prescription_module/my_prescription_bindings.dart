import 'package:quickmeds_user/app/modules/my_prescription_module/my_prescription_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class MyPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPrescriptionController());
  }
}
