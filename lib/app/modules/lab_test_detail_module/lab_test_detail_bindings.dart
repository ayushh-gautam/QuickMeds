import 'package:quickmeds_user/app/modules/lab_test_detail_module/lab_test_detail_controller.dart';
import 'package:get/get.dart';



class LabTestDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LabTestDetailController());
  }
}
