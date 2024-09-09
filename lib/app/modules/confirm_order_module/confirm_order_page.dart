import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/confirm_order_module/confirm_order_controller.dart';
/**
 * 
 * */

class ConfirmOrderPage extends GetView<ConfirmOrderController> {
  final ConfirmOrderController confirmOrderController =
      Get.find<ConfirmOrderController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: confirmOrderController,
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
                    text: "Confirm order",
                    size: 14.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  centerTitle: true,
                ),
                backgroundColor: appBgColor,
                body: Padding(
                    padding: EdgeInsets.only(
                        left: 4.w, right: 4.w, top: 2.h, bottom: 1.h),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                          child: TextWidget(
                            text:
                                "We will call you shortly to place your order. Our customer support executive will help you choose a trusted lab.",
                            size: 12.sp,
                            bold: FontWeight.w600,
                            color: greyColor,
                            alignment: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: TextWidget(
                            text: "Enter 10 digit phone number",
                            size: 12.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          controller: TextEditingController(),
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 12.sp,
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              hintText: "00 0000 0000",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyColor)),
                              hintStyle: TextStyle(
                                color: textFieldBorder,
                                fontSize: 11.sp,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: greyColor))),
                        ),
                        SizedBox(
                          height: 52.h,
                        ),
                        SubmitButtonHelper(
                            text: "Submit",
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    insetPadding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.h),
                                    ),
                                    content: Image(
                                      image: AssetImage(
                                          "assets/images/confirmOrder.png"),
                                      height: 40.h,
                                    ),
                                  );
                                },
                              ).then((value) {
                                // Use Get.back() outside of the showDialog callback

                                Get.back(closeOverlays: true);
                                Get.back();
                                confirmOrderController.update();
                              });
                              confirmOrderController.update();
                            })
                      ],
                    ))),
          );
        });
  }
}
