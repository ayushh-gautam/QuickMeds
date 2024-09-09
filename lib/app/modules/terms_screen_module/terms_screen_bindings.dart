import 'package:quickmeds_user/app/modules/terms_screen_module/terms_screen_controller.dart';
import 'package:get/get.dart';

class TermsScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsScreenController());
  }
}
