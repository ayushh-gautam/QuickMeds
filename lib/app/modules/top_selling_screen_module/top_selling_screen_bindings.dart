import 'package:quickmeds_user/app/modules/top_selling_screen_module/top_selling_screen_controller.dart';
import 'package:get/get.dart';

import '../wishlist_screen_module/wishlist_screen_controller.dart';

class TopSellingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistScreenController>(() => WishlistScreenController());
    Get.lazyPut(() => TopSellingScreenController());
  }
}
