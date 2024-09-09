import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/api_collection/api_models/get_wishlist_details_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/wishlist_screen_module/wishlist_screen_controller.dart';

class WishlistScreenPage extends GetView<WishlistScreenController> {
  final WishlistScreenController wishlistScreenController =
      Get.find<WishlistScreenController>();

  WishlistScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistScreenController>(
      init: wishlistScreenController,
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
                      hintText: "Search health checkups & packages",
                      fillColor: Colors.white,
                      textAlign: TextAlign.start,
                      textInputFormatter: const [],
                      controller: TextEditingController(),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: SvgPicture.asset("assets/images/search.svg"),
                      ),
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
                text: "Wishlist",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: Obx(() {
              GetWishListDetailsModel wishListdetails =
                  wishlistScreenController.getWishListDetailsModel;
              if (wishlistScreenController.isGetLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (wishListdetails.wishlist == null) {
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                      child: Image.asset("assets/images/terms&Service.png"),
                    ),
                    SizedBox(height: 2.h),
                    const Text('Failed to load wishlist page details.'),
                  ],
                );
              }

              return Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: wishListdetails.wishlist!.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.maxFinite,
                              child: Image.asset(
                                  "assets/images/terms&Service.png"),
                            ),
                            SizedBox(height: 2.h),
                            TextWidget(
                                text: "Your wishlist is empty",
                                size: 14.sp,
                                color: greyColor,
                                bold: FontWeight.w600),
                            SizedBox(height: 1.h),
                            TextWidget(
                                text:
                                    "Add items to your wishlist to buy them later",
                                size: 12.sp,
                                color: greyColor,
                                bold: FontWeight.w400),
                          ],
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 30.h,
                          mainAxisSpacing: 2.8.w, // spacing between rows
                          crossAxisSpacing: 0.6.h, // spacing between columns
                        ),
                        itemCount: wishListdetails
                            .wishlist!.length, // total number of items
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.PRODUCT_DETAIL_SCREEN);
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 2.w, right: 2.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1.2.h),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.6.h,
                                      ),
                                      Center(
                                        child: Image.network(
                                          MyApi.baseUrl +
                                              wishListdetails
                                                  .wishlist![index].images![0],
                                          height: 12.h,
                                        ),
                                      ),
                                      // SizedBox(height: 2.h,),
                                      TextWidget(
                                          text: wishListdetails
                                              .wishlist![index].productName!,
                                          size: 11.sp,
                                          color: greyColor,
                                          bold: FontWeight.w500),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                              text: wishListdetails
                                                  .wishlist![index]
                                                  .sellingPrice!
                                                  .toString(),
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w900),
                                          SizedBox(width: 2.w),
                                          TextWidget(
                                            text: wishListdetails
                                                .wishlist![index].mrp!
                                                .toString(),
                                            size: 12.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SubmitButtonHelper(
                                        text: "Add to Cart",
                                        onTap: () {
                                          // !Add a function to add to cart later on
                                        },
                                        height: 4.8.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.8.h,
                                left: -0,
                                child: Stack(
                                  children: [
                                    SvgPicture.asset("assets/images/tag.svg"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: TextWidget(
                                          text: "75% off",
                                          size: 11.sp,
                                          color: Colors.white,
                                          bold: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 1.w,
                                top: 1.h,
                                child: Obx(() {
                                  if (wishlistScreenController
                                      .isPostLoading.isTrue) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return GestureDetector(
                                    onTap: () async {
                                      await wishlistScreenController
                                          .toggleWishList({
                                        "productId":
                                            wishListdetails.wishlist![index].id,
                                      });

                                      wishlistScreenController.update();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 2.8.h,
                                    ),
                                  );
                                }),
                              ),
                            ],
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
