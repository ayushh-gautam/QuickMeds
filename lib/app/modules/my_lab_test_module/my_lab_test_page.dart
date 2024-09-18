import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/my_lab_test_module/my_lab_test_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';

class MyLabTestPage extends GetView<MyLabTestController> {
  final MyLabTestController myLabTestController =
      Get.find<MyLabTestController>();

  MyLabTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: myLabTestController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 14.h,
              bottom: PreferredSize(
                preferredSize: Size(double.maxFinite, 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                        child: TextFieldWidget(
                            labelTextFontWeight: FontWeight.w600,
                            hintText: "Search your order here",
                            fillColor: Colors.white,
                            textAlign: TextAlign.start,
                            textInputFormatter: const [],
                            controller: TextEditingController(),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(2.h),
                              child:
                                  SvgPicture.asset("assets/images/search.svg"),
                            ),
                            contentPadding: EdgeInsets.only(
                                top: 2.6.h,
                                bottom: 2.8.h,
                                left: 4.w,
                                right: 4.w),
                            hintTextStyle: TextStyle(
                              color: textFieldBorder,
                              fontSize: 11.sp,
                            ),
                            style:
                                TextStyle(color: blackColor, fontSize: 12.sp),
                            borderRadius: 4.h,
                            cursorColor: HexColor("#BBBBBB"),
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.done),
                      ),
                    ),

                    //filter
                    GestureDetector(
                      onTap: () {
                        //show buttom sheet

                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const TextWidget(
                                            text: 'Booking status',
                                            size: 20,
                                            bold: FontWeight.w600),
                                        IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const Icon(Icons.close)),
                                      ],
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 0.5,
                                      color: greyColor,
                                    ).marginOnly(top: 5, bottom: 12),
                                    Obx(() {
                                      return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: myLabTestController
                                            .bookingStatusChecked.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Checkbox(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                activeColor: orangeColor,
                                                value: controller
                                                        .bookingStatusChecked[
                                                    index],
                                                onChanged: (value) {
                                                  controller
                                                      .toggleBookingStatusCheckbox(
                                                          index);
                                                },
                                              ),
                                              TextWidget(
                                                text: controller
                                                    .bookingStatusData[index],
                                                size: 18,
                                                color: myLabTestController
                                                            .bookingStatusChecked[
                                                        index]
                                                    ? orangeColor
                                                    : Colors.black,
                                                bold: FontWeight.normal,
                                              ),
                                            ],
                                          ).marginOnly(bottom: 3);
                                        },
                                      );
                                    }),
                                    const TextWidget(
                                        text: 'Booking time',
                                        size: 20,
                                        bold: FontWeight.w600),
                                    Container(
                                      width: double.infinity,
                                      height: 0.5,
                                      color: greyColor,
                                    ).marginOnly(top: 18, bottom: 12),
                                    Obx(() {
                                      return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: myLabTestController
                                            .bookingTimeChecked.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Checkbox(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                activeColor: orangeColor,
                                                value: controller
                                                    .bookingTimeChecked[index],
                                                onChanged: (value) {
                                                  controller
                                                      .toggleBookingTimeCheckbox(
                                                          index);
                                                },
                                              ),
                                              TextWidget(
                                                text: controller
                                                    .bookingTimeData[index],
                                                color: myLabTestController
                                                            .bookingTimeChecked[
                                                        index]
                                                    ? orangeColor
                                                    : Colors.black,
                                                size: 18,
                                                bold: FontWeight.normal,
                                              ),
                                            ],
                                          ).marginOnly(bottom: 3);
                                        },
                                      );
                                    }),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            myLabTestController
                                                .clearAllCheckboxes();
                                          },
                                          child: TextWidget(
                                            text: 'Clear all',
                                            size: 20,
                                            bold: FontWeight.normal,
                                            color: greyColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 255,
                                          child: SubmitButtonHelper(
                                              color: primaryGreenColor,
                                              text: 'Apply',
                                              onTap: () {}),
                                        )
                                      ],
                                    )
                                  ],
                                ).marginSymmetric(horizontal: 18, vertical: 18),
                              );
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: SvgPicture.asset(
                          "assets/images/1.svg",
                          height: 7.8.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                  ],
                ),
              ),
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
                text: "My lab tests",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
              child: ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 2.w, right: 2.w, bottom: 1.6.h, top: 1.6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(1.2.h),
                                topLeft: Radius.circular(1.2.h)),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF16D9E3)
                                    .withOpacity(0.20), // Hex color #16D9E3
                                const Color(0xFF30C7EC)
                                    .withOpacity(0.20), // Hex color #30C7EC
                                const Color(0xFF46AEF7)
                                    .withOpacity(0.20), // Hex color #46AEF7
                              ],
                              stops: const [
                                0.2,
                                0.4,
                                0.6
                              ], // Gradual transitions based on percentages
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: Row(
                          children: [
                            TextWidget(
                                text: "Sample collection",
                                size: 12.sp,
                                color: HexColor("3B5664"),
                                bold: FontWeight.w600),
                            SizedBox(
                              width: 4.w,
                            ),
                            TextWidget(
                                text: "Today, 12-1pm",
                                size: 12.sp,
                                color: primaryGreenColor,
                                bold: FontWeight.w600),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 2.w, right: 2.w, bottom: 1.6.h),
                        margin: EdgeInsets.only(bottom: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1.2.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.6.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 18.w,
                                    child: Image.asset(
                                      "assets/images/Frame 1171275762.png",
                                      height: 10.h,
                                    )),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                        width: 58.w,
                                        child: TextWidget(
                                          text: "Test",
                                          size: 11.sp,
                                          bold: FontWeight.w500,
                                          color: greyColor,
                                        )),
                                    SizedBox(
                                      height: 0.6.h,
                                    ),
                                    SizedBox(
                                      width: 58.w,
                                      child: TextWidget(
                                          text:
                                              "Comprehensive gold full body checkup with smart report",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset("assets/images/person.svg"),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                        width: 58.w,
                                        child: TextWidget(
                                          text: "Patient",
                                          size: 11.sp,
                                          bold: FontWeight.w500,
                                          color: greyColor,
                                        )),
                                    SizedBox(
                                      height: 0.6.h,
                                    ),
                                    SizedBox(
                                      width: 58.w,
                                      child: TextWidget(
                                          text: "Iron man",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                              color: dotColor,
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 1.4.h,
                            ),
                            TextWidget(
                                text: "Collection slot confirmed",
                                size: 13.sp,
                                color: primaryGreenColor,
                                bold: FontWeight.w600),
                            SizedBox(
                              height: 0.6.h,
                            ),
                            TextWidget(
                              text:
                                  "Phlebotomist details will be updated 2 hours before collection time.",
                              size: 11.sp,
                              bold: FontWeight.w500,
                              color: greyColor,
                            ),
                            SizedBox(
                              height: 1.4.h,
                            ),
                            TextWidget(
                                text: "Please note:",
                                size: 11.sp,
                                color: greyColor,
                                bold: FontWeight.w600),
                            SizedBox(
                              height: 0.6.h,
                            ),
                            TextWidget(
                              text:
                                  "Overnight fasting (8-12 hrs) is required. Do not eat or drink anything except water before...read more",
                              size: 11.sp,
                              bold: FontWeight.w500,
                              color: greyColor,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.8.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        border: Border.all(color: orangeColor)),
                                    child: Center(
                                      child: TextWidget(
                                          text: "Track booking",
                                          size: 12.sp,
                                          color: orangeColor,
                                          bold: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Expanded(
                                    child: SubmitButtonHelper(
                                        text: "See Details", onTap: () {})),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
