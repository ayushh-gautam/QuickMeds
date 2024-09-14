import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/hex_color.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/helper_widgets/textfield_widget.dart';
import 'package:quickmeds_user/app/modules/tab_screen_module/tab_screen_controller.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/config/preference_keys.dart';
import '../../../api_collection/config/shared_prefrences.dart';
import '../../helper_widgets/custom_nav_bar.dart';
import '../../routes/app_pages.dart';

class TabScreenPage extends GetView<TabScreenController> {
  final TabScreenController tabScreenController =
      Get.find<TabScreenController>();

  TabScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: tabScreenController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AdvancedDrawer(
            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: primaryGreenColor),
            ),
            controller: tabScreenController.advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: true,
            openScale: 0.65,
            openRatio: 0.54,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              // NOTICE: Uncomment if you want to add shadow behind the page.
              // Keep in mind that it may cause animation jerks.
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            drawer: SafeArea(
                child: Container(
              padding: EdgeInsets.only(top: 2.h, right: 4.w),
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE_SCREEN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 4.h,
                            backgroundColor: Colors.white,
                          ),
                          TextWidget(
                              text: "Fawad khan",
                              size: 12.sp,
                              color: Colors.white,
                              bold: FontWeight.w600),
                          GestureDetector(
                              onTap: () {
                                tabScreenController.advancedDrawerController
                                    .hideDrawer();
                                tabScreenController.update();
                              },
                              child: SvgPicture.asset(
                                "assets/images/cancel.svg",
                                height: 2.6.h,
                              ))
                        ],
                      ),
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
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.NOTIFICATION_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/notifications.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Notifications",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.WISHLIST_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/heart-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Wishlist",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.MY_ORDERS_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/myorders.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "My orders",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.MY_LAB_TEST);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/thermometer-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "My lab tests",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.WALLET_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/wallet.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Wallet",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.ASK_QUESTION_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/question-mark-circle-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Ask question",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.MY_HEALTH_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/person-add-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "My health",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.TERMS_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/file-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Terms & service",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.FAQ_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/message-square-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "FAQs",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.PRIVACY_POLICY_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/file-remove-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Privacy policy",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.RETURN_POLICY_SCREEN);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/file-text-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Return and refund\npolicy",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/phone-call-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Call us",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                    ListTile(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 2.h),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                              content: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 0.4,
                                    sigmaY: 0.4), // Set blur values
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: TextWidget(
                                          text:
                                              "Are you sure you want to logout?",
                                          size: 12.sp,
                                          color: Colors.grey,
                                          bold: FontWeight.w500),
                                    ),
                                    SizedBox(height: 2.6.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              child: TextWidget(
                                                  text: "Yes",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w500),
                                              onPressed: () async {
                                                //! Key Removed here
                                                PreferenceManager.get()
                                                    .removeSpecificKey(
                                                        PreferenceConstants
                                                            .ACCESS_TOKEN)
                                                    .whenComplete(() {
                                                  Get.offAllNamed(
                                                      Routes.LOGIN_SCREEN);
                                                });
                                              }),
                                          TextButton(
                                              child: TextWidget(
                                                  text: "Cancel",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w500),
                                              onPressed: () {
                                                Get.back();
                                              }),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(height: 1.h)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: SvgPicture.asset(
                        "assets/images/log-in-outline.svg",
                        height: 3.h,
                      ),
                      title: TextWidget(
                          text: "Logout",
                          size: 13.sp,
                          color: Colors.white,
                          bold: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: tabScreenController.currentIndex == 0 ||
                      tabScreenController.currentIndex == 3 ||
                      tabScreenController.currentIndex == 1
                  ? AppBar(
                      backgroundColor: appBgColor,
                      elevation: 0,
                      leadingWidth: 40.w,
                      toolbarHeight: 8.4.h,
                      leading: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            isDismissible: true,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                initialChildSize:
                                    0.5, // Initial height as half of the screen
                                minChildSize:
                                    0.5, // Minimum height (half of the screen)
                                maxChildSize:
                                    1.0, // Maximum height (full screen)
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return cityPickerSheet(scrollController);
                                },
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 3.2.h,
                                child: SvgPicture.asset(
                                  "assets/images/location.svg",
                                  height: 3.h,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextWidget(
                                text:
                                    tabScreenController.currentCity.toString(),
                                size: 12.sp,
                                bold: FontWeight.normal,
                                color: greyColor,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.3.h),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: greyColor,
                                  size: 2.2.h,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.w),
                          child: GestureDetector(
                            onTap: () {
                              tabScreenController.advancedDrawerController
                                  .showDrawer();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 3.2.h,
                              child:
                                  ValueListenableBuilder<AdvancedDrawerValue>(
                                valueListenable: tabScreenController
                                    .advancedDrawerController,
                                builder: (_, value, __) {
                                  return AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 250),
                                    child: SvgPicture.asset(
                                      height: 2.h,
                                      value.visible
                                          ? "assets/images/menu.svg"
                                          : "assets/images/menu.svg",
                                      key: ValueKey<bool>(value.visible),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : tabScreenController.currentIndex == 4
                      ? AppBar(
                          elevation: 0,
                          backgroundColor: appBgColor,
                          leadingWidth: 20.w,
                          leading: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  top: 0.4.h,
                                  bottom: 0.4.h),
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
                          actions: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 2.h, bottom: 2.h, right: 4.w),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: greyColor,
                                  size: 3.4.h,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const PreferredSize(
                          preferredSize: Size(0, 0), child: SizedBox()),
              bottomNavigationBar: Stack(
                children: [
                  Container(
                    height: 16.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 8.h, bottom: 1.h),
                    decoration: BoxDecoration(
                        color: appBgColor,
                        image: const DecorationImage(
                            image: AssetImage("assets/images/bottomNav.png"),
                            fit: BoxFit.fill)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomNavBarItem(
                          svg: "assets/images/home.svg",
                          label: 'Home',
                          isSelected: tabScreenController.currentIndex == 0,
                          onTap: () {
                            tabScreenController.currentIndex = 0;
                            tabScreenController.update();
                          },
                        ),
                        CustomNavBarItem(
                          svg: "assets/images/category.svg",
                          label: 'Category',
                          isSelected: tabScreenController.currentIndex == 1,
                          onTap: () {
                            tabScreenController.currentIndex = 1;
                            tabScreenController.update();
                          },
                        ),
                        CustomNavBarItem(
                          label: '                 ',
                          isSelected: tabScreenController.currentIndex == 2,
                          onTap: () {
                            tabScreenController.currentIndex = 2;
                            tabScreenController.update();
                          },
                        ),
                        CustomNavBarItem(
                          svg: "assets/images/labTest.svg",
                          label: 'Lab tests',
                          isSelected: tabScreenController.currentIndex == 3,
                          onTap: () {
                            tabScreenController.currentIndex = 3;
                            tabScreenController.update();
                          },
                        ),
                        CustomNavBarItem(
                          svg: "assets/images/Cart.svg",
                          label: 'Cart',
                          isSelected: tabScreenController.currentIndex == 4,
                          onTap: () {
                            tabScreenController.currentIndex = 4;
                            tabScreenController.update();
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 42.w,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return prescriptionBottomSheet();
                          },
                        );
                        tabScreenController.update();
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 4.4.h,
                            backgroundColor: primaryGreenColor,
                            child: Center(
                              child:
                                  SvgPicture.asset("assets/images/camera.svg"),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextWidget(
                            text: "Upload",
                            size: 9.sp,
                            bold: FontWeight.normal,
                            color: greyColor,
                          ),
                          TextWidget(
                            text: "prescription",
                            size: 9.sp,
                            bold: FontWeight.normal,
                            color: greyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              body: tabScreenController.widgetOptions
                  .elementAt(tabScreenController.currentIndex),
            ),
          ),
        );
      },
    );
  }

  prescriptionBottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: "Order with prescription",
                size: 14.sp,
                bold: FontWeight.w500,
                color: HexColor("#3B5664"),
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.clear,
                      size: 2.8.h, color: HexColor("#3B5664")))
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Divider(
          thickness: 0.04.h,
          color: greyColor,
          height: 0.04.h,
        ),
        SizedBox(
          height: 2.4.h,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
            Get.toNamed(Routes.ORDERBY_PRESCRIPTION);
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.2.h),
                  border: Border.all(color: greyColor.withOpacity(0.20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/capsuels.svg",
                        height: 4.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Order medicines",
                            size: 12.sp,
                            bold: FontWeight.w700,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 0.6.h,
                          ),
                          TextWidget(
                            text: "Get upto 23% discount",
                            size: 11.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset("assets/images/arrow-right-drop-circle.svg")
                ],
              )),
        ),
        SizedBox(
          height: 1.6.h,
        ),
        GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.TAB_SCREEN, arguments: true);
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 4.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.2.h),
                  border: Border.all(color: greyColor.withOpacity(0.20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/test-tube.svg"),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Book lab tests",
                            size: 12.sp,
                            bold: FontWeight.w700,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 0.6.h,
                          ),
                          TextWidget(
                            text: "Get upto 50% discount",
                            size: 11.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SvgPicture.asset("assets/images/arrow-right-drop-circle.svg")
                ],
              )),
        )
      ]),
    );
  }

  Widget cityPickerSheet(ScrollController scrollController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Choose city",
                    size: 14.sp,
                    bold: FontWeight.w500,
                    color: HexColor("#3B5664"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.clear,
                        size: 2.8.h, color: HexColor("#3B5664")),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            TextFieldWidget(
              labelTextFontWeight: FontWeight.w600,
              hintText: "Search your city",
              fillColor: Colors.white,
              textAlign: TextAlign.start,
              textInputFormatter: const [],
              borderColor: greyColor,
              border: const OutlineInputBorder(),
              controller: TextEditingController(),
              suffixIcon: Padding(
                padding: EdgeInsets.all(2.h),
                child: SvgPicture.asset("assets/images/search.svg"),
              ),
              contentPadding: EdgeInsets.only(
                  top: 2.4.h, bottom: 2.6.h, left: 4.w, right: 4.w),
              hintTextStyle: TextStyle(color: textFieldBorder, fontSize: 11.sp),
              style: TextStyle(color: blackColor, fontSize: 12.sp),
              borderRadius: 4.h,
              cursorColor: HexColor("#BBBBBB"),
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 2.h),
            Divider(
              thickness: 0.04.h,
              color: greyColor,
              height: 0.04.h,
            ),
            SizedBox(height: 2.4.h),
            GestureDetector(
              onTap: () {
                Get.find<TabScreenController>().fetchCurrentCity();
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.my_location,
                      color: HexColor("#3B5664"), size: 2.6.h),
                  SizedBox(width: 2.w),
                  TextWidget(
                    text: "Use current location",
                    size: 13.sp,
                    bold: FontWeight.w500,
                    color: HexColor("#3B5664"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.4.h),
            TextWidget(
              text: "Popular cities",
              size: 12.sp,
              bold: FontWeight.w500,
              color: greyColor,
            ),
            SizedBox(height: 2.4.h),
            ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 2.6.h),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/location.svg",
                          height: 2.8.h),
                      SizedBox(width: 4.w),
                      TextWidget(
                        text: "Mumbai",
                        size: 12.sp,
                        bold: FontWeight.w500,
                        color: HexColor("#3B5664"),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 2.4.h),

            TextWidget(
              text: "All cities",
              size: 12.sp,
              bold: FontWeight.w500,
              color: greyColor,
            ),

            
//-----------------------apiii integrate----------------------------------------////

            SizedBox(height: 2.4.h),
            Obx(() {
              if (tabScreenController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var myaddress =
                  tabScreenController.getAddressDetailModel.addresses!;
              return ListView.builder(
                itemCount: myaddress.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 2.6.h),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/location.svg",
                            height: 2.8.h, color: greyColor),
                        SizedBox(width: 4.w),
                        TextWidget(
                          text: myaddress[index].city.toString(),
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: HexColor("#3B5664"),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
            SizedBox(height: 1.6.h),
          ],
        ),
      ),
    );
  }
}
