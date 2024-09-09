import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/hex_color.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/time_slot_module/time_slot_controller.dart';

class TimeSlotPage extends GetView<TimeSlotController> {
  final TimeSlotController timeSlotController =
      Get.put<TimeSlotController>(TimeSlotController());

  TimeSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: timeSlotController,
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
                  text: "Cart",
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
                  shrinkWrap: true,
                  children: [
                    TextWidget(
                        text: "Please note:",
                        size: 14.sp,
                        color: greyColor,
                        bold: FontWeight.w600),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    TextWidget(
                        text:
                            "Overnight fasting (8-12 hrs) is required. Do not eat or drink anything exept water before... ",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w400),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 7.h,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 0.6.h),
                              margin: EdgeInsets.only(right: 4.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.2.h),
                                border: Border.all(color: HexColor("3B5664")),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  TextWidget(
                                    text: "Today",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    text: "5 slots",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 1.6.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        value: 1,
                                        visualDensity: VisualDensity.compact,
                                        splashRadius: 1.w,
                                        activeColor: primaryGreenColor,
                                        focusColor: Colors.grey,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        hoverColor: Colors.grey,
                                        groupValue:
                                            timeSlotController.selectedDuration,
                                        onChanged: (value) {
                                          timeSlotController
                                              .setSelectedRadio(value as int);
                                          timeSlotController.update();
                                        },
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      TextWidget(
                                        text: "1:00 pm - 2:00 pm",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    text: "₹19",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.6.h,
                              ),
                              Divider(
                                thickness: 0.2.h,
                                color: Colors.grey.withOpacity(0.20),
                                height: 0.1.h,
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                      height: 6.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
