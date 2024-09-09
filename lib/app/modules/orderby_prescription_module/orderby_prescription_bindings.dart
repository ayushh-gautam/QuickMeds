import 'package:quickmeds_user/app/modules/orderby_prescription_module/orderby_prescription_controller.dart';
import 'package:get/get.dart';

class OrderbyPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderbyPrescriptionController());
  }
}
