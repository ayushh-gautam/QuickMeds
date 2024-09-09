import 'package:quickmeds_user/app/modules/product_detail_screen_module/product_detail_screen_controller.dart';
import 'package:get/get.dart';

import '../wishlist_screen_module/wishlist_screen_controller.dart';

class ProductDetailScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistScreenController>(() => WishlistScreenController());
    Get.lazyPut(() => ProductDetailScreenController());
  }
}
