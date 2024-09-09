import 'package:quickmeds_user/app/modules/explore_packages_module/explore_packages_controller.dart';
import 'package:get/get.dart';

class ExplorePackagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorePackagesController());
  }
}
