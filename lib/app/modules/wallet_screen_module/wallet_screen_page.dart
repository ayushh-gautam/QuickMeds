import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/hex_color.dart';
import 'package:quickmeds_user/app/modules/add_payment_module/add_payment_page.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/wallet_screen_module/wallet_screen_controller.dart';

class WalletScreenPage extends GetView<WalletScreenController> {
  final WalletScreenController walletScreenController =
      Get.find<WalletScreenController>();

  WalletScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: walletScreenController,
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
                text: "Wallet",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: ListView(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Stack(children: [
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 12.h),
                      decoration: BoxDecoration(color: primaryGreenColor),
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.h, left: 4.w, right: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              TextWidget(
                                  text: "Recent transaction",
                                  size: 13.sp,
                                  color: Colors.white,
                                  bold: FontWeight.w500),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 44.h,
                                child: ListView.builder(
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.h),
                                          color: Colors.white),
                                      margin: EdgeInsets.only(bottom: 1.4.h),
                                      padding: EdgeInsets.only(
                                          left: 4.w,
                                          right: 4.w,
                                          top: 1.h,
                                          bottom: 1.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 3.h,
                                                backgroundColor: greyColor,
                                                child: TextWidget(
                                                    text: "D",
                                                    size: 13.sp,
                                                    color: Colors.white,
                                                    bold: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                      text: "Digi labs",
                                                      size: 13.sp,
                                                      color: greyColor,
                                                      bold: FontWeight.w500),
                                                  SizedBox(
                                                    height: 0.2.h,
                                                  ),
                                                  TextWidget(
                                                      text: "Jan 8 , 2024",
                                                      size: 11.sp,
                                                      color:
                                                          HexColor("#7B78AA"),
                                                      bold: FontWeight.w500),
                                                ],
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.2.h,
                                                horizontal: 4.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2.h),
                                                border: Border.all(
                                                    color: greyColor)),
                                            child: Center(
                                              child: TextWidget(
                                                  text: "- ₹1,000",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const AddPaymentPage());
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.8.h),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                    child: TextWidget(
                                        text: "+ Add money",
                                        size: 14.sp,
                                        color: Colors.white,
                                        bold: FontWeight.w400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.8.h,
                              ),
                            ],
                          ))),
                  SizedBox(
                    width: double.infinity,
                    child: CircleAvatar(
                      radius: 11.2.h,
                      backgroundColor: appBgColor,
                      child: CircleAvatar(
                          radius: 10.h,
                          backgroundColor: primaryGreenColor,
                          child: CircleAvatar(
                            radius: 8.h,
                            backgroundColor: appBgColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                    text: "₹5,643.50",
                                    size: 16.sp,
                                    color: greyColor,
                                    bold: FontWeight.w900),
                                TextWidget(
                                    text: "Available Balance",
                                    size: 11.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                              ],
                            ),
                          )),
                    ),
                  ),
                ])
              ],
            ),
          ),
        );
      },
    );
  }
}
