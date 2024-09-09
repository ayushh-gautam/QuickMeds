import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/drawer_screen_module/drawer_screen_page.dart';
import 'package:quickmeds_user/app/utils/strings.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../helper_widgets/validators.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'home_screen_controller.dart';

///
///

class HomeScreenPage extends GetView<HomeScreenController> {
  final HomeScreenController homeScreenController =
      Get.put<HomeScreenController>(HomeScreenController());

  HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: homeScreenController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: appBgColor,
              body: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
                    child: Column(
                      children: [
                        TextFieldWidget(
                            labelTextFontWeight: FontWeight.w600,
                            hintText: "Search for medicine and health products",
                            fillColor: Colors.white,
                            textAlign: TextAlign.start,
                            textInputFormatter: const [],
                            controller: TextEditingController(),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(2.h),
                              child:
                                  SvgPicture.asset("assets/images/search.svg"),
                            ),
                            readonly: true,
                            onTap: () {
                              Get.toNamed(Routes.SEARCH_SCREEN);
                            },
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
                                onTap: () {
                                  Get.offAllNamed(Routes.TAB_SCREEN,
                                      arguments: false);
                                },
                                child: SizedBox(
                                  width: 28.w,
                                  height: 18.h,
                                  child: Column(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            "assets/images/medicines.png"),
                                        height: 11.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Medicines",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600)
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed(Routes.TAB_SCREEN,
                                      arguments: "labTest");
                                },
                                child: SizedBox(
                                  width: 28.w,
                                  height: 18.h,
                                  child: Column(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            "assets/images/labTests.png"),
                                        height: 11.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Lab tests",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600)
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAllNamed(Routes.TAB_SCREEN,
                                      arguments: false);
                                },
                                child: SizedBox(
                                  width: 28.w,
                                  height: 18.h,
                                  child: Column(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            "assets/images/healthProducts.png"),
                                        height: 11.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Health",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                      TextWidget(
                                          text: "products",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.ORDERBY_PRESCRIPTION);
                                },
                                child: SizedBox(
                                  width: 28.w,
                                  height: 18.h,
                                  child: Column(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            "assets/images/pres.png"),
                                        height: 11.h,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                          text: "Upload",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                      TextWidget(
                                          text: "Prescription",
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: "Medicines reminders",
                              size: 16.sp,
                              bold: FontWeight.bold,
                              color: greyColor,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.ALL_REMINDERS);
                                },
                                child: TextWidget(
                                  text: "View all",
                                  size: 12.sp,
                                  bold: FontWeight.w600,
                                  color: orangeColor,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryGreenColor,
                              borderRadius: BorderRadius.circular(4.w)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/capsule.svg",
                                        height: 4.h,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                              text: "Amlodipine",
                                              size: 14.sp,
                                              color: Colors.white,
                                              bold: FontWeight.w600),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(
                                                  text: "1 Tablet - ",
                                                  size: 11.sp,
                                                  color: Colors.white,
                                                  bold: FontWeight.w600),
                                              SvgPicture.asset(
                                                "assets/images/clock.svg",
                                                height: 2.h,
                                              ),
                                              TextWidget(
                                                  text: " 7h23min",
                                                  size: 11.sp,
                                                  color: Colors.white,
                                                  bold: FontWeight.w600),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/clock.svg",
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 3.h,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Divider(
                                thickness: 0.2.h,
                                color: Colors.white,
                                height: 0.1.h,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 2.h,
                                child: ListView.builder(
                                  itemCount: 7,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.4.w),
                                      child: Row(
                                        children: [
                                          TextWidget(
                                              text: "${index + 1}",
                                              size: 11.sp,
                                              color: Colors.white,
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
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ADD_MEDICINE_REMINDER);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.2.h),
                                border: Border.all(color: orangeColor)),
                            child: Center(
                              child: TextWidget(
                                  text: "+ Add New",
                                  size: 14.sp,
                                  color: orangeColor,
                                  bold: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CarouselSlider(
                            carouselController:
                                homeScreenController.carouselController,
                            options: CarouselOptions(
                              initialPage: homeScreenController.currentIndex,
                              onPageChanged: (int index, reason) {
                                homeScreenController.currentIndex = index;
                                homeScreenController.update();
                                print("INDEX:::$index REASON::$reason");
                              },
                              height: 28.h,
                              viewportFraction: 1,
                              scrollPhysics:
                                  const AlwaysScrollableScrollPhysics(),
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: [
                              // for(var i = 0; (homeScreenController.getCurrentLoadsResponse.body?.length ?? 0) <= 3
                              //     ? i < (homeScreenController.getCurrentLoadsResponse.body?.length ?? 0)
                              //     : i < 3;
                              // i++)
                              for (var i = 0; i <= 6 ? i < 5 : i < 6; i++)
                                Container(
                                  padding: EdgeInsets.only(left: 4.w, top: 2.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1.2.h),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        image: const AssetImage(
                                            "assets/images/health_medicine.png"),
                                        height: 20.h,
                                      )
                                    ],
                                  ),
                                ),
                            ]),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 2.h,
                          alignment: Alignment.center,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Container(
                                    width: 2.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            homeScreenController.currentIndex ==
                                                    i
                                                ? orangeColor
                                                : Colors.white),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: "Top Selling",
                              size: 16.sp,
                              bold: FontWeight.bold,
                              color: greyColor,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.TOP_SELLING_SCREEN);
                                },
                                child: TextWidget(
                                  text: "View all",
                                  size: 12.sp,
                                  bold: FontWeight.w600,
                                  color: orangeColor,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            index == 0
                                ? SizedBox(
                                    width: 4.w,
                                  )
                                : SizedBox(
                                    width: 2.w,
                                  ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT_DETAIL_SCREEN);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 2.w, right: 4.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.6.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 6.w,
                                                  top: 1.h,
                                                  right: 6.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.w),
                                                  color: primaryGreenColor
                                                      .withOpacity(0.10)),
                                              child: Image.asset(
                                                "assets/images/tablet 1.png",
                                                height: 14.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: greyColor
                                                      .withOpacity(0.20),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.w)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.w,
                                                  vertical: 0.6.h),
                                              child: TextWidget(
                                                  text: "Vitamin",
                                                  size: 11.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextWidget(
                                                    text: "₹366",
                                                    size: 18.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w900),
                                                SizedBox(
                                                  width: 40.w,
                                                ),
                                                TextWidget(
                                                  text: "₹999",
                                                  size: 11.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          width: 68.w,
                                          child: TextWidget(
                                              text:
                                                  "Zinga vita Vitamin Amla Extract 1000 mg Tablet",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          width: 68.w,
                                          child: SubmitButtonHelper(
                                            text: "Add to Cart",
                                            onTap: () {},
                                            height: 5.6.h,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0.8.h,
                                  left: -0,
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset("assets/images/tag.svg"),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: TextWidget(
                                            text: "75% off",
                                            size: 11.sp,
                                            color: Colors.white,
                                            bold: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 1.w,
                                    top: 1.h,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: greyColor,
                                      size: 3.h,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CarouselSlider(
                      carouselController:
                          homeScreenController.carouselController,
                      options: CarouselOptions(
                        initialPage: homeScreenController.currentIndex,
                        onPageChanged: (int index, reason) {
                          homeScreenController.currentIndex = index;
                          homeScreenController.update();
                          print("INDEX:::$index REASON::$reason");
                        },
                        height: 28.h,
                        viewportFraction: 1,
                        scrollPhysics: const AlwaysScrollableScrollPhysics(),
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        // for(var i = 0; (homeScreenController.getCurrentLoadsResponse.body?.length ?? 0) <= 3
                        //     ? i < (homeScreenController.getCurrentLoadsResponse.body?.length ?? 0)
                        //     : i < 3;
                        // i++)
                        for (var i = 0; i <= 6 ? i < 5 : i < 6; i++)
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
                                  image: const AssetImage(
                                      "assets/images/health_medicine.png"),
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                      ]),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 2.h,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Container(
                              width: 2.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: homeScreenController.currentIndex == i
                                      ? orangeColor
                                      : Colors.white),
                            ),
                          );
                        }),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 18.h,
                                          width: 70.w,
                                          child: const Image(
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Explore Packages",
                          size: 16.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.EXPLORE_PACKAGES);
                            },
                            child: TextWidget(
                              text: "View all",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: orangeColor,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 16.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            index == 0
                                ? SizedBox(
                                    width: 4.w,
                                  )
                                : SizedBox(
                                    width: 2.w,
                                  ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1.2.h),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Material(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        color: primaryGreenColor,
                                      ),
                                      width: 40.w,
                                      height: 10.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.8.h, horizontal: 4.w),
                                    child: TextWidget(
                                        text: "Heart Health tests",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Most Popular",
                          size: 16.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.TOP_SELLING_SCREEN,
                                  arguments: true);
                            },
                            child: TextWidget(
                              text: "View all",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: orangeColor,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            index == 0
                                ? SizedBox(
                                    width: 4.w,
                                  )
                                : SizedBox(
                                    width: 2.w,
                                  ),
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT_DETAIL_SCREEN);
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 2.w, right: 4.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.6.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 6.w,
                                                  top: 1.h,
                                                  right: 6.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.w),
                                                  color: primaryGreenColor
                                                      .withOpacity(0.10)),
                                              child: Image.asset(
                                                "assets/images/tablet 1.png",
                                                height: 14.h,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: greyColor
                                                      .withOpacity(0.20),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.w)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6.w,
                                                  vertical: 0.6.h),
                                              child: TextWidget(
                                                  text: "Vitamin",
                                                  size: 11.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                TextWidget(
                                                    text: "₹366",
                                                    size: 18.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w900),
                                                SizedBox(
                                                  width: 40.w,
                                                ),
                                                TextWidget(
                                                  text: "₹999",
                                                  size: 11.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          width: 68.w,
                                          child: TextWidget(
                                              text:
                                                  "Zinga vita Vitamin Amla Extract 1000 mg Tablet",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        SizedBox(
                                          width: 68.w,
                                          child: SubmitButtonHelper(
                                            text: "Add to Cart",
                                            onTap: () {},
                                            height: 5.6.h,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0.8.h,
                                  left: -0,
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset("assets/images/tag.svg"),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: TextWidget(
                                            text: "75% off",
                                            size: 11.sp,
                                            color: Colors.white,
                                            bold: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 1.w,
                                    top: 1.h,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: greyColor,
                                      size: 3.h,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const Image(image: AssetImage("assets/images/Footer.png")),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
