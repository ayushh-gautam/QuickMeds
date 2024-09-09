import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/lab_test_detail_module/lab_test_detail_controller.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class LabTestDetailPage extends GetView<LabTestDetailController> {
  final LabTestDetailController labTestDetailController =
      Get.find<LabTestDetailController>();

  LabTestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: labTestDetailController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                backgroundColor: appBgColor,
                bottomNavigationBar: Container(
                    height: 10.h,
                    padding: EdgeInsets.only(
                        left: 2.w, right: 2.w, bottom: 1.2.h, top: 1.6.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1.2.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                                text: "₹2199",
                                size: 16.sp,
                                color: greyColor,
                                bold: FontWeight.w800),
                            TextWidget(
                                text: "1 Test",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                            width: 54.w,
                            child: SubmitButtonHelper(
                                text: "Go to cart",
                                onTap: () {
                                  Get.toNamed(Routes.LAB_TEST_CART);
                                }))
                      ],
                    )),
                body: ListView(
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: const AssetImage(
                              "assets/images/Frame 1171275762.png"),
                          height: 48.h,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                top: 1.6.h,
                                bottom: 0.4.h),
                            width: 11.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3.2.w),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: orangeColor,
                              size: 2.4.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: TextWidget(
                                  text:
                                      "Comprehensive gold full body checkup with smart report",
                                  size: 16.sp,
                                  bold: FontWeight.w700,
                                  color: greyColor,
                                ),
                              ),
                              Icon(
                                Icons.share,
                                color: greyColor,
                                size: 3.2.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/file-text-outline.svg",
                                color: greyColor,
                              ),
                              TextWidget(
                                text: "  71,135 people booked this recently",
                                size: 11.sp,
                                bold: FontWeight.w500,
                                color: greyColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/people-outline.svg",
                                color: greyColor,
                              ),
                              TextWidget(
                                text:
                                    "  Earliest report expected within 18 hours",
                                size: 11.sp,
                                bold: FontWeight.w500,
                                color: greyColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      text: "₹3226",
                                      size: 20.sp,
                                      color: greyColor,
                                      bold: FontWeight.w900),
                                  SizedBox(width: 2.w),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: "₹9399",
                                        size: 14.sp,
                                        color: greyColor,
                                        bold: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      TextWidget(
                                        text: "55% off",
                                        size: 12.sp,
                                        color: primaryGreenColor,
                                        bold: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.8.h, horizontal: 20.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.2.h),
                                    border:
                                        Border.all(color: primaryGreenColor)),
                                child: Center(
                                  child: TextWidget(
                                      text: "Book",
                                      size: 14.sp,
                                      color: primaryGreenColor,
                                      bold: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text:
                                " A Comprehensive Gold Full Body Checkup with Smart Report comprises various tests that help determine your overall health status. It helps screen for early signs or risk factors of various health concerns or the presence of deficiencies or diseases",
                            size: 11.8.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: "No of tests:",
                                size: 11.8.sp,
                                bold: FontWeight.w500,
                                color: greyColor,
                              ),
                              TextWidget(
                                text: " 79 tests > ",
                                size: 11.8.sp,
                                bold: FontWeight.w600,
                                color: greyColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: "Sample required:",
                                size: 11.8.sp,
                                bold: FontWeight.w500,
                                color: greyColor,
                              ),
                              TextWidget(
                                text: " Blood, Urine",
                                size: 11.8.sp,
                                bold: FontWeight.w600,
                                color: greyColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Preparations:",
                                size: 11.8.sp,
                                bold: FontWeight.w500,
                                color: greyColor,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 64.w,
                                child: TextWidget(
                                  text:
                                      "Overnight fasting (8-12 hrs) is required. Do not eat or drink anything except water before the test. Avoid iron supplements for at least 24 hours prior to sample collection. It is advisable to stop multivitamins or dietary supplements containing biotin (vitamin B7) for at least 2 days before the test.You need not stop taking your thyroid medications on theday of the test unless otherwise advised by the doctor. The urine sample must preferably be the first morning midstream urine (part of urine that comes after the first and before the last stream). Collect the urine sample in a quick med Img Labs Most trusted by customers LTE sealed and sterile screw-capped container provided by our sample collection professional. Ensure that the urethral area (from where the urine is passed) is clean & container doesn't come in contact with your skin. Women are advised not to give the sample during the menstrual period unless prescribed. You should submit all the required samples for this package at once during the scheduled sample collection.",
                                  size: 11.4.sp,
                                  bold: FontWeight.w500,
                                  color: greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      thickness: 0.4.h,
                      color: dotColor,
                      height: 0.1.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: const Image(
                          image: AssetImage("assets/images/poweredBy.png")),
                    ),
                    SizedBox(
                      height: 2.6.h,
                    ),
                    Divider(
                      thickness: 0.4.h,
                      color: dotColor,
                      height: 0.1.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          TextWidget(
                            text:
                                "What does Comprehensive Gold Full Body Checkup with Smart Report measure?",
                            size: 16.sp,
                            bold: FontWeight.w700,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text:
                                "Contains 79 tests\n\nA Comprehensive Gold Full Body Checkup with Smart Report allows for the detection, monitoring, and management of acute and chronic health issues or diseases even before the initial symptoms show up. Getting a checkup done regularly allows one to keep a check on their health and is one of the most important parts of preventive healthcare. With a Comprehensive Gold Full Body Checkup with Smart Report, doctors can track organ functioning and abnormalities related to them, which can help take proper measures at the right time to avoid health issues.",
                            size: 11.4.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                )),
          );
        });
  }
}
