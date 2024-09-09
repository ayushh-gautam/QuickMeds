import 'package:quickmeds_user/app/modules/medicine_list_module/medicine_list_controller.dart';
import 'package:get/get.dart';

import '../wishlist_screen_module/wishlist_screen_controller.dart';

class MedicineListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistScreenController>(() => WishlistScreenController());
    Get.lazyPut(() => MedicineListController());
  }
}
