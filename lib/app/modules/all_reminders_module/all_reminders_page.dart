import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../api_collection/api_models/get_medicine_reminder_model.dart';
import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/all_reminders_module/all_reminders_controller.dart';

class AllRemindersPage extends GetView<AllRemindersController> {
  final AllRemindersController allRemindersController =
      Get.find<AllRemindersController>();

  AllRemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllRemindersController>(
      init: allRemindersController,
      initState: (state) {},
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
                text: "All reminders",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
            ),
            backgroundColor: appBgColor,
            body: Obx(() {
              GetMedicineReminderModel getMedicineReminderModel =
                  allRemindersController.getMedicineReminderModel;

              if (allRemindersController.isGetLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (getMedicineReminderModel.medicineReminders == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   'assets/images/empty.svg',
                      //   width: 50.w,
                      //   height: 50.h,
                      // ),
                      TextWidget(
                        text: "Failed to load remainders",
                        size: 14.sp,
                        color: Colors.black,
                        bold: FontWeight.bold,
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: getMedicineReminderModel.medicineReminders!.isEmpty
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SvgPicture.asset(
                          //   'assets/images/empty.svg',
                          //   width: 50.w,
                          //   height: 50.h,
                          // ),
                          TextWidget(
                            text: "No remainders added",
                            size: 14.sp,
                            color: Colors.black,
                            bold: FontWeight.bold,
                          ),
                        ],
                      ))
                    : ListView.builder(
                        itemCount:
                            getMedicineReminderModel.medicineReminders!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: primaryGreenColor,
                                borderRadius: BorderRadius.circular(4.w)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            margin: EdgeInsets.only(bottom: 1.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/capsule.svg",
                                          height: 4.h,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                                text: getMedicineReminderModel
                                                    .medicineReminders![index]
                                                    .medicineName!,
                                                size: 14.sp,
                                                color: Colors.white,
                                                bold: FontWeight.w600),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              children: [
                                                TextWidget(
                                                    // text: "1 Tablet - ",
                                                    text:
                                                        "${getMedicineReminderModel.medicineReminders![index].value!} ${getMedicineReminderModel.medicineReminders![index].type!} - ",
                                                    size: 11.sp,
                                                    color: Colors.white,
                                                    bold: FontWeight.w600),
                                                SvgPicture.asset(
                                                  "assets/images/clock.svg",
                                                  height: 2.h,
                                                ),
                                                TextWidget(
                                                    text:
                                                        " ${getMedicineReminderModel.medicineReminders![index].time!}",
                                                    size: 11.sp,
                                                    color: Colors.white,
                                                    bold: FontWeight.w600),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Divider(
                                  thickness: 0.2.h,
                                  color: Colors.white,
                                  height: 0.1.h,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.EDIT_MEDICINE_REMINDER,
                                            arguments: getMedicineReminderModel
                                                .medicineReminders![index]);
                                      },
                                      child: TextWidget(
                                          text: "Edit",
                                          size: 11.sp,
                                          color: Colors.white,
                                          bold: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Obx(() {
                                      if (allRemindersController
                                          .isPostLoading.isTrue) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        return GestureDetector(
                                          onTap: () {
                                            allRemindersController
                                                .deleteMedicineReminder(
                                                    getMedicineReminderModel
                                                        .medicineReminders![
                                                            index]
                                                        .id!
                                                        .toString())
                                                .whenComplete(() {
                                              if (allRemindersController
                                                  .isDeleteSuccess.isTrue) {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w),
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.h),
                                                      ),
                                                      content: Image(
                                                        image: const AssetImage(
                                                            "assets/images/reminderDelete.png"),
                                                        height: 40.h,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) {
                                                  // Use Get.back() outside of the showDialog callback
                                                  Get.back();
                                                  Get.back();
                                                  allRemindersController
                                                      .update();
                                                  Get.find<
                                                          AllRemindersController>()
                                                      .getMedicineReminder();
                                                });
                                                allRemindersController.update();
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h, horizontal: 4.w),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(1.h)),
                                            child: TextWidget(
                                                text: "Delete",
                                                size: 11.sp,
                                                color: orangeColor,
                                                bold: FontWeight.w600),
                                          ),
                                        );
                                      }
                                    }),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
              );
            }),
          ),
        );
      },
    );
  }
}
