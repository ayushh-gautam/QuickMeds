import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/modules/lab_test_module/lab_test_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
/**
 * 
 * */

class LabTestPage extends GetView<LabTestController> {
  final LabTestController labTestController =
      Get.put<LabTestController>(LabTestController());

  LabTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: labTestController,
        builder: (logic) {
          return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                  backgroundColor: appBgColor,
                  body: ListView(shrinkWrap: true, children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                              labelTextFontWeight: FontWeight.w600,
                              hintText: "Search lab tests and packages",
                              fillColor: Colors.white,
                              textAlign: TextAlign.start,
                              textInputFormatter: [],
                              controller: TextEditingController(),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: SvgPicture.asset(
                                    "assets/images/search.svg"),
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
                          SizedBox(
                            height: 2.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 18.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/pres.png"),
                                          height: 12.h,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextWidget(
                                            text: "Upload prescription",
                                            size: 9.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SizedBox(
                                  height: 18.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/callBook.png"),
                                        height: 12.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Call us to book tests",
                                          size: 9.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SizedBox(
                                  height: 18.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/whatsapp.png"),
                                        height: 12.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Whatsapp to book tests",
                                          size: 9.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text: "Previous Browsed Tests",
                            size: 16.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 42.h,
                            child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LAB_TEST_DETAIL);
                                  },
                                  child: Container(
                                    width: 74.w,
                                    margin: EdgeInsets.only(right: 1.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/browse.png"),
                                          height: 18.h,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                  text:
                                                      "Fever package extensive (includes dengue, malaria, typhoid & chiku..",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              TextWidget(
                                                text:
                                                    "Get reports within 18 hrs",
                                                size: 9.sp,
                                                bold: FontWeight.w500,
                                                color: greyColor,
                                              ),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextWidget(
                                                      text: "₹366",
                                                      size: 16.sp,
                                                      color: greyColor,
                                                      bold: FontWeight.w800),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "₹999",
                                                    size: 15.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "55% off",
                                                    size: 12.sp,
                                                    color: orangeColor,
                                                    bold: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(Routes
                                                      .ADD_MEDICINE_REMINDER);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.6.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.2.h),
                                                      border: Border.all(
                                                          color: orangeColor)),
                                                  child: Center(
                                                    child: TextWidget(
                                                        text: "Book Now",
                                                        size: 14.sp,
                                                        color: orangeColor,
                                                        bold: FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4.w, top: 2.h),
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
                                        text:
                                            "Book preventive checkup with our",
                                        size: 9.sp,
                                        color: greyColor,
                                        bold: FontWeight.w600),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                        text: "Lab tests",
                                        size: 20.sp,
                                        color: greyColor,
                                        bold: FontWeight.w700),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                      child: SubmitButtonHelper(
                                        text: "Book Now",
                                        onTap: () {},
                                        height: 5.6.h,
                                      ),
                                    )
                                  ],
                                ),
                                Image(
                                  image: AssetImage(
                                      "assets/images/health_medicine.png"),
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text: "Doctor curated lab packages",
                            size: 16.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.ADD_MEDICINE_REMINDER);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1.8.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.2.h),
                                  border: Border.all(color: orangeColor)),
                              child: Center(
                                child: TextWidget(
                                    text: "See all",
                                    size: 14.sp,
                                    color: orangeColor,
                                    bold: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text: "Most booked health checkups",
                            size: 16.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 42.h,
                            child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LAB_TEST_DETAIL);
                                  },
                                  child: Container(
                                    width: 74.w,
                                    margin: EdgeInsets.only(right: 1.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/browse.png"),
                                          height: 18.h,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                  text:
                                                      "Fever package extensive (includes dengue, malaria, typhoid & chiku..",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              TextWidget(
                                                text:
                                                    "Get reports within 18 hrs",
                                                size: 9.sp,
                                                bold: FontWeight.w500,
                                                color: greyColor,
                                              ),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextWidget(
                                                      text: "₹366",
                                                      size: 16.sp,
                                                      color: greyColor,
                                                      bold: FontWeight.w800),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "₹999",
                                                    size: 15.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "55% off",
                                                    size: 12.sp,
                                                    color: orangeColor,
                                                    bold: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(Routes
                                                      .ADD_MEDICINE_REMINDER);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.6.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.2.h),
                                                      border: Border.all(
                                                          color: orangeColor)),
                                                  child: Center(
                                                    child: TextWidget(
                                                        text: "Book Now",
                                                        size: 14.sp,
                                                        color: orangeColor,
                                                        bold: FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4.w, top: 2.h),
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
                                        text:
                                            "Book preventive checkup with our",
                                        size: 9.sp,
                                        color: greyColor,
                                        bold: FontWeight.w600),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                        text: "Lab tests",
                                        size: 20.sp,
                                        color: greyColor,
                                        bold: FontWeight.w700),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                      child: SubmitButtonHelper(
                                        text: "Book Now",
                                        onTap: () {},
                                        height: 5.6.h,
                                      ),
                                    )
                                  ],
                                ),
                                Image(
                                  image: AssetImage(
                                      "assets/images/health_medicine.png"),
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            text: "Health packages for fever",
                            size: 16.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 42.h,
                            child: ListView.builder(
                              itemCount: 10,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.LAB_TEST_DETAIL);
                                  },
                                  child: Container(
                                    width: 74.w,
                                    margin: EdgeInsets.only(right: 1.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/browse.png"),
                                          height: 18.h,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                  text:
                                                      "Fever package extensive (includes dengue, malaria, typhoid & chiku..",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              TextWidget(
                                                text:
                                                    "Get reports within 18 hrs",
                                                size: 9.sp,
                                                bold: FontWeight.w500,
                                                color: greyColor,
                                              ),
                                              SizedBox(
                                                height: 1.2.h,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextWidget(
                                                      text: "₹366",
                                                      size: 16.sp,
                                                      color: greyColor,
                                                      bold: FontWeight.w800),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "₹999",
                                                    size: 15.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  TextWidget(
                                                    text: "55% off",
                                                    size: 12.sp,
                                                    color: orangeColor,
                                                    bold: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(Routes
                                                      .ADD_MEDICINE_REMINDER);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.6.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1.2.h),
                                                      border: Border.all(
                                                          color: orangeColor)),
                                                  child: Center(
                                                    child: TextWidget(
                                                        text: "Book Now",
                                                        size: 14.sp,
                                                        color: orangeColor,
                                                        bold: FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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
                          TextWidget(
                            text: "Health packages for women care",
                            size: 16.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 18.h,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 4.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 14.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                          color: primaryGreenColor,
                                          borderRadius:
                                              BorderRadius.circular(1.2.h),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Wellness checkups",
                                          size: 10.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 44.h,
                      padding:
                          EdgeInsets.only(left: 4.w, top: 2.h, bottom: 1.2.h),
                      color: primaryGreenColor,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/thermometer-outline.svg",
                                height: 3.h,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextWidget(
                                text: "Popular lab tests at RS.299",
                                size: 16.sp,
                                bold: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 34.h,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.PACKAGES_DETAIL);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 4.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 1.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(1.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 18.h,
                                            width: 70.w,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/Frame 1171275624 (1).png"),
                                              fit: BoxFit.fill,
                                            )),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        TextWidget(
                                            text:
                                                "Thyroid profile total(T3,T4& TSH)",
                                            size: 13.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextWidget(
                                            text: "Contains 3 tests",
                                            size: 11.sp,
                                            color: greyColor,
                                            bold: FontWeight.w400),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                TextWidget(
                                                    text: "₹366",
                                                    size: 16.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w900),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                TextWidget(
                                                    text: "onwards",
                                                    size: 11.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w400),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            TextWidget(
                                                text: "Schedule now >>",
                                                size: 11.sp,
                                                color: orangeColor,
                                                bold: FontWeight.w400),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: double.maxFinite,
                        child: Image(
                          image: AssetImage(
                              "assets/images/Most booked health checkup.png"),
                          fit: BoxFit.fitWidth,
                        )),
                    Image(image: AssetImage("assets/images/labtestfooter.png")),
                  ])));
        });
  }
}
