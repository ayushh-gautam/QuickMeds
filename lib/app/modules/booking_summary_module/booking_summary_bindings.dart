import 'package:quickmeds_user/app/modules/booking_summary_module/booking_summary_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class BookingSummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingSummaryController());
  }
}
