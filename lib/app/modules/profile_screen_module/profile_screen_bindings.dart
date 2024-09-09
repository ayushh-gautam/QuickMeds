import 'package:quickmeds_user/app/modules/profile_screen_module/profile_screen_controller.dart';
import 'package:get/get.dart';

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}
