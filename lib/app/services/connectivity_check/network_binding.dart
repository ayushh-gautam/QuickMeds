import 'package:get/get.dart';
import 'package:quickmeds_user/app/services/connectivity_check/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
