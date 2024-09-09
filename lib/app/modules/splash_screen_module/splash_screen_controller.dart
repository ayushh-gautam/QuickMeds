import 'dart:async';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    Timer(const Duration(seconds: 1), () {
      Get.offAllNamed(Routes.ONBOARD_SCREEN);
    });

    super.onInit();
  }
}
