import 'package:quickmeds_user/app/modules/cart_screen_module/cart_screen_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class CartScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartScreenController());
  }
}
