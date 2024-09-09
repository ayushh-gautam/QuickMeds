import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/return_policy_screen_module/return_policy_screen_controller.dart';

class ReturnPolicyScreenPage extends GetView<ReturnPolicyScreenController> {
  final ReturnPolicyScreenController returnPolicyScreenController =
      Get.find<ReturnPolicyScreenController>();

  ReturnPolicyScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: returnPolicyScreenController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: appBgColor,
              leadingWidth: 20.w,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 0.4.h, bottom: 0.4.h),
                  width: 8.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: orangeColor,
                    size: 2.4.h,
                  ),
                ),
              ),
              title: TextWidget(
                text: "Return and refund policy",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: ListView(
                  children: [
                    Image(
                      image: const AssetImage("assets/images/return.png"),
                      height: 34.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextWidget(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      size: 12.8.sp,
                      bold: FontWeight.w500,
                      color: greyColor,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
