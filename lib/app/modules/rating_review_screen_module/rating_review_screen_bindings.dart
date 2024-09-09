import 'package:quickmeds_user/app/modules/rating_review_screen_module/rating_review_screen_controller.dart';
import 'package:get/get.dart';

class RatingReviewScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RatingReviewScreenController());
  }
}
