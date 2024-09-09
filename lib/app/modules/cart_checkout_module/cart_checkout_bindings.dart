import 'package:quickmeds_user/app/modules/cart_checkout_module/cart_checkout_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class CartCheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartCheckoutController());
  }
}
