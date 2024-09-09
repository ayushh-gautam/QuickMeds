import 'package:quickmeds_user/app/modules/search_screen_module/search_screen_controller.dart';
import 'package:get/get.dart';

class SearchScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenController());
  }
}
