import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quickmeds_user/app/helper_widgets/validators.dart';
import 'package:sizer/sizer.dart';
import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';

import 'edit_profile_screen_controller.dart';

class EditProfileScreenPage extends GetView<EditProfileScreenController> {
  final EditProfileScreenController editProfileScreenController =
      Get.find<EditProfileScreenController>();

  EditProfileScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: editProfileScreenController,
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
                    child: GestureDetector(
                      onTap: () {
                        _showImagePickerDialog(context: context);
                      },
                      child: CircleAvatar(
                        radius: 7.8.h,
                        backgroundColor: Colors.white,
                        child: editProfileScreenController.localPicked.isTrue
                            ? CircleAvatar(
                                radius: 8.5.h,
                                backgroundColor: Colors.grey.withOpacity(0.20),
                                backgroundImage: FileImage(
                                  File(editProfileScreenController
                                      .localImagePath),
                                ),
                              )
                            : editProfileScreenController.getProfileDetailsModel
                                            .user!.avatar !=
                                        null &&
                                    editProfileScreenController
                                        .getProfileDetailsModel
                                        .user!
                                        .avatar!
                                        .isNotEmpty
                                ? CircleAvatar(
                                    radius: 8.5.h,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.20),
                                    backgroundImage: NetworkImage(
                                        '${MyApi.baseUrl}${editProfileScreenController.getProfileDetailsModel.user!.avatar}'),
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
                  )),
            ),
            backgroundColor: appBgColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              child: ListView(
                children: [
                  Center(
                    child: TextWidget(
                      text: "Change Picture",
                      size: 12.sp,
                      bold: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
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
                    labelTextFontWeight: FontWeight.w600,
                    hintText: "Enter your Username",
                    fillColor: Colors.white,
                    textAlign: TextAlign.start,
                    validatorText: (value) =>
                        Validators().validateFirstName(value),
                    controller:
                        editProfileScreenController.userNameTextController,
                    contentPadding: EdgeInsets.only(
                        top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                    hintTextStyle: TextStyle(
                      color: greyColor,
                      fontSize: 11.sp,
                    ),
                    style: TextStyle(color: blackColor, fontSize: 12.sp),
                    borderRadius: 4.h,
                    cursorColor: HexColor("#BBBBBB"),
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
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
                      labelTextFontWeight: FontWeight.w600,
                      hintText: "Enter your Phone number",
                      fillColor: Colors.white,
                      textAlign: TextAlign.start,
                      textInputFormatter: const [],
                      validatorText: (value) =>
                          Validators().validatePhone(value),
                      controller:
                          editProfileScreenController.phoneTextController,
                      contentPadding: EdgeInsets.only(
                          top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                      hintTextStyle: TextStyle(
                        color: greyColor,
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
                    text: "Email",
                    size: 12.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFieldWidget(
                      labelTextFontWeight: FontWeight.w600,
                      hintText: "Enter your Email",
                      fillColor: Colors.white,
                      textAlign: TextAlign.start,
                      textInputFormatter: const [],
                      validatorText: (value) =>
                          Validators().validateEmailForm(value),
                      controller:
                          editProfileScreenController.emailTextController,
                      contentPadding: EdgeInsets.only(
                          top: 2.6.h, bottom: 2.8.h, left: 4.w, right: 4.w),
                      hintTextStyle: TextStyle(
                        color: greyColor,
                        fontSize: 11.sp,
                      ),
                      style: TextStyle(color: blackColor, fontSize: 12.sp),
                      borderRadius: 4.h,
                      cursorColor: HexColor("#BBBBBB"),
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(() {
                    if (editProfileScreenController.isLoading.isTrue) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: primaryGreenColor,
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          editProfileScreenController.localPicked.isTrue
                              ? await editProfileScreenController.uploadFile()
                              : null;
                          Map<String, dynamic> body = {
                            "name": editProfileScreenController
                                .userNameTextController.text,
                            "avatar": editProfileScreenController.imageUrl,
                            "countryCode": "+91",
                            "phone": editProfileScreenController
                                .phoneTextController.text,
                            "email": editProfileScreenController
                                .emailTextController.text,
                          };
                          editProfileScreenController.editProfileDetails(body);
                          
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.2.h),
                              border: Border.all(color: primaryGreenColor)),
                          child: Center(
                            child: TextWidget(
                                text: "Save",
                                size: 14.sp,
                                color: primaryGreenColor,
                                bold: FontWeight.w600),
                          ),
                        ),
                      );
                    }
                  }),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // !-----------------Image Picker Dialog-------------------

  Future<void> _showImagePickerDialog({
    required BuildContext context,
  }) async {
    Size mySize = MediaQuery.sizeOf(context);
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 40,
              left: 8,
              right: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    CupertinoIcons.clear_circled_solid,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: mySize.height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: primaryGreenColor,
                            size: 32,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            PermissionStatus status =
                                await Permission.camera.request();
                            if (status.isDenied) {
                              Fluttertoast.showToast(
                                msg: 'Permission denied',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                              );
                              return;
                            } else {
                              final ImagePicker picker = ImagePicker();

                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (image != null && image.path.isNotEmpty) {
                                editProfileScreenController.localPicked =
                                    true.obs;
                                editProfileScreenController.localImagePath =
                                    image.path;
                                editProfileScreenController.update();
                              }
                            }
                          },
                        ),
                        const Text(
                          'Camera',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: mySize.height / 10,
                      width: 1,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.photo,
                            color: primaryGreenColor,
                            size: 32,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            bool isPermissionGranted =
                                await Permission.storage.request().isGranted;
                            if (isPermissionGranted) {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.image,
                                allowMultiple: false,
                              );
                              if (result != null && result.files.isNotEmpty) {
                                editProfileScreenController.localPicked =
                                    true.obs;
                                editProfileScreenController.localImagePath =
                                    result.files.first.path.toString();
                                editProfileScreenController.update();
                              }
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Permission denied',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                              );
                              return;
                            }
                          },
                        ),
                        const Text(
                          'Gallery',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
