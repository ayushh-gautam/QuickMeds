import 'package:quickmeds_user/app/modules/add_address_module/add_address_controller.dart';
import 'package:get/get.dart';


class AddAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
  }
}
