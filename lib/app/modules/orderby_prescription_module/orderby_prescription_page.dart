import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/orderby_prescription_module/orderby_prescription_controller.dart';

class OrderbyPrescriptionPage extends GetView<OrderbyPrescriptionController> {
  final OrderbyPrescriptionController orderbyPrescriptionController =
      Get.find<OrderbyPrescriptionController>();

  OrderbyPrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderbyPrescriptionController,
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
                    text: "Upload prescription ",
                    size: 14.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  centerTitle: true,
                ),
                backgroundColor: appBgColor,
                body: Padding(
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 2.h, bottom: 1.h),
                  child: ListView(
                    children: [
                      TextWidget(
                        text: "Have a prescription? Upload here",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.2.h),
                            color: primaryGreenColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  orderbyPrescriptionController
                                      .selectImgFromCamera();
                                  print(
                                      "orderpre::::${orderbyPrescriptionController.imageFileList?.length}");
                                  orderbyPrescriptionController.update();
                                },
                                child: SvgPicture.asset(
                                    "assets/images/cameraImg.svg")),
                            Container(
                              height: 7.h,
                              width: 0.4.w,
                              color: Colors.white,
                            ),
                            GestureDetector(
                                onTap: () {
                                  orderbyPrescriptionController.selectImages();
                                  print(
                                      "orderpre::::${orderbyPrescriptionController.imageFileList?.length}");
                                  orderbyPrescriptionController.update();
                                },
                                child: SvgPicture.asset(
                                    "assets/images/galleryImg.svg")),
                            Container(
                              height: 7.h,
                              width: 0.4.w,
                              color: Colors.white,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.MY_PRESCRIPTION);
                                },
                                child: SvgPicture.asset(
                                    "assets/images/presImg.svg")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      orderbyPrescriptionController.imageFileList!.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                TextWidget(
                                  text: "Attached prescriptions",
                                  size: 14.sp,
                                  bold: FontWeight.w700,
                                  color: greyColor,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: orderbyPrescriptionController
                                      .imageFileList!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 0.24.w,
                                          mainAxisSpacing: 0.4.h,
                                          crossAxisCount: 3,
                                          childAspectRatio: 0.7),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 1.6.h,
                                            ),
                                            Container(
                                              width: 30.w,
                                              height: 18.h,
                                              margin:
                                                  EdgeInsets.only(right: 3.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  image: FileImage(File(
                                                      orderbyPrescriptionController
                                                          .imageFileList![index]
                                                          .path)),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: -1,
                                          right: 0.1.h,
                                          child: GestureDetector(
                                            onTap: () {
                                              orderbyPrescriptionController
                                                  .imageFileList!
                                                  .removeAt(index);
                                              orderbyPrescriptionController
                                                  .update();
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: orangeColor,
                                              size: 2.8.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                              ],
                            ),
                      const Image(
                          image: AssetImage("assets/images/detailImg.png")),
                      orderbyPrescriptionController.imageFileList!.isEmpty
                          ? SizedBox(
                              height: 30.h,
                            )
                          : SizedBox(
                              height: 8.h,
                            ),
                      SubmitButtonHelper(
                        text: "Continue →",
                        onTap: () {
                          Get.toNamed(Routes.CONFIRM_ORDER);
                        },
                        color:
                            orderbyPrescriptionController.imageFileList!.isEmpty
                                ? primaryGreenColor.withOpacity(0.40)
                                : primaryGreenColor,
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
