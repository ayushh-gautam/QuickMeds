import 'package:quickmeds_user/app/modules/verification_screen_module/verification_screen_controller.dart';
import 'package:get/get.dart';

class VerificationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationScreenController());
  }
}
