import 'package:quickmeds_user/app/modules/order_placed_screen_module/order_placed_screen_controller.dart';
import 'package:get/get.dart';

class OrderPlacedScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderPlacedScreenController());
  }
}
