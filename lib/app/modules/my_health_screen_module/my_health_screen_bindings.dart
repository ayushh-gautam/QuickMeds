import 'package:quickmeds_user/app/modules/my_health_screen_module/my_health_screen_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class MyHealthScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyHealthScreenController());
  }
}
