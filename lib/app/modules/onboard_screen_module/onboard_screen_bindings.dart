import 'package:quickmeds_user/app/modules/onboard_screen_module/onboard_screen_controller.dart';
import 'package:get/get.dart';

class OnboardScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardScreenController());
  }
}
