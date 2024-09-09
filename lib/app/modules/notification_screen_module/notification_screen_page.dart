import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/notification_screen_module/notification_screen_controller.dart';

class NotificationScreenPage extends GetView<NotificationScreenController> {
  final NotificationScreenController notificationScreenController =
      Get.find<NotificationScreenController>();

  NotificationScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: notificationScreenController,
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
                text: "Notifications",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 4.w, right: 2.w, bottom: 1.6.h, top: 1.8.h),
                    margin: EdgeInsets.only(bottom: 0.4.h),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/noti.svg"),
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
                            TextWidget(
                                text: "New Account created",
                                size: 12.sp,
                                color: HexColor("#1A1F36"),
                                bold: FontWeight.w600),
                            SizedBox(
                              height: 1.6.h,
                            ),
                            TextWidget(
                              text: "Last Wednesday at 9:42 AM",
                              size: 9.sp,
                              bold: FontWeight.w500,
                              color: greyColor,
                            ),
                            SizedBox(
                              height: 0.6.h,
                            ),
                          ],
                        )
                      ],
                    ),
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
