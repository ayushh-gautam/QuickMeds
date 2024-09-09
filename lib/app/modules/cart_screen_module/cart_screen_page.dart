import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/modules/cart_screen_module/cart_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
/**
 * 
 * */

class CartScreenPage extends GetView<CartScreenController> {
  final CartScreenController cartScreenController =
      Get.put<CartScreenController>(CartScreenController());

  CartScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: cartScreenController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: appBgColor,
              body: Padding(
                padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
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
                                        height: 20.h,
                                      )),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        height: 0.6.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                            text: "Quantity: 1  Variant: 500mg",
                                            size: 9.sp,
                                            bold: FontWeight.w500,
                                            color: greyColor,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w,
                                                vertical: 0.4.h),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        0.6.h),
                                                border: Border.all(
                                                    color: greyColor)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 1.h),
                                                  child: Icon(
                                                    Icons.minimize,
                                                    size: 2.h,
                                                    color: greyColor,
                                                  ),
                                                ),
                                                TextWidget(
                                                    text: "  01  ",
                                                    size: 12.sp,
                                                    color: greyColor,
                                                    bold: FontWeight.w600),
                                                Icon(
                                                  Icons.add,
                                                  size: 2.h,
                                                  color: greyColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text:
                                                "Rx Doctor Prescription Required ",
                                            size: 11.sp,
                                            bold: FontWeight.w600,
                                            color: primaryGreenColor,
                                          ),
                                          Icon(
                                            Icons.info_outline,
                                            color: primaryGreenColor,
                                            size: 2.h,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color: greyColor,
                                        size: 2.4.h,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      TextWidget(
                                          text: "Save for later",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                  Container(
                                    height: 2.6.h,
                                    width: 0.4.w,
                                    color: greyColor,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/trash-2-outline.svg",
                                          color: greyColor),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      TextWidget(
                                          text: "Remove",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w600),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SubmitButtonHelper(
                                text: 'My Prescriptions', onTap: () {})),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                            child: SubmitButtonHelper(
                                text: 'Add New Prescription', onTap: () {})),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextWidget(
                          text: "Doesn’t have prescription",
                          size: 11.sp,
                          color: orangeColor,
                          decoration: TextDecoration.underline,
                          bold: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/pricetags-outline.svg"),
                            TextWidget(
                                text: "Best coupon for you",
                                size: 11.sp,
                                color: greyColor,
                                bold: FontWeight.w600),
                          ],
                        ),
                        TextWidget(
                            text: "All coupons",
                            size: 11.sp,
                            color: primaryGreenColor,
                            decoration: TextDecoration.underline,
                            bold: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.6.h),
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
                            height: 1.h,
                          ),
                          TextWidget(
                              text: "Extra ₹95 OFF",
                              size: 12.sp,
                              color: greyColor,
                              bold: FontWeight.w600),
                          SizedBox(
                            height: 1.2.h,
                          ),
                          TextWidget(
                            text: "10% off on minimum purchase of Rs.799",
                            size: 9.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
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
                                decoration: TextDecoration.lineThrough,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextWidget(
                      text: "You may also like",
                      size: 14.sp,
                      bold: FontWeight.bold,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 2.w, right: 2.w, bottom: 1.6.h),
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
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SubmitButtonHelper(
                              text: "+ Add to cart", onTap: () {})
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 2.w, right: 2.w, bottom: 1.6.h, top: 1.6.h),
                        margin: EdgeInsets.only(bottom: 1.h),
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
                                    text: "Total",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600),
                                TextWidget(
                                    text: "₹1098",
                                    size: 16.sp,
                                    color: greyColor,
                                    bold: FontWeight.w800),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            ),
                            SizedBox(
                                width: 40.w,
                                child: SubmitButtonHelper(
                                    text: "Checkout",
                                    onTap: () {
                                      Get.toNamed(Routes.ADD_ADDRESS);
                                    }))
                          ],
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
