import 'package:quickmeds_user/app/modules/z.%20my_app_module/my_app_controller.dart';
import 'package:get/get.dart';

class MyAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAppController());
  }
}
