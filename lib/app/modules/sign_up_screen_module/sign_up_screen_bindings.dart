import 'package:quickmeds_user/app/modules/sign_up_screen_module/sign_up_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpScreenController());
  }
}
