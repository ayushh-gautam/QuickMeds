import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/ask_question_screen_module/ask_question_screen_controller.dart';

class AskQuestionScreenPage extends GetView<AskQuestionScreenController> {
  final AskQuestionScreenController askQuestionScreenController =
      Get.find<AskQuestionScreenController>();

  AskQuestionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: askQuestionScreenController,
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
                text: "Ask question",
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
                    Center(
                      child: TextWidget(
                        text:
                            "please write your question in the given box and send it to us, our team will answer you as soon as possible.",
                        size: 12.8.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                        alignment: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Write your question here",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        borderColor: greyColor,
                        fillColor: appBgColor,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller:
                            askQuestionScreenController.questionController,
                        contentPadding: EdgeInsets.only(
                            top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                        hintTextStyle: TextStyle(
                          color: textFieldBorder,
                          fontSize: 11.sp,
                        ),
                        style: TextStyle(color: blackColor, fontSize: 12.sp),
                        borderRadius: 4.h,
                        cursorColor: HexColor("#BBBBBB"),
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.done),
                    SizedBox(
                      height: 58.h,
                    ),
                    Obx(() {
                      if (askQuestionScreenController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: primaryGreenColor,
                          ),
                        );
                      } else {
                        return SubmitButtonHelper(
                            text: "Submit",
                            onTap: () {
                              Map<String, dynamic> body = {
                                "question": askQuestionScreenController
                                    .questionController.text,
                              };
                              askQuestionScreenController
                                  .addAskQuestion(body)
                                  .whenComplete(() {
                                if (askQuestionScreenController
                                    .questionAddedSuccess.value) {
                                  askQuestionScreenController.questionController
                                      .clear();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                        ),
                                        content: Image(
                                          image: const AssetImage(
                                              "assets/images/askQuestionPopUp.png"),
                                          height: 40.h,
                                        ),
                                      );
                                    },
                                  ).then((value) {
                                    // Use Get.back() outside of the showDialog callback
                                    Get.back(closeOverlays: true);
                                    askQuestionScreenController.update();
                                  });
                                }
                              });
                              askQuestionScreenController.update();
                            });
                      }
                    }),
                  ],
                )),
          ),
        );
      },
    );
  }
}
