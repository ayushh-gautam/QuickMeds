import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/my_prescription_module/my_prescription_controller.dart';
/**
 * 
 * */

class MyPrescriptionPage extends GetView<MyPrescriptionController> {
  final MyPrescriptionController myPrescriptionController =
      Get.find<MyPrescriptionController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: myPrescriptionController,
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
                    text: "My prescriptions",
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
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Uploaded on 24 February,2024",
                            size: 14.sp,
                            bold: FontWeight.bold,
                            color: greyColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Image.asset("assets/images/1.png")
                        ],
                      );
                    },
                  ),
                )),
          );
        });
  }
}
