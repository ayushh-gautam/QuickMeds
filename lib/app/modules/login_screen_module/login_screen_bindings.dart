import 'package:quickmeds_user/app/modules/login_screen_module/login_screen_controller.dart';
import 'package:get/get.dart';


class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
