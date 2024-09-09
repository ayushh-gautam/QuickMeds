import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';

import 'medicine_request_screen_controller.dart';

class MedicineRequestScreenPage
    extends GetView<MedicineRequestScreenController> {
  final MedicineRequestScreenController medicineRequestScreenController =
      Get.find<MedicineRequestScreenController>();

  MedicineRequestScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: medicineRequestScreenController,
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
                text: "Request Medicine",
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
                            "Please write your requested medicine in the given box and send it to us, our team will try to add medicines as soon as possible.",
                        size: 12.8.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                        alignment: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter the medicine name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        borderColor: greyColor,
                        fillColor: appBgColor,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller: medicineRequestScreenController
                            .medicineNameController,
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
                        textInputAction: TextInputAction.next),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter the Company name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        borderColor: greyColor,
                        fillColor: appBgColor,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller: medicineRequestScreenController
                            .companyNameController,
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
                        textInputAction: TextInputAction.next),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter the prescription",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        borderColor: greyColor,
                        fillColor: appBgColor,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        maxLines: 3,
                        controller: medicineRequestScreenController
                            .prescriptionController,
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
                        textInputAction: TextInputAction.newline),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter the quantity",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: greyColor)),
                        borderColor: greyColor,
                        fillColor: appBgColor,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller:
                            medicineRequestScreenController.quantityController,
                        contentPadding: EdgeInsets.only(
                            top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                        hintTextStyle: TextStyle(
                          color: textFieldBorder,
                          fontSize: 11.sp,
                        ),
                        style: TextStyle(color: blackColor, fontSize: 12.sp),
                        borderRadius: 4.h,
                        cursorColor: HexColor("#BBBBBB"),
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() {
                      if (medicineRequestScreenController.isLoading.value) {
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
                                "userId": 1,
                                // !Add this id later on
                                "prescription": medicineRequestScreenController
                                    .prescriptionController.text,
                                "medicineName": medicineRequestScreenController
                                    .medicineNameController.text,
                                "companyName": medicineRequestScreenController
                                    .companyNameController.text,
                                "qty": medicineRequestScreenController
                                    .quantityController.text,
                              };
                              medicineRequestScreenController
                                  .addMedicineRequest(body)
                                  .whenComplete(() {
                                if (medicineRequestScreenController
                                    .questionAddedSuccess.value) {
                                  medicineRequestScreenController
                                      .medicineNameController
                                      .clear();
                                  medicineRequestScreenController
                                      .companyNameController
                                      .clear();
                                  medicineRequestScreenController
                                      .prescriptionController
                                      .clear();
                                  medicineRequestScreenController
                                      .quantityController
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
                                              "assets/images/medicineRequestPopUp.png"),
                                          height: 40.h,
                                        ),
                                      );
                                    },
                                  ).then((value) {
                                    // Use Get.back() outside of the showDialog callback
                                    Get.back(closeOverlays: true);
                                    medicineRequestScreenController.update();
                                  });
                                }
                              });
                              medicineRequestScreenController.update();
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
