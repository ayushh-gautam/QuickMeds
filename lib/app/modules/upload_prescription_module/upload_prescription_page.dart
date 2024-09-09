import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/upload_prescription_module/upload_prescription_controller.dart';

class UploadPrescriptionPage extends GetView<UploadPrescriptionController> {
  final UploadPrescriptionController uploadPrescriptionController =
      Get.put<UploadPrescriptionController>(UploadPrescriptionController());

  UploadPrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: uploadPrescriptionController,
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  child: ListView(
                    children: [
                      TextWidget(
                        text: "Have a prescription? Upload here",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.2.h),
                            color: primaryGreenColor),
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
