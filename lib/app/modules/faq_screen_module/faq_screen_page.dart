import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/faq_screen_module/faq_screen_controller.dart';

///
///

class FaqScreenPage extends GetView<FaqScreenController> {
  final FaqScreenController faqScreenController =
      Get.find<FaqScreenController>();

  FaqScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: faqScreenController,
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
                text: "FAQ's",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        faqScreenController.expanded[index] =
                            !faqScreenController.expanded[index];
                        faqScreenController.update();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.04), // Shadow color
                                spreadRadius: 0.4.w, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 2), // Changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                        margin: EdgeInsets.only(bottom: 2.h),
                        padding: EdgeInsets.all(2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: TextWidget(
                                    text: "How can i figure out my life:",
                                    size: 13.sp,
                                    bold: FontWeight.w500,
                                    color: greyColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Icon(
                                    faqScreenController.expanded[index]
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: HexColor("D1CACA"),
                                    size: 3.8.h,
                                  ),
                                )
                              ],
                            ),
                            faqScreenController.expanded[index]
                                ? Padding(
                                    padding: EdgeInsets.only(top: 1.h),
                                    child: TextWidget(
                                      text:
                                          "1.Reflect on your values, beliefs, and goals.\n2.Identify your passions and interests.\n3.Evaluate your strengths and weaknesses.\n4.Set achievable, realistic, and meaningful goals.\n5.Seek advice from trusted individuals such as family, friends, or a therapist.",
                                      size: 11.sp,
                                      bold: FontWeight.w400,
                                      color: greyColor,
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        );
      },
    );
  }
}
