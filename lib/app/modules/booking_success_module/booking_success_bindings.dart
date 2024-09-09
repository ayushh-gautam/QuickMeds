import 'package:quickmeds_user/app/modules/booking_success_module/booking_success_controller.dart';
import 'package:get/get.dart';
/**
 * 
 * */

class BookingSuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingSuccessController());
  }
}
