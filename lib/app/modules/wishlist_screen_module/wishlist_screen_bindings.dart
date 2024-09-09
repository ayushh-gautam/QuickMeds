import 'package:quickmeds_user/app/modules/wishlist_screen_module/wishlist_screen_controller.dart';
import 'package:get/get.dart';

class WishlistScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistScreenController());
  }
}
