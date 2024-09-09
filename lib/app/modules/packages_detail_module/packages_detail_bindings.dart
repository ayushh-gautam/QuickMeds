import 'package:quickmeds_user/app/modules/packages_detail_module/packages_detail_controller.dart';
import 'package:get/get.dart';

class PackagesDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackagesDetailController());
  }
}
