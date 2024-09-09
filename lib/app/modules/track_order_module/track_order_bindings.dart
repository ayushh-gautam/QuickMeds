import 'package:quickmeds_user/app/modules/track_order_module/track_order_controller.dart';
import 'package:get/get.dart';

class TrackOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}
