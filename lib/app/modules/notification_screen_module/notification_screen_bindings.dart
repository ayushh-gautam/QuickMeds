import 'package:quickmeds_user/app/modules/notification_screen_module/notification_screen_controller.dart';
import 'package:get/get.dart';

class NotificationScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationScreenController());
  }
}
