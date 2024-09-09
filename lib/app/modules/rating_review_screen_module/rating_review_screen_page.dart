import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/validators.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/rating_review_screen_module/rating_review_screen_controller.dart';

class RatingReviewScreenPage extends GetView<RatingReviewScreenController> {
  final RatingReviewScreenController ratingReviewScreenController =
      Get.find<RatingReviewScreenController>();

  RatingReviewScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ratingReviewScreenController,
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
                    color: primaryGreenColor,
                    size: 2.4.h,
                  ),
                ),
              ),
              title: TextWidget(
                text: "Rating & review",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Form(
              autovalidateMode: ratingReviewScreenController.isLoading.isTrue
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              key: ratingReviewScreenController.ratingKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    TextWidget(
                      text: "Rating:",
                      size: 12.sp,
                      bold: FontWeight.w500,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    RatingBar.builder(
                      updateOnDrag: true,
                      itemSize: 4.h,
                      initialRating: 0,
                      minRating: 0,
                      unratedColor: greyColor.withOpacity(0.60),
                      direction: Axis.horizontal,
                      itemCount: 5,
                      allowHalfRating: false,
                      itemBuilder: (BuildContext context, intt) =>
                          // ratingReviewScreenController.rating==0?
                          // SvgPicture.asset("assets/images/star.svg",color: primaryGreenColor,height: 2.h,):
                          Icon(
                        Icons.star,
                        size: 2.h,
                        color: primaryGreenColor,
                      ),
                      onRatingUpdate: (rating) {
                        ratingReviewScreenController.rating = rating;
                        print(
                            "rating::::${ratingReviewScreenController.rating}");
                        ratingReviewScreenController.update();
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Title",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        validatorText: (value) {
                          if (value!.isEmpty) {
                            return "Enter title";
                          }
                          return null;
                        },
                        controller:
                            ratingReviewScreenController.titleController,
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
                      height: 1.8.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Review:",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        minLines: 1,
                        maxLines: 8,
                        textInputFormatter: const [],
                        validatorText: (value) {
                          if (value!.isEmpty) {
                            return "Enter review";
                          }
                          return null;
                        },
                        controller:
                            ratingReviewScreenController.reviewController,
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
                      height: 1.8.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Username",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        validatorText: (value) {
                          if (value!.isEmpty) {
                            return "Enter username";
                          }
                          return null;
                        },
                        controller:
                            ratingReviewScreenController.userNameController,
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
                        textInputAction: TextInputAction.done),
                    SizedBox(
                      height: 1.8.h,
                    ),
                    TextFieldWidget(
                        labelTextFontWeight: FontWeight.w600,
                        hintText: "Email",
                        fillColor: Colors.white,
                        textAlign: TextAlign.start,
                        textInputFormatter: const [],
                        validatorText: (value) =>
                            Validators().validateEmailForm(value),
                        controller:
                            ratingReviewScreenController.emailController,
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
                        textInputAction: TextInputAction.done),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    TextWidget(
                      text: "Do you Recommend this to others?",
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
                          groupValue: ratingReviewScreenController
                              .selectedRecommendation,
                          onChanged: (value) {
                            ratingReviewScreenController
                                .setSelectedRecommendation(value as int);
                            ratingReviewScreenController.update();
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
                          groupValue: ratingReviewScreenController
                              .selectedRecommendation,
                          onChanged: (value) {
                            ratingReviewScreenController
                                .setSelectedRecommendation(value as int);
                            ratingReviewScreenController.update();
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
                    Obx(() {
                      if (ratingReviewScreenController.isLoading.isTrue) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: primaryGreenColor,
                          ),
                        );
                      } else {
                        return SubmitButtonHelper(
                          text: "Submit",
                          onTap: () {
                            // Define your body map as per your requirements
                            Map<String, dynamic> body = {
                              "productId": 1,
                              "ipAddress":
                                  ratingReviewScreenController.ipAddress,
                              "rating": ratingReviewScreenController.rating,
                              "title": ratingReviewScreenController
                                  .titleController.text,
                              "review": ratingReviewScreenController
                                  .reviewController.text,
                              "userName": ratingReviewScreenController
                                  .userNameController.text,
                              "email": ratingReviewScreenController
                                  .emailController.text,
                              "recommendOthers": ratingReviewScreenController
                                          .selectedRecommendation ==
                                      0
                                  ? true
                                  : false,
                            };

// Call addReview and handle UI update inside the method
                            ratingReviewScreenController
                                .addReview(body)
                                .whenComplete(() {
                              if (ratingReviewScreenController
                                  .reviewSuccessFullyGiven.isTrue) {
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
                                            "assets/images/popup.png"),
                                        height: 40.h,
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
                              ratingReviewScreenController.update();
                            });
                          },
                          color: ratingReviewScreenController.rating == 0
                              ? primaryGreenColor.withOpacity(0.30)
                              : primaryGreenColor,
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
