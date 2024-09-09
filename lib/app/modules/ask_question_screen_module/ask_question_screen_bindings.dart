import 'package:quickmeds_user/app/modules/ask_question_screen_module/ask_question_screen_controller.dart';
import 'package:get/get.dart';

class AskQuestionScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AskQuestionScreenController());
  }
}
