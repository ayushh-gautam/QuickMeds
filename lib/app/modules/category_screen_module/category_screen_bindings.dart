import 'package:quickmeds_user/app/modules/category_screen_module/category_screen_controller.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/wishlist_screen_module/wishlist_screen_controller.dart';


class CategoryScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistScreenController>(() => WishlistScreenController());
    Get.lazyPut(() => CategoryScreenController());
  }
}
