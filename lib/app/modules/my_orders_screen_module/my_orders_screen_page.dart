import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/my_orders_screen_module/my_orders_screen_controller.dart';

class MyOrdersScreenPage extends GetView<MyOrdersScreenController> {
  final MyOrdersScreenController myOrdersScreenController =
      Get.find<MyOrdersScreenController>();

  MyOrdersScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: myOrdersScreenController,
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
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: SvgPicture.asset(
                        "assets/images/1.svg",
                        height: 7.8.h,
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
                text: "My orders ",
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
                                text: "Deliver on",
                                size: 12.sp,
                                color: HexColor("3B5664"),
                                bold: FontWeight.w600),
                            SizedBox(
                              width: 4.w,
                            ),
                            TextWidget(
                                text: "03-04-2024",
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.6.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 20.w,
                                    child: Image.asset(
                                      "assets/images/tablet 1.png",
                                      height: 18.h,
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
                                      width: 54.w,
                                      child: TextWidget(
                                          text:
                                              "Zinga vita Vitamin Amla Extract 1000 mg Tablet",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 1.2.h,
                                    ),
                                    SizedBox(
                                        width: 58.w,
                                        child: TextWidget(
                                          text:
                                              "Fast&Up Charge is a completely natural Vitamin C supplement that delivers immunity-boosting...",
                                          size: 9.sp,
                                          bold: FontWeight.w500,
                                          color: greyColor,
                                        )),
                                    SizedBox(
                                      height: 1.2.h,
                                    ),
                                    Row(
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
                                          size: 16.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              thickness: 0.06.h,
                              color: greyColor,
                              height: 0.04.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        border: Border.all(color: orangeColor)),
                                    child: Center(
                                      child: TextWidget(
                                          text: "Track order",
                                          size: 14.sp,
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
