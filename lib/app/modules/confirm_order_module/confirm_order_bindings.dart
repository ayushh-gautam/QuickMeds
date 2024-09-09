import 'package:quickmeds_user/app/modules/confirm_order_module/confirm_order_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class ConfirmOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmOrderController());
  }
}
