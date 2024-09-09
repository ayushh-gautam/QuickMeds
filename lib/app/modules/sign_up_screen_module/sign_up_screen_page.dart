import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../helper_widgets/validators.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/sign_up_screen_module/sign_up_screen_controller.dart';

class SignUpScreenPage extends GetView<SignUpScreenController> {
  final SignUpScreenController signUpScreenController =
      Get.find<SignUpScreenController>();

  SignUpScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: signUpScreenController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Form(
                autovalidateMode: signUpScreenController.isSignUpTapped == true
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                key: signUpScreenController.signUp,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/authBg.png"))),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Image(
                        image: const AssetImage(
                          "assets/images/signup.png",
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
                                  text: "Sign up",
                                  size: 22.sp,
                                  bold: FontWeight.bold,
                                  color: primaryGreenColor),
                            ),
                            SizedBox(height: 2.h),
                            Center(
                              child: TextWidget(
                                  text: "Join the Quick Meds today ",
                                  size: 14.sp,
                                  bold: FontWeight.normal,
                                  color: greyColor),
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: greyColor.withOpacity(0.40),
                                      blurRadius: 4.w,
                                      offset: const Offset(0, 2),
                                      spreadRadius: 0.1.w)
                                ],
                              ),
                              child: TextFieldWidget(
                                  labelTextFontWeight: FontWeight.w600,
                                  hintText: "Name",
                                  fillColor: bgColor,
                                  textAlign: TextAlign.start,
                                  textInputFormatter: const [],
                                  validatorText: (e) =>
                                      Validators().validateFirstName(e),
                                  controller:
                                      signUpScreenController.nameController,
                                  contentPadding: EdgeInsets.only(
                                      top: 2.h, bottom: 2.h, left: 4.w),
                                  hintTextStyle: TextStyle(
                                      color: greyColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                  style: TextStyle(
                                      color: blackColor, fontSize: 12.sp),
                                  borderRadius: 4.h,
                                  cursorColor: HexColor("#BBBBBB"),
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.next),
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: greyColor.withOpacity(0.40),
                                      blurRadius: 4.w,
                                      offset: const Offset(0, 2),
                                      spreadRadius: 0.1.w)
                                ],
                              ),
                              child: TextFieldWidget(
                                  labelTextFontWeight: FontWeight.w600,
                                  hintText: "Mobile number",
                                  fillColor: bgColor,
                                  textAlign: TextAlign.start,
                                  textInputFormatter: const [],
                                  validatorText: (e) =>
                                      Validators().validatePhone(e),
                                  controller:
                                      signUpScreenController.phoneController,
                                  contentPadding: EdgeInsets.only(
                                      top: 2.h, bottom: 2.h, left: 4.w),
                                  hintTextStyle: TextStyle(
                                      color: greyColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600),
                                  style: TextStyle(
                                      color: blackColor, fontSize: 12.sp),
                                  borderRadius: 4.h,
                                  cursorColor: HexColor("#BBBBBB"),
                                  textInputType: TextInputType.phone,
                                  textInputAction: TextInputAction.done),
                            ),
                            SizedBox(height: 3.h),
                            Obx(() {
                              if (signUpScreenController.isLoading.isTrue) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: primaryGreenColor,
                                  ),
                                );
                              } else {
                                return SubmitButtonHelper(
                                  text: "Sign up",
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    signUpScreenController.isSignUpTapped(
                                        true); // Use reactive update
                                    signUpScreenController.signUpUsers();
                                  },
                                );
                              }
                            }),
                            SizedBox(height: 3.h),
                            Center(
                              child: TextWidget(
                                  text: "Or",
                                  size: 12.sp,
                                  bold: FontWeight.normal,
                                  color: greyColor),
                            ),
                            SizedBox(height: 3.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 4.w),
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
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 2.6.h,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: SvgPicture.asset(
                                          "assets/images/google.svg"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  TextWidget(
                                      text: "Use Google Account",
                                      size: 12.sp,
                                      bold: FontWeight.w700,
                                      color: greyColor),
                                ],
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: TextWidget(
                                        text: "Already have an account? ",
                                        size: 12.sp,
                                        bold: FontWeight.normal,
                                        color: greyColor),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: TextWidget(
                                        text: "Login",
                                        size: 12.sp,
                                        bold: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        color: primaryGreenColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
