import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:quickmeds_user/app/modules/choose_patient_module/choose_patient_controller.dart';

import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class ChoosePatientPage extends GetView<ChoosePatientController> {
  final ChoosePatientController choosePatientController =
      Get.put<ChoosePatientController>(ChoosePatientController());

  ChoosePatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: choosePatientController,
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
                    text: "Choose patient",
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
                      Get.toNamed(Routes.CHOOSE_PATIENT);
                    },
                    text: "Continue",
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
                  child: ListView(
                    children: [
                      ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 4.h,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset(
                                          "assets/images/person-outline.svg"),
                                    ),
                                    const SizedBox(
                                        width:
                                            16), // Add space between CircleAvatar and Column
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: "Thor",
                                          size: 13.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600,
                                        ),
                                        TextWidget(
                                          text: "Male,23",
                                          size: 13.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: "Edit",
                                              size: 13.sp,
                                              color: orangeColor,
                                              bold: FontWeight.w600,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            TextWidget(
                                              text: "Remove",
                                              size: 13.sp,
                                              color: orangeColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // Checkbox
                                Checkbox(
                                  activeColor: orangeColor,
                                  value: choosePatientController
                                      .checkedItems[index],
                                  onChanged: (bool? value) {
                                    choosePatientController
                                        .checkedItems[index] = value ?? false;
                                    choosePatientController.update();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ADD_PATIENT);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.6.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.2.h),
                              border: Border.all(color: orangeColor)),
                          child: Center(
                            child: TextWidget(
                                text: "Add new patient",
                                size: 14.sp,
                                color: orangeColor,
                                bold: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}