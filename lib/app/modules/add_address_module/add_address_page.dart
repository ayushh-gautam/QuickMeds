import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/modules/add_address_module/add_address_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class AddAddressPage extends GetView<AddAddressController> {
  final AddAddressController addAddressController =
      Get.find<AddAddressController>();

  AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: addAddressController,
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
                  text: "Enter address",
                  size: 14.sp,
                  bold: FontWeight.bold,
                  color: greyColor,
                ),
              ),
              backgroundColor: appBgColor,
              body: Padding(
                padding: EdgeInsets.only(
                    left: 4.w, right: 4.w, top: 2.h, bottom: 2.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Full name (Required)*",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller: addAddressController.fullNameController,
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
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Phone number (Required)*",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller:
                              addAddressController.phoneNumberController,
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
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Zipcode (Required)*",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller: addAddressController.zipCodeController,
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
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Country*",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller: addAddressController.countryController,
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
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                                labelTextFontWeight: FontWeight.w600,
                                hintText: "State (Required)*",
                                fillColor: Colors.white,
                                textAlign: TextAlign.start,
                                textInputFormatter: const [],
                                controller:
                                    addAddressController.stateController,
                                contentPadding: EdgeInsets.only(
                                    top: 2.6.h,
                                    bottom: 2.8.h,
                                    left: 4.w,
                                    right: 4.w),
                                hintTextStyle: TextStyle(
                                  color: textFieldBorder,
                                  fontSize: 11.sp,
                                ),
                                style: TextStyle(
                                    color: blackColor, fontSize: 12.sp),
                                borderRadius: 4.h,
                                cursorColor: HexColor("#BBBBBB"),
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: TextFieldWidget(
                                labelTextFontWeight: FontWeight.w600,
                                hintText: "City (Required)*",
                                fillColor: Colors.white,
                                textAlign: TextAlign.start,
                                textInputFormatter: const [],
                                controller: addAddressController.cityController,
                                contentPadding: EdgeInsets.only(
                                    top: 2.6.h,
                                    bottom: 2.8.h,
                                    left: 4.w,
                                    right: 4.w),
                                hintTextStyle: TextStyle(
                                  color: textFieldBorder,
                                  fontSize: 11.sp,
                                ),
                                style: TextStyle(
                                    color: blackColor, fontSize: 12.sp),
                                borderRadius: 4.h,
                                cursorColor: HexColor("#BBBBBB"),
                                textInputType: TextInputType.name,
                                textInputAction: TextInputAction.next),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFieldWidget(
                          labelTextFontWeight: FontWeight.w600,
                          hintText: "Full Address*",
                          fillColor: Colors.white,
                          textAlign: TextAlign.start,
                          textInputFormatter: const [],
                          controller:
                              addAddressController.fullAddressController,
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
                          textInputAction: TextInputAction.next),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                          text: "Type of address",
                          size: 12.sp,
                          color: greyColor,
                          bold: FontWeight.w600),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 6.h,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            bool isSelected =
                                addAddressController.selectedCategory == index;
                            return GestureDetector(
                              onTap: () {
                                addAddressController.selectedCategory = index;
                                addAddressController.update();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 1.6.h),
                                margin: EdgeInsets.only(right: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.2.h),
                                  color: isSelected
                                      ? primaryGreenColor
                                      : Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      index == 0
                                          ? "assets/images/homeCart.svg"
                                          : index == 1
                                              ? "assets/images/apart.svg"
                                              : "assets/images/briefcase.svg",
                                      height: 2.h,
                                      color:
                                          isSelected ? Colors.white : greyColor,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    TextWidget(
                                      text: index == 0
                                          ? "Home"
                                          : index == 1
                                              ? "Apartments"
                                              : "Work",
                                      size: 12.sp,
                                      color:
                                          isSelected ? Colors.white : greyColor,
                                      bold: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Set this as default address?",
                        size: 12.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.6.h,
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
                            groupValue: addAddressController.isDefault,
                            onChanged: (value) {
                              addAddressController.setDefault(value as int);
                              addAddressController.update();
                            },
                          ),
                          TextWidget(
                            text: "Yes",
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
                            groupValue: addAddressController.isDefault,
                            onChanged: (value) {
                              addAddressController.setDefault(value as int);
                              addAddressController.update();
                            },
                          ),
                          TextWidget(
                            text: "No",
                            size: 12.sp,
                            color: greyColor,
                            bold: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Obx(() {
                        if (addAddressController.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: primaryGreenColor,
                            ),
                          );
                        } else {
                          return SubmitButtonHelper(
                              text: "Next",
                              onTap: () {
                                String name = addAddressController
                                    .fullNameController.text;
                                String phone = addAddressController
                                    .phoneNumberController.text;
                                String zip =
                                    addAddressController.zipCodeController.text;
                                String state =
                                    addAddressController.stateController.text;
                                String city =
                                    addAddressController.cityController.text;
                                String address = addAddressController
                                    .fullAddressController.text;
                                String country =
                                    addAddressController.countryController.text;

                                Map<String, dynamic> body = {
                                  "name": name,
                                  "type":
                                      addAddressController.selectedCategory == 0
                                          ? "Home"
                                          : addAddressController
                                                      .selectedCategory ==
                                                  1
                                              ? "Apartments"
                                              : "Work",
                                  "street": address,
                                  "city": city,
                                  "state": state,
                                  "country": country,
                                  "phone": phone,
                                  "zip": zip,
                                  "isDefault": true
                                };
                                addAddressController
                                    .addAddress(body)
                                    .whenComplete(() {
                                  if (addAddressController
                                      .addressAddedSuccess.isTrue) {
                                    Get.toNamed(Routes.CART_CHECKOUT);
                                  }
                                });
                                Get.toNamed(Routes.CART_CHECKOUT);
                              });
                        }
                      })
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
