import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:quickmeds_user/app/modules/verification_screen_module/verification_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/repo/http_api_method.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class VerificationScreenPage extends GetView<VerificationScreenController> {
  final VerificationScreenController verificationScreenController =
      Get.find<VerificationScreenController>();

  VerificationScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: verificationScreenController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/authBg.png"))),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    Image(
                      image: const AssetImage(
                        "assets/images/verification.png",
                      ),
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: TextWidget(
                                text: "Verification code",
                                size: 22.sp,
                                bold: FontWeight.bold,
                                color: primaryGreenColor),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                  text:
                                      "Verification Code Sent to ${verificationScreenController.phoneNo}",
                                  size: 11.sp,
                                  bold: FontWeight.w600,
                                  color: greyColor),
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/images/edit.svg",
                                    height: 2.h,
                                  ))
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 2.h, left: 2.w, right: 2.w),
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(4.w),
                              boxShadow: [
                                BoxShadow(
                                    color: greyColor.withOpacity(0.40),
                                    blurRadius: 4.w,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0.1.w)
                              ],
                            ),
                            child: Center(
                              child: OTPTextField(
                                length: 6,
                                width: MediaQuery.of(context).size.width,
                                isDense: false,
                                fieldWidth: 7.w,
                                otpFieldStyle: OtpFieldStyle(
                                  enabledBorderColor: greyColor,
                                  errorBorderColor: greyColor,
                                  focusBorderColor: greyColor,
                                  borderColor: greyColor,
                                ),
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                                contentPadding: EdgeInsets.only(top: 2.h),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onChanged: (value) {
                                  verificationScreenController.otpNumber =
                                      value;
                                  log("numberon ::::${verificationScreenController.otpNumber}");

                                  verificationScreenController.update();
                                },
                                onCompleted: (pin) {
                                  verificationScreenController.otpNumber = pin;
                                  log("number ::::${verificationScreenController.otpNumber}");
                                  verificationScreenController.update();
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextWidget(
                                text:
                                    "00.${verificationScreenController.remainingSeconds.toString().padLeft(2, "0")}",
                                size: 11.sp,
                                bold: FontWeight.w600,
                                alignment: TextAlign.end,
                                color: greyColor),
                          ),
                          SizedBox(height: 3.h),
                          SubmitButtonHelper(
                              text: "Submit",
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (verificationScreenController
                                        .otpNumber.isEmpty ==
                                    true) {
                                  AppHttpClient.get().toast(
                                      message:
                                          "Please enter your verification code",
                                      isError: true);
                                  return;
                                } else {
                                  Get.toNamed(Routes.TAB_SCREEN);
                                  verificationScreenController.update();
                                }
                              }),
                          SizedBox(height: 3.h),
                          GestureDetector(
                            onTap: () {
                              if (verificationScreenController
                                      .remainingSeconds ==
                                  0) {
                                verificationScreenController.remainingSeconds =
                                    30;
                                verificationScreenController.update();
                                verificationScreenController.startTimer();
                              }
                            },
                            child: Center(
                              child: TextWidget(
                                  text: "Resend OTP",
                                  size: 12.sp,
                                  bold: FontWeight.w600,
                                  alignment: TextAlign.end,
                                  color: verificationScreenController
                                              .remainingSeconds ==
                                          0
                                      ? primaryGreenColor
                                      : greyColor),
                            ),
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
