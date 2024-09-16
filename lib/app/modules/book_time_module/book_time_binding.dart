import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/book_time_module/book_time_controller.dart';

class BookTimeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookTimeController());
  }
}
