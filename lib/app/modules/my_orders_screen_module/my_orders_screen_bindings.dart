import 'package:quickmeds_user/app/modules/my_orders_screen_module/my_orders_screen_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class MyOrdersScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersScreenController());
  }
}
