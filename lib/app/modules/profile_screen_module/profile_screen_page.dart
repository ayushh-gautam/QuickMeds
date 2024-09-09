import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/profile_screen_module/profile_screen_controller.dart';

class ProfileScreenPage extends GetView<ProfileScreenController> {
  final ProfileScreenController profileScreenController =
      Get.find<ProfileScreenController>();

  ProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
      init: profileScreenController,
      initState: (_) {},
      builder: (_) {
        return Obx(
          () {
            final profileDetails =
                profileScreenController.getProfileDetailsModel;
            if (profileScreenController.isLoading.isTrue) {
              // Display a loading indicator while data is being fetched
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Profile'),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (profileDetails.user == null) {
              // Handle case where profileDetails is null
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Profile'),
                ),
                body: const Center(
                  child: Text('Failed to load profile details.'),
                ),
              );
            }

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
                    text: "Profile",
                    size: 14.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: Size(double.maxFinite, 22.h),
                    child: Container(
                      height: 22.h,
                      padding: EdgeInsets.only(top: 4.h),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [primaryGreenColor, appBgColor],
                          stops: const [0.6, 0.6],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 7.8.h,
                        backgroundColor: Colors.white,
                        child: profileDetails.user!.avatar != null &&
                                profileDetails.user!.avatar!.isNotEmpty
                            ? CircleAvatar(
                                radius: 8.5.h,
                                backgroundColor: Colors.grey.withOpacity(0.20),
                                backgroundImage: NetworkImage(
                                    '${MyApi.baseUrl}${profileDetails.user!.avatar}'),
                                onBackgroundImageError:
                                    (exception, stackTrace) {
                                  Get.snackbar(
                                    "Error",
                                    "Failed to load profile picture",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                },
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 18.h,
                                color: primaryGreenColor,
                              ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: appBgColor,
                body: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    child: ListView(
                      children: [
                        // Center(
                        //   child: TextWidget(
                        //     text: "Change Picture",
                        //     size: 12.sp,
                        //     bold: FontWeight.w600,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextWidget(
                          text: "Username",
                          size: 12.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFieldWidget(
                            readonly: true,
                            labelTextFontWeight: FontWeight.w600,
                            hintText: profileDetails.user!.name!,
                            fillColor: Colors.white,
                            textAlign: TextAlign.start,
                            controller: TextEditingController(),
                            contentPadding: EdgeInsets.only(
                                top: 2.6.h,
                                bottom: 2.8.h,
                                left: 4.w,
                                right: 4.w),
                            hintTextStyle: TextStyle(
                              color: greyColor,
                              fontSize: 11.sp,
                            ),
                            style:
                                TextStyle(color: blackColor, fontSize: 12.sp),
                            borderRadius: 4.h,
                            cursorColor: HexColor("#BBBBBB"),
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextWidget(
                          text: "Phone number",
                          size: 12.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFieldWidget(
                            readonly: true,
                            labelTextFontWeight: FontWeight.w600,
                            hintText:
                                "${profileDetails.user!.countryCode!} ${profileDetails.user!.phone!}",
                            fillColor: Colors.white,
                            textAlign: TextAlign.start,
                            textInputFormatter: const [],
                            controller: TextEditingController(),
                            contentPadding: EdgeInsets.only(
                                top: 2.6.h,
                                bottom: 2.8.h,
                                left: 4.w,
                                right: 4.w),
                            hintTextStyle: TextStyle(
                              color: greyColor,
                              fontSize: 11.sp,
                            ),
                            style:
                                TextStyle(color: blackColor, fontSize: 12.sp),
                            borderRadius: 4.h,
                            cursorColor: HexColor("#BBBBBB"),
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextWidget(
                          text: "Email",
                          size: 12.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFieldWidget(
                            readonly: true,
                            labelTextFontWeight: FontWeight.w600,
                            hintText: profileDetails.user!.email!,
                            fillColor: Colors.white,
                            textAlign: TextAlign.start,
                            textInputFormatter: const [],
                            controller: TextEditingController(),
                            contentPadding: EdgeInsets.only(
                                top: 2.6.h,
                                bottom: 2.8.h,
                                left: 4.w,
                                right: 4.w),
                            hintTextStyle: TextStyle(
                              color: greyColor,
                              fontSize: 11.sp,
                            ),
                            style:
                                TextStyle(color: blackColor, fontSize: 12.sp),
                            borderRadius: 4.h,
                            cursorColor: HexColor("#BBBBBB"),
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.next),
                        SizedBox(
                          height: 4.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.EDIT_PROFILE_SCREEN,
                                arguments: profileDetails);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.2.h),
                                border: Border.all(color: primaryGreenColor)),
                            child: Center(
                              child: TextWidget(
                                  text: "Edit profile",
                                  size: 14.sp,
                                  color: primaryGreenColor,
                                  bold: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
