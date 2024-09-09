import 'package:quickmeds_user/app/modules/privacy_policy_screen_module/privacy_policy_screen_controller.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyScreenController());
  }
}
