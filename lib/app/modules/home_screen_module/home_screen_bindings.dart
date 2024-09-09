import 'package:quickmeds_user/app/modules/home_screen_module/home_screen_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
