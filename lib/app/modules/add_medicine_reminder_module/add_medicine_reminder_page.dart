
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

import 'package:quickmeds_user/app/modules/add_medicine_reminder_module/add_medicine_reminder_controller.dart';

class AddMedicineReminderPage extends GetView<AddMedicineReminderController> {
  final AddMedicineReminderController addMedicineReminderController =
      Get.find<AddMedicineReminderController>();

  AddMedicineReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: addMedicineReminderController,
      builder: (logic) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 14.h,
                bottom: PreferredSize(
                  preferredSize: Size(double.maxFinite, 2.h),
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                    child: TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter medicine name",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller: addMedicineReminderController
                            .medicineNameController,
                        contentPadding: EdgeInsets.only(
                            top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                        hintTextStyle: TextStyle(
                          color: textFieldBorder,
                          fontSize: 11.sp,
                        ),
                        style: TextStyle(color: blackColor, fontSize: 12.sp),
                        borderRadius: 4.h,
                        cursorColor: HexColor("#BBBBBB"),
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.done),
                  ),
                ),
                elevation: 0,
                backgroundColor: appBgColor,
                leadingWidth: 20.w,
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.ALL_REMINDERS);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.6.h, right: 4.w),
                      child: TextWidget(
                        text: "View all reminders",
                        size: 10.sp,
                        bold: FontWeight.w600,
                        color: orangeColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
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
                  text: "Add medicine reminder",
                  size: 14.sp,
                  bold: FontWeight.bold,
                  color: greyColor,
                ),
              ),
              backgroundColor: appBgColor,
              body: Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    TextWidget(
                      text: "Select category",
                      size: 14.sp,
                      bold: FontWeight.w600,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          bool isSelected =
                              addMedicineReminderController.selectedCategory ==
                                  index;

                          return GestureDetector(
                            onTap: () {
                              addMedicineReminderController.selectedCategory =
                                  index;
                              addMedicineReminderController.update();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 1.6.h),
                              margin: EdgeInsets.only(right: 2.2.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.2.h),
                                color: isSelected
                                    ? primaryGreenColor
                                    : Colors.white,
                              ),
                              child: TextWidget(
                                text: addMedicineReminderController
                                    .medicineCategories[index],
                                size: 12.sp,
                                color: isSelected ? Colors.white : greyColor,
                                bold: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount:
                            addMedicineReminderController.typeCategories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          bool isSelected =
                              addMedicineReminderController.selectedType ==
                                  index;
                          return Row(
                            children: [
                              const SizedBox(
                                width: 64,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addMedicineReminderController.selectedType =
                                      index;
                                  addMedicineReminderController.update();
                                },
                                child: TextWidget(
                                  text: addMedicineReminderController
                                      .typeCategories[index],
                                  size: 14.sp,
                                  bold: FontWeight.w600,
                                  color: isSelected
                                      ? primaryGreenColor
                                      : greyColor,
                                ),
                              ),
                              const SizedBox(width: 64),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.8.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Enter here",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        controller:
                            addMedicineReminderController.quantityController,
                        contentPadding: EdgeInsets.only(
                            top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                        hintTextStyle: TextStyle(
                          color: textFieldBorder,
                          fontSize: 11.sp,
                        ),
                        style: TextStyle(color: blackColor, fontSize: 12.sp),
                        borderRadius: 4.h,
                        cursorColor: HexColor("#BBBBBB"),
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 1.6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.2.h),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Schedule",
                            size: 13.sp,
                            color: greyColor,
                            bold: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 2.8.h,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: "Start date",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addMedicineReminderController
                                      .selectDate(context);
                                  addMedicineReminderController.update();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      border: Border.all(color: greyColor)),
                                  child: Center(
                                    child: TextWidget(
                                        text: addMedicineReminderController
                                                .date ??
                                            "MM/DD/YYYY",
                                        size: 12.sp,
                                        color: greyColor,
                                        bold: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.8.h,
                          ),
                          TextWidget(
                            text: "Duration",
                            size: 12.sp,
                            color: greyColor,
                            bold: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 1.2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 0,
                                visualDensity: VisualDensity.compact,
                                splashRadius: 1.w,
                                activeColor: primaryGreenColor,
                                focusColor: Colors.grey,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: Colors.grey,
                                groupValue: addMedicineReminderController
                                    .selectedDuration,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .setSelectedRadio(value as int);
                                  addMedicineReminderController.update();
                                },
                              ),
                              TextWidget(
                                text: "Continuous",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1,
                                visualDensity: VisualDensity.compact,
                                splashRadius: 1.w,
                                activeColor: primaryGreenColor,
                                focusColor: Colors.grey,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: Colors.grey,
                                groupValue: addMedicineReminderController
                                    .selectedDuration,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .setSelectedRadio(value as int);
                                  addMedicineReminderController.update();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: TextWidget(
                                          text: "Select number of days",
                                          size: 14.sp,
                                          bold: FontWeight.w600,
                                          color: greyColor,
                                        ),
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        backgroundColor: Colors.white,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .setSelectedRadio(-1);
                                              Get.back();
                                            },
                                            child: TextWidget(
                                              text: "Cancel",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .update();
                                              Get.back();
                                            },
                                            child: TextWidget(
                                              text: "Set",
                                              size: 12.sp,
                                              color: primaryGreenColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 24.w,
                                        ),
                                        content: StatefulBuilder(
                                            builder: (context, snapshot) {
                                          return NumberPicker(
                                            zeroPad: true,
                                            itemCount: 3,
                                            textStyle: TextStyle(
                                                color:
                                                    greyColor.withOpacity(0.60),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                            selectedTextStyle: TextStyle(
                                                color: primaryGreenColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                            value: addMedicineReminderController
                                                .numberOfDays.value,
                                            minValue: 1,
                                            maxValue: 99,
                                            onChanged: (value) {
                                              addMedicineReminderController
                                                  .numberOfDays.value = value;
                                              snapshot(() {
                                                addMedicineReminderController
                                                    .update();
                                              });
                                              addMedicineReminderController
                                                  .update();
                                            },
                                            infiniteLoop: true,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors
                                                      .teal, // primaryGreenColor equivalent
                                                  width: 1.5,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors
                                                      .teal, // primaryGreenColor equivalent
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                  addMedicineReminderController.update();
                                },
                              ),
                              TextWidget(
                                text: "Number of days",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.8.h,
                          ),
                          TextWidget(
                            text: "Days",
                            size: 12.sp,
                            color: greyColor,
                            bold: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 1.2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 0,
                                visualDensity: VisualDensity.compact,
                                splashRadius: 1.w,
                                activeColor: primaryGreenColor,
                                focusColor: Colors.grey,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: Colors.grey,
                                groupValue:
                                    addMedicineReminderController.selectedDays,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .setSelectedDays(value as int);
                                  addMedicineReminderController.update();
                                },
                              ),
                              TextWidget(
                                text: "Every day",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1,
                                visualDensity: VisualDensity.compact,
                                splashRadius: 1.w,
                                activeColor: primaryGreenColor,
                                focusColor: Colors.grey,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: Colors.grey,
                                groupValue:
                                    addMedicineReminderController.selectedDays,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .setSelectedDays(value as int);

                                  addMedicineReminderController.update();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: TextWidget(
                                          text: "Pick days",
                                          size: 14.sp,
                                          bold: FontWeight.w600,
                                          color: greyColor,
                                        ),
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        backgroundColor: Colors.white,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .setSelectedDays(-1);
                                              Get.back();
                                            },
                                            child: TextWidget(
                                              text: "Cancel",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .update();
                                              if (addMedicineReminderController
                                                  .days.values
                                                  .every((element) =>
                                                      element == false)) {
                                                addMedicineReminderController
                                                    .setSelectedDays(-1);
                                                Get.back();
                                                return;
                                              } else {
                                                addMedicineReminderController
                                                    .setSelectedDays(1);
                                                addMedicineReminderController
                                                    .update();
                                                Get.back();
                                              }
                                            },
                                            child: TextWidget(
                                              text: "Set",
                                              size: 12.sp,
                                              color: primaryGreenColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                        ),
                                        content: StatefulBuilder(
                                            builder: (context, setState) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                addMedicineReminderController
                                                    .days.keys
                                                    .map((String day) {
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                value:
                                                    addMedicineReminderController
                                                        .days[day],
                                                onChanged: (bool? value) {
                                                  addMedicineReminderController
                                                      .updateDay(day, value!);

                                                  setState(() {
                                                    addMedicineReminderController
                                                        .update();
                                                  });

                                                  addMedicineReminderController
                                                      .update();
                                                },
                                                checkboxShape:
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                title: Text(
                                                  day,
                                                  style: TextStyle(
                                                    color:
                                                        addMedicineReminderController
                                                                .days[day]!
                                                            ? Colors.teal
                                                            : greyColor,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        addMedicineReminderController
                                                                .days[day]!
                                                            ? FontWeight.w600
                                                            : FontWeight.w500,
                                                  ),
                                                ),
                                                activeColor: Colors.teal,
                                                checkColor: Colors.white,
                                              );
                                            }).toList(),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                },
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: TextWidget(
                                  text: "Specific day",
                                  size: 12.sp,
                                  color: greyColor,
                                  bold: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 2,
                                visualDensity: VisualDensity.compact,
                                splashRadius: 1.w,
                                activeColor: primaryGreenColor,
                                focusColor: Colors.grey,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                hoverColor: Colors.grey,
                                groupValue:
                                    addMedicineReminderController.selectedDays,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .setSelectedDays(value as int);
                                  addMedicineReminderController.update();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: TextWidget(
                                          text: "Every",
                                          size: 14.sp,
                                          bold: FontWeight.w600,
                                          color: greyColor,
                                        ),
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        backgroundColor: Colors.white,
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .setSelectedDays(-1);
                                              Get.back();
                                            },
                                            child: TextWidget(
                                              text: "Cancel",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              addMedicineReminderController
                                                  .update();
                                              Get.back();
                                            },
                                            child: TextWidget(
                                              text: "Set",
                                              size: 12.sp,
                                              color: primaryGreenColor,
                                              bold: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 24.w,
                                        ),
                                        content: StatefulBuilder(
                                            builder: (context, snapshot) {
                                          return NumberPicker(
                                            itemCount: 3,
                                            textStyle: TextStyle(
                                                color:
                                                    greyColor.withOpacity(0.60),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                            selectedTextStyle: TextStyle(
                                                color: primaryGreenColor,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                            textMapper: (numberText) {
                                              return "$numberText days";
                                            },
                                            value: addMedicineReminderController
                                                .remindEvery.value,
                                            infiniteLoop: true,
                                            minValue: 2,
                                            maxValue: 100,
                                            onChanged: (value) {
                                              addMedicineReminderController
                                                  .remindEvery.value = value;
                                              snapshot(() {
                                                addMedicineReminderController
                                                    .update();
                                              });
                                              addMedicineReminderController
                                                  .update();
                                            },
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors
                                                      .teal, // primaryGreenColor equivalent
                                                  width: 1.5,
                                                ),
                                                bottom: BorderSide(
                                                  color: Colors
                                                      .teal, // primaryGreenColor equivalent
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  );
                                },
                              ),
                              TextWidget(
                                text: "Remind every",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.2.h),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextWidget(
                                text: "Set time",
                                size: 13.sp,
                                color: greyColor,
                                bold: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              NumberPicker(
                                itemCount: 2,
                                infiniteLoop: true,
                                textStyle: TextStyle(
                                    color: greyColor.withOpacity(0.60),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                                selectedTextStyle: TextStyle(
                                    color: primaryGreenColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                                textMapper: (numberText) {
                                  return int.parse(numberText) == 0
                                      ? "AM"
                                      : "PM";
                                },
                                value: addMedicineReminderController
                                    .amPmSetter.value,
                                minValue: 0,
                                maxValue: 1,
                                onChanged: (value) {
                                  addMedicineReminderController
                                      .amPmSetter.value = value;
                                  addMedicineReminderController.update();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Container(
                            height: 7.h,
                            margin: EdgeInsets.only(top: 6.h),
                            width: 0.4.w,
                            color: greyColor.withOpacity(0.60),
                          ),
                          NumberPicker(
                            itemCount: 3,
                            textStyle: TextStyle(
                                color: greyColor.withOpacity(0.60),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            selectedTextStyle: TextStyle(
                                color: primaryGreenColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            value:
                                addMedicineReminderController.hourSetter.value,
                            infiniteLoop: true,
                            zeroPad: true,
                            minValue: 0,
                            maxValue: 12,
                            onChanged: (value) {
                              addMedicineReminderController.hourSetter.value =
                                  value;
                              addMedicineReminderController.update();
                            },
                          ),
                          Container(
                            height: 7.h,
                            margin: EdgeInsets.only(top: 6.h),
                            width: 0.4.w,
                            color: greyColor.withOpacity(0.60),
                          ),
                          NumberPicker(
                            itemCount: 3,
                            zeroPad: true,
                            infiniteLoop: true,
                            textStyle: TextStyle(
                                color: greyColor.withOpacity(0.60),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            selectedTextStyle: TextStyle(
                                color: primaryGreenColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            value: addMedicineReminderController
                                .minuteSetter.value,
                            minValue: 0,
                            maxValue: 59,
                            onChanged: (value) {
                              addMedicineReminderController.minuteSetter.value =
                                  value;
                              addMedicineReminderController.update();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox( 
                      height: 3.h,
                    ),
                    Obx(() {
                      if (addMedicineReminderController.isLoading.isTrue) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: primaryGreenColor,
                          ),
                        );
                      } else {
                        return SubmitButtonHelper(
                          text: "Set",
                          onTap: () {
                            String medicineName = addMedicineReminderController
                                .medicineNameController.text;
                            String quantity = addMedicineReminderController
                                .quantityController.text;
                            String type = addMedicineReminderController
                                    .typeCategories[
                                addMedicineReminderController.selectedType == -1
                                    ? 0
                                    : addMedicineReminderController
                                        .selectedType];
                            String selectedCategory =
                                addMedicineReminderController
                                        .medicineCategories[
                                    addMedicineReminderController
                                                .selectedCategory ==
                                            -1
                                        ? 0
                                        : addMedicineReminderController
                                            .selectedCategory];
                            String date = addMedicineReminderController
                                .selectedDate
                                .toString();
                            bool isNotContinous = addMedicineReminderController
                                        .selectedDuration ==
                                    1
                                ? true
                                : false;
                            String specficDays = addMedicineReminderController
                                .days.keys
                                .where((element) =>
                                    addMedicineReminderController
                                        .days[element] ==
                                    true)
                                .join(",");
                            String duration = isNotContinous
                                ? addMedicineReminderController
                                    .numberOfDays.value
                                    .toString()
                                : "Continuous";

                            String days =
                                addMedicineReminderController.selectedDays == 1
                                    ? specficDays
                                    : addMedicineReminderController
                                                .selectedDays ==
                                            2
                                        ? addMedicineReminderController
                                            .remindEvery.value
                                            .toString()
                                        : "Everyday";

                            String minute = addMedicineReminderController
                                .minuteSetter.value
                                .toString();
                            bool isAM = addMedicineReminderController
                                        .amPmSetter.value ==
                                    0
                                ? true
                                : false;
                            int hourValue = isAM
                                ? addMedicineReminderController.hourSetter.value
                                : addMedicineReminderController
                                        .hourSetter.value +
                                    12;
                            String hour = hourValue.toString();
                            String time = "$hour:$minute:00";

                            Map<String, dynamic> body = {
                              "medicineName": medicineName,
                              "category": selectedCategory,
                              "type": type,
                              "value": quantity,
                              "startDate": date,
                              "duration": duration,
                              "days": days,
                              "time": time,
                            };

                            addMedicineReminderController
                                .addMedicineReminder(body)
                                .whenComplete(() {
                              if (addMedicineReminderController
                                  .reminderAddedSuccess.isTrue) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                      content: Image(
                                        image: const AssetImage(
                                            "assets/images/reminderDone.png"),
                                        height: 32.h,
                                      ),
                                    );
                                  },
                                ).then((_) {
                                  Get.back(
                                      closeOverlays:
                                          true); // Close overlays when dialog is dismissed
                                  Get.back(); // Close the screen
                                });
                              }
                              // Ensure the controller updates the UI
                              addMedicineReminderController.update();
                            });
                          },
                          color: primaryGreenColor,
                        );
                      }
                    }),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
