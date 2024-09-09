import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/splash_screen_module/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  final splashScreenController = Get.find<SplashScreenController>();

  SplashScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: splashScreenController,
      builder: (logic) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image.asset("assets/images/splash_screen.png")));
      },
    );
  }
}
