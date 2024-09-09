import 'package:quickmeds_user/app/modules/tab_screen_module/tab_screen_controller.dart';
import 'package:get/get.dart';

class TabScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabScreenController());
  }
}
