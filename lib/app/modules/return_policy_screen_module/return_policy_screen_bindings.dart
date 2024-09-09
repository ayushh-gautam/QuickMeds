import 'package:quickmeds_user/app/modules/return_policy_screen_module/return_policy_screen_controller.dart';
import 'package:get/get.dart';

class ReturnPolicyScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnPolicyScreenController());
  }
}
