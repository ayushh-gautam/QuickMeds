import 'package:quickmeds_user/app/modules/wallet_screen_module/wallet_screen_controller.dart';
import 'package:get/get.dart';

class WalletScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletScreenController());
  }
}
