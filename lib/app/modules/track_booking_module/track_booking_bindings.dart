import 'package:quickmeds_user/app/modules/track_booking_module/track_booking_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class TrackBookingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackBookingController());
  }
}