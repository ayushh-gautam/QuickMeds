import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/hex_color.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/helper_widgets/textfield_widget.dart';
import 'package:quickmeds_user/app/helper_widgets/validators.dart';
import 'package:quickmeds_user/app/modules/choose_patient_module/choose_patient_controller.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class EditPatientPage extends StatefulWidget {
  const EditPatientPage(
      {super.key,
      required this.patientId,
      required this.patientName,
      required this.dateTime});

  final int patientId;
  final String patientName;

  final DateTime dateTime;

  @override
  State<EditPatientPage> createState() => _EditPatientPageState();
}

class _EditPatientPageState extends State<EditPatientPage> {
  @override
  Widget build(BuildContext context) {
    final ChoosePatientController choosePatientController =
        Get.put<ChoosePatientController>(ChoosePatientController());
    return Scaffold(
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
            text: "Edit patient detail",
            size: 14.sp,
            bold: FontWeight.bold,
            color: greyColor,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: SubmitButtonHelper(
              text: 'Update Patient',
              onTap: () {
                choosePatientController.iseditPatientTapped(true);
                choosePatientController.updatePatient(widget.patientId);
              }),
        ).marginSymmetric(horizontal: 18, vertical: 20),
        body: Form(
          autovalidateMode:
              choosePatientController.iseditPatientTapped == RxBool(true)
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
          key: choosePatientController.editPatientKey,
          child: Padding(
            padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
            child: ListView(
              children: [
                TextWidget(
                  text: "Patient’s name*",
                  size: 12.sp,
                  color: greyColor,
                  bold: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.4.h,
                ),
                TextFieldWidget(
                    labelTextFontWeight: FontWeight.w600,
                    hintText: widget.patientName,
                    fillColor: Colors.white,
                    textAlign: TextAlign.start,
                    textInputFormatter: const [],
                    validatorText: (e) => Validators().validateName(e),
                    controller: choosePatientController.patientNameController,
                    borderColor: HexColor("#90A4AE"),
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
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  text: 'Date of Birth',
                  size: 12.sp,
                  color: greyColor,
                  bold: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.4.h,
                ),
                TextFieldWidget(
                    labelTextFontWeight: FontWeight.w600,
                    hintText:
                        widget.dateTime.toIso8601String().split('T').first,
                    fillColor: Colors.white,
                    textAlign: TextAlign.start,
                    textInputFormatter: const [],
                    validatorText: (e) => Validators().birthDayField(e),
                    controller: choosePatientController.dobController,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                              choosePatientController.dobController.text =
                                  formattedDate;
                            }
                          },
                          child: Icon(CupertinoIcons.calendar)),
                    ),
                    borderColor: HexColor("#90A4AE"),
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
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  text: "Gender*",
                  size: 12.sp,
                  color: greyColor,
                  bold: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.4.h,
                ),
                SizedBox(
                  height: 6.h,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final gender = index == 0
                          ? "Male"
                          : index == 1
                              ? "Female"
                              : "Other";
                      return GestureDetector(onTap: () {
                        choosePatientController.selectedGender.value = gender;
                      }, child: Obx(() {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 0.2.h),
                          margin: EdgeInsets.only(right: 4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.2.h),
                            border: Border.all(color: greyColor),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: gender,
                              size: 12.sp,
                              color: choosePatientController
                                          .selectedGender.value ==
                                      gender
                                  ? Colors.orange
                                  : greyColor,
                              bold: FontWeight.w600,
                            ),
                          ),
                        );
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
