import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/modules/onboard_screen_module/onboard_screen_controller.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';

class OnboardScreenPage extends GetView<OnboardScreenController> {
  final OnboardScreenController onboardScreenController =
      Get.find<OnboardScreenController>();

  OnboardScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: onboardScreenController,
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: nextButton(),
          body: PageView(
            controller: onboardScreenController.pageController,
            onPageChanged: onboardScreenController.onChangedFunction,
            children: <Widget>[
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(4.w, 8.h, 4.w, 2.h),
                      child: Image.asset("assets/images/onboard_one.png")),
                  Center(
                      child: TextWidget(
                    text: "Your go-to health app",
                    size: 16.sp,
                    bold: FontWeight.w700,
                    color: greyColor,
                    alignment: TextAlign.center,
                  )),
                  SizedBox(height: 2.h),
                  Center(
                    child: TextWidget(
                        text: "Your complete healthcare companion",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                  Center(
                    child: TextWidget(
                        text: "in your pocket",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                ],
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(4.w, 8.h, 4.w, 2.h),
                      child: Image.asset("assets/images/onboard_two.png")),
                  Center(
                      child: TextWidget(
                    text: "Home delivery of medicines",
                    size: 16.sp,
                    bold: FontWeight.w700,
                    color: greyColor,
                    alignment: TextAlign.center,
                  )),
                  SizedBox(height: 2.h),
                  Center(
                    child: TextWidget(
                        text: "order any medicine of health product at",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                  Center(
                    child: TextWidget(
                        text: "discounted prices and get them",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                  Center(
                    child: TextWidget(
                        text: "deleived at your doorstep",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                ],
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(4.w, 8.h, 4.w, 2.h),
                      child: Image.asset("assets/images/onboard_three.png")),
                  Center(
                      child: TextWidget(
                    text: "Lab tests at home",
                    size: 16.sp,
                    bold: FontWeight.w700,
                    color: greyColor,
                    alignment: TextAlign.center,
                  )),
                  SizedBox(height: 2.h),
                  Center(
                    child: TextWidget(
                        text: "Book any test from any lab. we'll collect",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                  Center(
                    child: TextWidget(
                        text: "the sample and send the reports. Save up",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                  Center(
                    child: TextWidget(
                        text: "to 80% every time ",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget nextButton() {
    return Container(
      height: 24.h,
      padding: EdgeInsets.only(bottom: 4.h),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 13.w,
            height: 6.h,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.6.w),
                  child: CircleAvatar(
                    radius: 0.8.w,
                    backgroundColor:
                        index == onboardScreenController.currentIndex
                            ? orangeColor
                            : dotColor,
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            child: SubmitButtonHelper(
              text: "Get started",
              onTap: () async {
                Get.offNamed(Routes.LOGIN_SCREEN);
                onboardScreenController.nextFunction();
              },
            ),
          )
        ],
      ),
    );
  }
}
