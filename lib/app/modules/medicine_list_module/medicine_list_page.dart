import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/api_models/get_medicine_model.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';

import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/medicine_list_module/medicine_list_controller.dart';

import '../wishlist_screen_module/wishlist_screen_controller.dart';

class MedicineListPage extends GetView<MedicineListController> {
  final MedicineListController medicineListController =
      Get.find<MedicineListController>();
  final WishlistScreenController wishlistScreenController =
      Get.put<WishlistScreenController>(WishlistScreenController());

  MedicineListPage({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: medicineListController,
      builder: (logic) {
        wishlistScreenController.getWishList();
        wishlistScreenController.update();
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: appBgColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size(double.maxFinite, 2.h),
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
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
            ),
            backgroundColor: appBgColor,
            body: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
              child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.6.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.2.h),
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
                          borderRadius: BorderRadius.circular(1.2.h),
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
                  Obx(() {
                    if (medicineListController.isGetLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (medicineListController.getMedicineModel.medicines ==
                        null) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.maxFinite,
                            child:
                                Image.asset("assets/images/terms&Service.png"),
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
                    }
                    return medicineListController
                            .getMedicineModel.medicines!.isEmpty
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
                                text: "Medicine List is Empty",
                                size: 14.sp,
                                bold: FontWeight.w600,
                                color: blackColor,
                              ),
                            ],
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 30.h,
                              mainAxisSpacing: 2.8.w, // spacing between rows
                              crossAxisSpacing:
                                  0.6.h, // spacing between columns
                            ),

                            itemCount: medicineListController.getMedicineModel
                                .medicines!.length, // total number of items
                            itemBuilder: (context, index) {
                              List<Medicine> medicines = medicineListController
                                  .getMedicineModel.medicines!;
                              return Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 2.w, right: 2.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.6.h,
                                        ),
                                        Center(
                                          child: Image.network(
                                            MyApi.baseUrl +
                                                medicines[index].images!.first,
                                            height: 12.h,
                                          ),
                                        ),
                                        // SizedBox(height: 2.h,),
                                        TextWidget(
                                            text: medicines[index].productName!,
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
                                                text:
                                                    "₹${medicines[index].sellingPrice.toString()}",
                                                size: 12.sp,
                                                color: greyColor,
                                                bold: FontWeight.w900),
                                            SizedBox(width: 2.w),
                                            TextWidget(
                                              text:
                                                  "₹${medicines[index].mrp.toString()}",
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
                                    child: GestureDetector(
                                      onTap: () {
                                        wishlistScreenController
                                            .toggleWishList({
                                          "productId": medicines[index].id,
                                        }).whenComplete(() {
                                          wishlistScreenController
                                              .getWishList();
                                          medicineListController.update();
                                          wishlistScreenController.update();
                                        });
                                      },
                                      child: Obx(() {
                                        if (wishlistScreenController
                                                .isPostLoading.isTrue ||
                                            wishlistScreenController
                                                .isGetLoading.isTrue) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        if (wishlistScreenController
                                                .getWishListDetailsModel
                                                .wishlist ==
                                            null) {
                                          return Icon(Icons.favorite_border,
                                              color: greyColor, size: 2.8.h);
                                        } else {
                                          return Icon(
                                              wishlistScreenController
                                                      .getWishListDetailsModel
                                                      .wishlist!
                                                      .any((element) =>
                                                          element.id ==
                                                          medicines[index].id)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: wishlistScreenController
                                                      .getWishListDetailsModel
                                                      .wishlist!
                                                      .any((element) =>
                                                          element.id ==
                                                          medicines[index].id)
                                                  ? Colors.red
                                                  : greyColor,
                                              size: 2.8.h);
                                        }
                                      }),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
