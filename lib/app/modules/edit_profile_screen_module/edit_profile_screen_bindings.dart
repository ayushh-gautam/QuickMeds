import 'package:quickmeds_user/app/modules/edit_profile_screen_module/edit_profile_screen_controller.dart';
import 'package:get/get.dart';

class EditProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileScreenController());
  }
}
