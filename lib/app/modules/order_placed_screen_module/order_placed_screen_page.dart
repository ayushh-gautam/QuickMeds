import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/order_placed_screen_module/order_placed_screen_controller.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class OrderPlacedScreenPage extends GetView<OrderPlacedScreenController> {
  final OrderPlacedScreenController orderPlacedScreenController =
      Get.find<OrderPlacedScreenController>();

  OrderPlacedScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: orderPlacedScreenController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Order placed.png"))),
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Image(
                            image: const AssetImage(
                              "assets/images/Frame 1171275732.png",
                            ),
                            height: 30.h,
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                              width: 42.w,
                              child: SubmitButtonHelper(
                                  text: "Track order",
                                  onTap: () {
                                    Get.toNamed(Routes.MY_ORDERS_SCREEN);
                                  })),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.TAB_SCREEN);
                            },
                            child: Container(
                              width: 42.w,
                              padding: EdgeInsets.symmetric(vertical: 1.8.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.2.h),
                                  border: Border.all(color: orangeColor)),
                              child: Center(
                                child: TextWidget(
                                    text: "Continue shopping",
                                    size: 11.8.sp,
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
              )),
        );
      },
    );
  }
}
