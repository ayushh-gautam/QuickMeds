import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/track_booking_module/track_booking_controller.dart';

/// GetX Template Generator - fb.com/htngu.99
///

class TrackBookingPage extends GetView<TrackBookingController> {
  final TrackBookingController trackBookingController =
      Get.find<TrackBookingController>();

  TrackBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: trackBookingController,
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
                  text: "Track lab test",
                  size: 14.sp,
                  bold: FontWeight.bold,
                  color: greyColor,
                ),
                centerTitle: true,
              ),
              resizeToAvoidBottomInset: false,
              backgroundColor: appBgColor,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 24.w,
                            child: Image.asset(
                              "assets/images/Frame 1171275762.png",
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60.w,
                              child: TextWidget(
                                  text:
                                      "Comprehensive gold full body checkup with smart report",
                                  size: 12.sp,
                                  bold: FontWeight.w500,
                                  color: greyColor),
                            ),
                            SizedBox(
                              height: 1.4.h,
                            ),
                            TextWidget(
                              text: "E-report by Fri,01 Mar",
                              size: 12.sp,
                              bold: FontWeight.w500,
                              color: orangeColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 6.w,
                        ),
                        const Image(
                            image: AssetImage("assets/images/image 35.png")),
                        SizedBox(
                          width: 8.w,
                        ),
                        TextWidget(
                            text: "Booking confirmed",
                            size: 12.sp,
                            bold: FontWeight.w500,
                            color: greyColor),
                        const Spacer(),
                        const Image(
                            image: AssetImage("assets/images/Group 48.png"))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              width: 0.2.w,
                              height: 0.8.h,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        const Image(
                            image: AssetImage(
                                "assets/images/19-190811_customer-order-orders-icon-clipart-removebg-preview.png")),
                        SizedBox(
                          width: 8.w,
                        ),
                        TextWidget(
                            text: "Our representative will contact\nyou soon",
                            size: 12.sp,
                            bold: FontWeight.w500,
                            color: greyColor),
                        const Spacer(),
                        const Image(
                            image: AssetImage("assets/images/Group 48.png"))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              width: 0.2.w,
                              height: 0.8.h,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        const Image(
                            image: AssetImage("assets/images/Group 36.png")),
                        SizedBox(
                          width: 8.w,
                        ),
                        TextWidget(
                            text:
                                "Test report will be share\n on Mail / Whatsapp ",
                            size: 12.sp,
                            bold: FontWeight.w500,
                            color: greyColor),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextWidget(
                      text: "Booking details",
                      size: 14.sp,
                      bold: FontWeight.bold,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 3.6.h,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                              "assets/images/person-outline.svg"),
                        ),
                        const SizedBox(
                            width:
                                16), // Add space between CircleAvatar and Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Thor",
                              size: 13.sp,
                              color: greyColor,
                              bold: FontWeight.w600,
                            ),
                            TextWidget(
                              text: "Male,23",
                              size: 11.sp,
                              color: greyColor,
                              bold: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 3.6.h,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                              "assets/images/calendar-outline.svg"),
                        ),
                        const SizedBox(
                            width:
                                16), // Add space between CircleAvatar and Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "29 Feb 2024, 12 PM - 1PM",
                              size: 13.sp,
                              color: greyColor,
                              bold: FontWeight.w600,
                            ),
                            TextWidget(
                              text: "Sample collation slot",
                              size: 11.sp,
                              color: greyColor,
                              bold: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 3.6.h,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            "assets/images/location.svg",
                            color: greyColor,
                          ),
                        ),
                        const SizedBox(
                            width:
                                16), // Add space between CircleAvatar and Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "Office (Ashar it 402,thane)",
                              size: 13.sp,
                              color: greyColor,
                              bold: FontWeight.w600,
                            ),
                            TextWidget(
                              text: "Sample collation address",
                              size: 11.sp,
                              color: greyColor,
                              bold: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
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
                      height: 6.h,
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
