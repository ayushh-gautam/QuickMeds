import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/my_health_screen_module/my_health_screen_controller.dart';
/**
 * 
 * */

class MyHealthScreenPage extends GetView<MyHealthScreenController> {
  final MyHealthScreenController myHealthScreenController =
      Get.find<MyHealthScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: myHealthScreenController,
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
                text: "My health",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: ListView(
                  children: [
                    Image(
                      image: AssetImage("assets/images/myHealth.png"),
                      height: 34.h,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30.w,
                            height: 18.h,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/prescriptionHealth.png"),
                                  height: 14.h,
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
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.MEDICINE_LIST);
                            },
                            child: SizedBox(
                              width: 30.w,
                              height: 18.h,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/medicines.png"),
                                    height: 14.h,
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
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 30.w,
                            height: 18.h,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/lTest.png"),
                                  height: 14.h,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Image(
                      image: AssetImage("assets/images/healthFooter.png"),
                      height: 18.h,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
