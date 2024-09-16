import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/book_time_module/book_time_controller.dart';
import 'package:quickmeds_user/app/routes/app_pages.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class BookTimePage extends GetView<BookTimeController> {
  final BookTimeController bookTimeController = Get.find<BookTimeController>();
  BookTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "1:00 pm - 2:00 pm",
      "2:00 pm - 3:00 pm",
      "3:00 pm - 4:00 pm",
      "4:00 pm - 5:00 pm",
      "5:00 pm - 6:00 pm",
    ];
    List<String> pricing = [
      "₹19",
      "₹20",
      "₹15",
      "₹19",
      "₹19",
    ];
    return GetBuilder(
        init: bookTimeController,
        builder: (logic) {
          return Scaffold(
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
                text: "Cart",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 7.h,
              child: SubmitButtonHelper(
                text: 'Continue',
                onTap: () {
                  
                  Get.toNamed(Routes.CHOOSE_PATIENT);
                },
                color: primaryGreenColor,
              ).marginSymmetric(horizontal: 18),
            ),
            body: ListView(
              children: [
                TextWidget(
                  text: 'Please note',
                  size: 20.sp,
                  bold: FontWeight.w500,
                  color: greyColor,
                ).marginOnly(left: 18, right: 18, top: 14, bottom: 8),
                TextWidget(
                  text:
                      'Overnight fasting (8-12 hrs) is required. Do not eat ordrink anything exept water before..',
                  size: 16,
                  bold: FontWeight.normal,
                  color: greyColor,
                ).marginSymmetric(horizontal: 18),
                Container(
                  height: 8,
                  color: Colors.grey.shade200,
                ).marginOnly(top: 25, bottom: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (context) {
                      return Container(
                        width: 137,
                        height: 58,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: greyColor)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Today',
                              size: 18,
                              bold: FontWeight.normal,
                              color: greyColor,
                            ),
                            TextWidget(
                              text: '5 Slots',
                              size: 16,
                              bold: FontWeight.normal,
                              color: greyColor,
                            ),
                          ],
                        ),
                      ).marginOnly(right: 8);
                    }),
                  ).marginOnly(left: 18),
                ),
                Container(
                  height: 8,
                  color: Colors.grey.shade200,
                ).marginOnly(top: 10, bottom: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    bool isSelected =
                        bookTimeController.selectedIndex.value == index;
                    return ListTile(
                        onTap: () {
                          bookTimeController.selectTile(index);
                        },
                        leading: const Icon(Icons.circle),
                        title: TextWidget(
                          text: names[index],
                          size: 18,
                          bold: FontWeight.w500,
                          color: isSelected ? Colors.black : greyColor,
                        ),
                        trailing: TextWidget(
                          text: pricing[index],
                          size: 18,
                          bold: FontWeight.normal,
                          color: isSelected ? Colors.black : greyColor,
                        ),
                        shape: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300, // Line color
                            width: 1.0, // Line thickness
                          ),
                        ));
                  },
                ).marginSymmetric(horizontal: 10),
              ],
            ),
          );
        });
  }
}
