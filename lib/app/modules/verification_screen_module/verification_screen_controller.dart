import 'dart:async';

import 'package:get/get.dart';

class VerificationScreenController extends GetxController {
  String otpNumber = "";
  var phoneNo = Get.arguments;
  bool isLoading = false;
  bool isTap = false;

  Timer? timer;
  int remainingSeconds = 30;
  startTimer() {
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        remainingSeconds--;
      }
      update();
    });
  }

  @override
  void onInit() {
    print("email::::::$phoneNo");
    startTimer();
    super.onInit();
  }
}
