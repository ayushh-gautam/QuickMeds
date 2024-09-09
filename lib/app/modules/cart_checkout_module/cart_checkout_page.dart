import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/cart_checkout_module/cart_checkout_controller.dart';
/**
 * 
 * */

class CartCheckoutPage extends GetView<CartCheckoutController> {
  final CartCheckoutController cartCheckoutController =
      Get.find<CartCheckoutController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: cartCheckoutController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: appBgColor,
                leadingWidth: 20.w,
                centerTitle: true,
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
                  text: "Enter address",
                  size: 14.sp,
                  bold: FontWeight.bold,
                  color: greyColor,
                ),
              ),
              backgroundColor: appBgColor,
              body: Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.4.h),
                        margin: EdgeInsets.only(left: 4.w, right: 4.w),
                        decoration: BoxDecoration(
                            color: HexColor("15A9A0").withOpacity(0.20),
                            borderRadius: BorderRadius.circular(3.w)),
                        child: Row(
                          children: [
                            TextWidget(
                                text: "Extra ₹95 OFF",
                                size: 14.sp,
                                color: greyColor,
                                bold: FontWeight.w800),
                            SizedBox(
                              width: 6.w,
                            ),
                            TextWidget(
                                text: "Shirt10",
                                size: 10.sp,
                                color: greyColor,
                                bold: FontWeight.w800),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                left: 2.w, right: 2.w, bottom: 1.h),
                            margin: EdgeInsets.only(
                                left: 4.w, right: 4.w, bottom: 1.h),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              text:
                                                  "Quantity: 1  Variant: 500mg",
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
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.2.h),
                                border: Border.all(color: primaryGreenColor)),
                            child: Center(
                              child: TextWidget(
                                  text: "2+ more products",
                                  size: 14.sp,
                                  color: primaryGreenColor,
                                  bold: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(
                        thickness: 0.28.h,
                        color: dotColor,
                        height: 0.1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.4.h),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            TextWidget(
                                text: "Bill summary",
                                size: 14.sp,
                                color: greyColor,
                                bold: FontWeight.w800),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: "Cart MRP",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                                TextWidget(
                                    text: "₹4398",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: "Other services",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                                TextWidget(
                                    text: "₹19",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: "Total discount",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                                TextWidget(
                                    text: "-₹2201",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Divider(
                              thickness: 0.18.h,
                              color: greyColor.withOpacity(0.20),
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: "To be paid",
                                    size: 14.sp,
                                    color: greyColor,
                                    bold: FontWeight.w800),
                                TextWidget(
                                    text: "₹2216",
                                    size: 14.sp,
                                    color: greyColor,
                                    bold: FontWeight.w800),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.28.h,
                        color: dotColor,
                        height: 0.1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.4.h),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                    text: "Address",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w800),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 40.w,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.2.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        border: Border.all(
                                            color: primaryGreenColor)),
                                    child: Center(
                                      child: TextWidget(
                                          text: "Add new address",
                                          size: 12.sp,
                                          color: primaryGreenColor,
                                          bold: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Radio(
                                            value: index,
                                            visualDensity:
                                                VisualDensity.compact,
                                            splashRadius: 1.w,
                                            activeColor: primaryGreenColor,
                                            focusColor: Colors.grey,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            hoverColor: Colors.grey,
                                            groupValue: cartCheckoutController
                                                .selectedAddressIndex,
                                            onChanged: (value) {
                                              cartCheckoutController
                                                      .selectedAddressIndex =
                                                  value as int;
                                              cartCheckoutController.update();
                                            },
                                          ),
                                          TextWidget(
                                              text: "Hamza ali",
                                              size: 13.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          TextWidget(
                                              text: "Home",
                                              size: 11.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                        ],
                                      ),
                                      TextWidget(
                                          text:
                                              "Street: C501, Vishal Apt, Behind Vishal Hall, Andheri Kurla Rd, Andheri (e)",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                      TextWidget(
                                          text: "City: Mumbai",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                      TextWidget(
                                          text:
                                              "State/province/area: Maharashtra",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                      TextWidget(
                                          text: "Phone number 02226833712",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                      TextWidget(
                                          text: "Zip code 400069",
                                          size: 12.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.28.h,
                        color: dotColor,
                        height: 0.1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.4.h),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            TextWidget(
                                text: "Pay by",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w800),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/arcticons_bhim.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: "UPI",
                                            size: 12.sp,
                                            color: greyColor,
                                            bold: FontWeight.w800),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        TextWidget(
                                            text: "Pay by any UPI app",
                                            size: 11.sp,
                                            color: greyColor,
                                            bold: FontWeight.w500),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 2.8.h,
                                  color: greyColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                              color: dotColor,
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/solar_card-broken.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text: "Credit / Debit / ATM Card",
                                            size: 12.sp,
                                            color: greyColor,
                                            bold: FontWeight.w800),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        TextWidget(
                                            text: "Credit / Debit / ATM Card",
                                            size: 11.sp,
                                            color: greyColor,
                                            bold: FontWeight.w500),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 2.8.h,
                                  color: greyColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                              color: dotColor,
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/solar_card-broken.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    TextWidget(
                                        text: "Net banking",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w800),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 2.8.h,
                                  color: greyColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                              color: dotColor,
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/solar_card-broken.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    TextWidget(
                                        text: "Wallets",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w800),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 2.8.h,
                                  color: greyColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Divider(
                              thickness: 0.1.h,
                              color: dotColor,
                              height: 0.1.h,
                            ),
                            SizedBox(
                              height: 2.6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/solar_card-broken.svg"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    TextWidget(
                                        text: "Cash on delivery",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w800),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 2.8.h,
                                  color: greyColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: SubmitButtonHelper(
                            text: "Order place",
                            onTap: () {
                              Get.toNamed(Routes.ORDER_PLACED_SCREEN);
                            }),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
