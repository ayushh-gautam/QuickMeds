import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/api_collection/api_models/get_product_health_model.dart';
import 'package:quickmeds_user/api_collection/api_models/get_wishlist_details_model.dart';
import 'package:quickmeds_user/app/modules/category_screen_module/category_screen_controller.dart';
import 'package:quickmeds_user/app/modules/wishlist_screen_module/wishlist_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/api_models/get_lab_tests_model.dart';
import '../../../api_collection/api_models/get_medicine_model.dart';
import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../theme/app_colors.dart';

class CategoryScreenPage extends GetView<CategoryScreenController> {
  final CategoryScreenController categoryScreenController =
      Get.put<CategoryScreenController>(CategoryScreenController());
  final WishlistScreenController wishlistScreenController =
      Get.put<WishlistScreenController>(WishlistScreenController());

  CategoryScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: categoryScreenController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                backgroundColor: appBgColor,
                body: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    categoryScreenController.medicineTap == true
                        ? Padding(
                            padding: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Medicines",
                                  size: 16.sp,
                                  bold: FontWeight.bold,
                                  color: greyColor,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextWidget(
                                  text: "Medicines Products List",
                                  size: 11.sp,
                                  bold: FontWeight.normal,
                                  color: greyColor,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 1.6.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          TextWidget(
                                              text: "Filter",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/filter.svg",
                                            height: 2.4.h,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.w, vertical: 1.6.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.2.h),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          TextWidget(
                                              text: "Sort by ",
                                              size: 12.sp,
                                              color: greyColor,
                                              bold: FontWeight.w600),
                                          SizedBox(
                                            width: 18.w,
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/sort.svg",
                                            height: 2.2.h,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          )
                        : categoryScreenController.labTestTap == true
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "Lab Tests",
                                      size: 16.sp,
                                      bold: FontWeight.bold,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                      text: "Lab Tests List",
                                      size: 11.sp,
                                      bold: FontWeight.normal,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.2.h),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                  text: "Filter",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              SvgPicture.asset(
                                                "assets/images/filter.svg",
                                                height: 2.4.h,
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.2.h),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                  text: "Sort by ",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                width: 18.w,
                                              ),
                                              SvgPicture.asset(
                                                "assets/images/sort.svg",
                                                height: 2.2.h,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, right: 4.w, top: 2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "Health Products",
                                      size: 16.sp,
                                      bold: FontWeight.bold,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                      text: "Health Products List",
                                      size: 11.sp,
                                      bold: FontWeight.normal,
                                      color: greyColor,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.2.h),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                  text: "Filter",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              SvgPicture.asset(
                                                "assets/images/filter.svg",
                                                height: 2.4.h,
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 1.6.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.2.h),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              TextWidget(
                                                  text: "Sort by ",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w600),
                                              SizedBox(
                                                width: 18.w,
                                              ),
                                              SvgPicture.asset(
                                                "assets/images/sort.svg",
                                                height: 2.2.h,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                    Padding(
                      padding: EdgeInsets.only(right: 4.w, bottom: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 18.w,
                            color: Colors.white,
                            height: 80.h,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    categoryScreenController.medicineTap = true;
                                    categoryScreenController.labTestTap = false;
                                    categoryScreenController.healthProductTap =
                                        false;
                                    wishlistScreenController.getWishList();
                                    categoryScreenController.getMedicineList();
                                    categoryScreenController.update();
                                    wishlistScreenController.update();
                                  },
                                  child: SizedBox(
                                    width: 16.w,
                                    height: 10.h,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/medicines.png"),
                                          height: 6.h,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextWidget(
                                            text: "Medicines",
                                            size: 8.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    categoryScreenController.labTestTap = true;
                                    categoryScreenController.medicineTap =
                                        false;
                                    categoryScreenController.healthProductTap =
                                        false;
                                    categoryScreenController.getLabTestList();

                                    print(
                                        "labTest::::${categoryScreenController.labTestTap}");
                                    categoryScreenController.update();
                                  },
                                  child: SizedBox(
                                    width: 16.w,
                                    height: 10.h,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/labTests.png"),
                                          height: 6.h,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextWidget(
                                            text: "Lab tests",
                                            size: 8.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    categoryScreenController.healthProductTap =
                                        true;
                                    categoryScreenController.medicineTap =
                                        false;
                                    categoryScreenController.labTestTap = false;
                                    categoryScreenController
                                        .getProductHealthList();
                                    wishlistScreenController.getWishList();
                                    categoryScreenController.update();
                                    wishlistScreenController.update();
                                  },
                                  child: SizedBox(
                                    width: 16.w,
                                    height: 12.h,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              "assets/images/healthProducts.png"),
                                          height: 6.h,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        TextWidget(
                                            text: "Health",
                                            size: 8.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600),
                                        TextWidget(
                                            text: "products",
                                            size: 7.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          // !--------------------Tab Test ko API Integreation begins here--------------------
                          categoryScreenController.labTestTap == true
                              ? Obx(() {
                                  if (categoryScreenController
                                      .isLabTestLoading.value) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (categoryScreenController
                                          .getLabTestsModel.labTests ==
                                      null) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          width: double.maxFinite,
                                          child: Image.asset(
                                              "assets/images/terms&Service.png"),
                                        ),
                                        SizedBox(height: 2.h),
                                        TextWidget(
                                          text: "No Lab Test Found",
                                          size: 14.sp,
                                          bold: FontWeight.w600,
                                          color: blackColor,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return categoryScreenController
                                            .getLabTestsModel.labTests!.isEmpty
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                width: double.maxFinite,
                                                child: Image.asset(
                                                    "assets/images/terms&Service.png"),
                                              ),
                                              SizedBox(height: 2.h),
                                              TextWidget(
                                                text: "Lab Test List is Empty",
                                                size: 14.sp,
                                                bold: FontWeight.w600,
                                                color: blackColor,
                                              ),
                                            ],
                                          )
                                        : Expanded(
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisExtent: 30.h,
                                                mainAxisSpacing: 2.8
                                                    .w, // spacing between rows
                                                crossAxisSpacing: 0.6
                                                    .h, // spacing between columns
                                              ),

                                              itemCount: categoryScreenController
                                                  .getLabTestsModel
                                                  .labTests!
                                                  .length, // total number of items
                                              itemBuilder: (context, index) {
                                                List<LabTest> labTests =
                                                    categoryScreenController
                                                        .getLabTestsModel
                                                        .labTests!;
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.2.h),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      // Center(
                                                      //     child: Image.asset(
                                                      //   "assets/images/browse.png",
                                                      //   height: 10.h,
                                                      //   fit: BoxFit.fill,
                                                      // )),
                                                      Center(
                                                        child: Image.network(
                                                          MyApi.baseUrl +
                                                              labTests[index]
                                                                  .bannerImage!,
                                                          height: 12.h,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 2.w,
                                                                right: 2.w),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            TextWidget(
                                                                maxlines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                text: labTests[
                                                                        index]
                                                                    .testName!,
                                                                size: 11.sp,
                                                                color:
                                                                    greyColor,
                                                                bold: FontWeight
                                                                    .w500),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                TextWidget(
                                                                    text:
                                                                        "₹${labTests[index].sellingPrice.toString()}",
                                                                    size: 12.sp,
                                                                    color:
                                                                        greyColor,
                                                                    bold: FontWeight
                                                                        .w900),
                                                                SizedBox(
                                                                    width: 2.w),
                                                                TextWidget(
                                                                  text:
                                                                      "₹${labTests[index].mrp.toString()}",
                                                                  size: 12.sp,
                                                                  color:
                                                                      greyColor,
                                                                  bold:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            1.2.h),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(1.2
                                                                            .h),
                                                                    border: Border.all(
                                                                        color:
                                                                            orangeColor)),
                                                                child: Center(
                                                                  child: TextWidget(
                                                                      text:
                                                                          "Book Now",
                                                                      size:
                                                                          12.sp,
                                                                      color:
                                                                          orangeColor,
                                                                      bold: FontWeight
                                                                          .w400),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                  }
                                })
                              // !--------------------Medicines ko API Integreation begins here--------------------
                              : categoryScreenController.medicineTap == true
                                  ? Obx(
                                      () {
                                        if (categoryScreenController
                                            .isMedicineLoading.value) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (categoryScreenController
                                                .getMedicineModel.medicines ==
                                            null) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                width: double.maxFinite,
                                                child: Image.asset(
                                                    "assets/images/terms&Service.png"),
                                              ),
                                              SizedBox(height: 2.h),
                                              TextWidget(
                                                text: "No Medicine Found",
                                                size: 14.sp,
                                                bold: FontWeight.w600,
                                                color: blackColor,
                                              ),
                                            ],
                                          );
                                        } else {
                                          return categoryScreenController
                                                  .getMedicineModel
                                                  .medicines!
                                                  .isEmpty
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 200,
                                                      width: double.maxFinite,
                                                      child: Image.asset(
                                                          "assets/images/terms&Service.png"),
                                                    ),
                                                    SizedBox(height: 2.h),
                                                    TextWidget(
                                                      text:
                                                          "Medicine List is Empty",
                                                      size: 14.sp,
                                                      bold: FontWeight.w600,
                                                      color: blackColor,
                                                    ),
                                                  ],
                                                )
                                              : Expanded(
                                                  child: GridView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisExtent: 30.h,
                                                      mainAxisSpacing: 2.8
                                                          .w, // spacing between rows
                                                      crossAxisSpacing: 0.6
                                                          .h, // spacing between columns
                                                    ),

                                                    itemCount:
                                                        categoryScreenController
                                                            .getMedicineModel
                                                            .medicines!
                                                            .length, // total number of items
                                                    itemBuilder:
                                                        (context, index) {
                                                      List<Medicine> medicines =
                                                          categoryScreenController
                                                              .getMedicineModel
                                                              .medicines!;
                                                      return Stack(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 2.w,
                                                                    right: 2.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1.2.h),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 1.6.h,
                                                                ),
                                                                Center(
                                                                  child: Image
                                                                      .network(
                                                                    MyApi.baseUrl+medicines[index].images!.first,
                                                                    height:
                                                                        12.h,
                                                                  ),
                                                                ),

                                                                // SizedBox(height: 2.h,),
                                                                TextWidget(
                                                                    maxlines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    text: medicines[
                                                                            index]
                                                                        .productName!,
                                                                    size: 11.sp,
                                                                    color:
                                                                        greyColor,
                                                                    bold: FontWeight
                                                                        .w500),
                                                                SizedBox(
                                                                  height: 1.h,
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    TextWidget(
                                                                        text:
                                                                            "₹${medicines[index].sellingPrice.toString()}",
                                                                        size: 12
                                                                            .sp,
                                                                        color:
                                                                            greyColor,
                                                                        bold: FontWeight
                                                                            .w900),
                                                                    SizedBox(
                                                                        width: 2
                                                                            .w),
                                                                    TextWidget(
                                                                      text:
                                                                          "₹${medicines[index].mrp.toString()}",
                                                                      size:
                                                                          12.sp,
                                                                      color:
                                                                          greyColor,
                                                                      bold: FontWeight
                                                                          .w600,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                SubmitButtonHelper(
                                                                  text:
                                                                      "Add to Cart",
                                                                  onTap: () {},
                                                                  height: 4.8.h,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0.8.h,
                                                            left: -0,
                                                            child: Stack(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    "assets/images/tag.svg"),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              1.w),
                                                                  child: TextWidget(
                                                                      text:
                                                                          "75% off",
                                                                      size:
                                                                          11.sp,
                                                                      color: Colors
                                                                          .white,
                                                                      bold: FontWeight
                                                                          .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 1.w,
                                                            top: 1.h,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                wishlistScreenController
                                                                    .toggleWishList({
                                                                  "productId":
                                                                      medicines[
                                                                              index]
                                                                          .id,
                                                                }).whenComplete(
                                                                        () {
                                                                  wishlistScreenController
                                                                      .getWishList();
                                                                  categoryScreenController
                                                                      .update();
                                                                  wishlistScreenController
                                                                      .update();
                                                                });
                                                              },
                                                              child: Obx(() {
                                                                if (wishlistScreenController
                                                                        .isPostLoading
                                                                        .isTrue ||
                                                                    wishlistScreenController
                                                                        .isGetLoading
                                                                        .isTrue) {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  );
                                                                }
                                                                if (wishlistScreenController
                                                                        .getWishListDetailsModel
                                                                        .wishlist ==
                                                                    null) {
                                                                  return Icon(
                                                                      Icons
                                                                          .favorite_border,
                                                                      color:
                                                                          greyColor,
                                                                      size: 2.8
                                                                          .h);
                                                                } else {
                                                                  return Icon(
                                                                      wishlistScreenController.getWishListDetailsModel.wishlist!.any((element) =>
                                                                              element.id ==
                                                                              medicines[index]
                                                                                  .id)
                                                                          ? Icons
                                                                              .favorite
                                                                          : Icons
                                                                              .favorite_border,
                                                                      color: wishlistScreenController.getWishListDetailsModel.wishlist!.any((element) =>
                                                                              element.id ==
                                                                              medicines[index]
                                                                                  .id)
                                                                          ? Colors
                                                                              .red
                                                                          : greyColor,
                                                                      size: 2.8
                                                                          .h);
                                                                }
                                                              }),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                );
                                        }
                                      },
                                    )
                                  // !-------------------- Health Products API Integration begins here---------------------
                                  : Obx(
                                      () {
                                        if (categoryScreenController
                                            .isProductHealthLoading.value) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (categoryScreenController
                                                .getProductHealthModel
                                                .healthProduct ==
                                            null) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                width: double.maxFinite,
                                                child: Image.asset(
                                                    "assets/images/terms&Service.png"),
                                              ),
                                              SizedBox(height: 2.h),
                                              TextWidget(
                                                text:
                                                    "No Health Products Found",
                                                size: 14.sp,
                                                bold: FontWeight.w600,
                                                color: blackColor,
                                              ),
                                            ],
                                          );
                                        } else {
                                          return categoryScreenController
                                                  .getProductHealthModel
                                                  .healthProduct!
                                                  .isEmpty
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 200,
                                                      width: double.maxFinite,
                                                      child: Image.asset(
                                                          "assets/images/terms&Service.png"),
                                                    ),
                                                    SizedBox(height: 2.h),
                                                    TextWidget(
                                                      text:
                                                          "Health Product List is Empty",
                                                      size: 14.sp,
                                                      bold: FontWeight.w600,
                                                      color: blackColor,
                                                    ),
                                                  ],
                                                )
                                              : Expanded(
                                                  child: GridView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      mainAxisExtent: 30.h,
                                                      mainAxisSpacing: 2.8
                                                          .w, // spacing between rows
                                                      crossAxisSpacing: 0.6
                                                          .h, // spacing between columns
                                                    ),

                                                    itemCount:
                                                        categoryScreenController
                                                            .getProductHealthModel
                                                            .healthProduct!
                                                            .length, // total number of items
                                                    itemBuilder:
                                                        (context, index) {
                                                      List<HealthProduct>
                                                          healthProduct =
                                                          categoryScreenController
                                                              .getProductHealthModel
                                                              .healthProduct!;
                                                      return Stack(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 2.w,
                                                                    right: 2.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1.2.h),
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 1.6.h,
                                                                ),
                                                                Center(
                                                                  child: Image
                                                                      .network(
                                                                    MyApi.baseUrl +
                                                                        healthProduct[index]
                                                                            .images!
                                                                            .first,
                                                                    height:
                                                                        12.h,
                                                                  ),
                                                                ),
                                                                // SizedBox(height: 2.h,),
                                                                TextWidget(
                                                                    maxlines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    text: healthProduct[
                                                                            index]
                                                                        .productName!,
                                                                    size: 11.sp,
                                                                    color:
                                                                        greyColor,
                                                                    bold: FontWeight
                                                                        .w500),
                                                                SizedBox(
                                                                  height: 1.h,
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    TextWidget(
                                                                        text:
                                                                            "₹${healthProduct[index].sellingPrice.toString()}",
                                                                        size: 12
                                                                            .sp,
                                                                        color:
                                                                            greyColor,
                                                                        bold: FontWeight
                                                                            .w900),
                                                                    SizedBox(
                                                                        width: 2
                                                                            .w),
                                                                    TextWidget(
                                                                      text:
                                                                          "₹${healthProduct[index].mrp.toString()}",
                                                                      size:
                                                                          12.sp,
                                                                      color:
                                                                          greyColor,
                                                                      bold: FontWeight
                                                                          .w600,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                SubmitButtonHelper(
                                                                  text:
                                                                      "Add to Cart",
                                                                  onTap: () {},
                                                                  height: 4.8.h,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 0.8.h,
                                                            left: -0,
                                                            child: Stack(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    "assets/images/tag.svg"),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              1.w),
                                                                  child: TextWidget(
                                                                      text:
                                                                          "75% off",
                                                                      size:
                                                                          11.sp,
                                                                      color: Colors
                                                                          .white,
                                                                      bold: FontWeight
                                                                          .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 1.w,
                                                            top: 1.h,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                wishlistScreenController
                                                                    .toggleWishList({
                                                                  "productId":
                                                                      healthProduct[
                                                                              index]
                                                                          .id,
                                                                }).whenComplete(
                                                                        () {
                                                                  wishlistScreenController
                                                                      .getWishList();
                                                                  categoryScreenController
                                                                      .update();
                                                                  wishlistScreenController
                                                                      .update();
                                                                });
                                                              },
                                                              child: Obx(() {
                                                                if (wishlistScreenController
                                                                        .isPostLoading
                                                                        .isTrue ||
                                                                    wishlistScreenController
                                                                        .isGetLoading
                                                                        .isTrue) {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  );
                                                                }
                                                                if (wishlistScreenController
                                                                        .getWishListDetailsModel
                                                                        .wishlist ==
                                                                    null) {
                                                                  return Icon(
                                                                      Icons
                                                                          .favorite_border,
                                                                      color:
                                                                          greyColor,
                                                                      size: 2.8
                                                                          .h);
                                                                } else {
                                                                  return Icon(
                                                                      wishlistScreenController.getWishListDetailsModel.wishlist!.any((element) =>
                                                                              element.id ==
                                                                              healthProduct[index]
                                                                                  .id)
                                                                          ? Icons
                                                                              .favorite
                                                                          : Icons
                                                                              .favorite_border,
                                                                      color: wishlistScreenController.getWishListDetailsModel.wishlist!.any((element) =>
                                                                              element.id ==
                                                                              healthProduct[index]
                                                                                  .id)
                                                                          ? Colors
                                                                              .red
                                                                          : greyColor,
                                                                      size: 2.8
                                                                          .h);
                                                                }
                                                              }),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                );
                                        }
                                      },
                                    )
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
