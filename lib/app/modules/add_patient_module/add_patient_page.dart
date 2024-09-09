import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:quickmeds_user/app/helper_widgets/hex_color.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import 'package:quickmeds_user/app/modules/add_patient_module/add_patient_controller.dart';

import '../../theme/app_colors.dart';

class AddPatientPage extends GetView<AddPatientController> {
  final AddPatientController addPatientController =
      Get.put<AddPatientController>(AddPatientController());

  AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: addPatientController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                backgroundColor: appBgColor,
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
                    text: "Add new patient",
                    size: 14.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  centerTitle: true,
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  child: SubmitButtonHelper(
                    onTap: () {
                      Get.toNamed(Routes.BOOKING_SUCCESS);
                    },
                    text: "Continue",
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
                  child: ListView(
                    children: [
                      TextWidget(
                        text: "Patient’s name*",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 1.4.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Enter  patient’s name",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller: TextEditingController(),
                          borderColor: HexColor("#90A4AE"),
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
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Date of birth*",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 1.4.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Enter  date of birth",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller: TextEditingController(),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: SvgPicture.asset(
                                "assets/images/calendar-outline.svg"),
                          ),
                          borderColor: HexColor("#90A4AE"),
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
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Gender*",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 1.4.h,
                      ),
                      SizedBox(
                        height: 6.h,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 0.2.h),
                                margin: EdgeInsets.only(right: 4.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.2.h),
                                  border: Border.all(color: greyColor),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    text: index == 0
                                        ? "Male"
                                        : index == 1
                                            ? "Female"
                                            : "Other",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
