import 'package:quickmeds_user/app/modules/faq_screen_module/faq_screen_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class FaqScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqScreenController());
  }
}
