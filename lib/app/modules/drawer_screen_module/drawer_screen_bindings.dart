import 'package:quickmeds_user/app/modules/drawer_screen_module/drawer_screen_controller.dart';
import 'package:get/get.dart';

///
///

class DrawerScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerScreenController());
  }
}
