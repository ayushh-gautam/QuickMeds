import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/drawer_screen_module/drawer_screen_controller.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

///
///

class DrawerScreenPage extends GetView<DrawerScreenController> {
  final DrawerScreenController drawerScreenController =
      Get.put(DrawerScreenController()); // Initialize the controller

  DrawerScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: drawerScreenController,
      builder: (logic) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: primaryGreenColor,
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 20.h,
                    color: Colors.red,
                  )
                ],
              ),
            ));
      },
    );
  }
}
