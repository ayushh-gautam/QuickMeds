import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/app/helper_widgets/helper_func.dart';
import 'package:sizer/sizer.dart';
import '../../../api_collection/api_models/get_products_model_by_id_model.dart';
import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/submit_button_helper.dart';
import '../../helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/product_detail_screen_module/product_detail_screen_controller.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../wishlist_screen_module/wishlist_screen_controller.dart';

class ProductDetailScreenPage extends GetView<ProductDetailScreenController> {
  final ProductDetailScreenController productDetailScreenController =
      Get.find<ProductDetailScreenController>();
  final WishlistScreenController wishlistScreenController =
      Get.put<WishlistScreenController>(WishlistScreenController());

  ProductDetailScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: productDetailScreenController,
      builder: (logic) {
        wishlistScreenController.getWishList();
        wishlistScreenController.update();
        return Obx(() {
          if (productDetailScreenController.isGetLoading.value) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (productDetailScreenController.getProductsByIdModel.product ==
              null) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: Image.asset("assets/images/terms&Service.png"),
                  ),
                  SizedBox(height: 2.h),
                  TextWidget(
                    text: "No Product Found",
                    size: 14.sp,
                    bold: FontWeight.w600,
                    color: blackColor,
                  ),
                ],
              ),
            );
          } else {
            Product product =
                productDetailScreenController.getProductsByIdModel.product!;

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                bottomNavigationBar: Container(
                  height: 9.h,
                  padding: EdgeInsets.only(top: 1.6.h, left: 4.w, right: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productDetailScreenController.isOutOfStock.isTrue
                          ? TextWidget(
                              text: "Out of Stock",
                              size: 22.sp,
                              color: greyColor,
                              bold: FontWeight.w700)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    text:
                                        "₹${productDetailScreenController.totalPrice.toStringAsFixed(2)}",
                                    size: 22.sp,
                                    color: greyColor, 
                                    bold: FontWeight.w700),
                                TextWidget(
                                    text: "Total payable",
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w500),
                              ],
                            ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.6.h),
                        decoration: BoxDecoration(
                            color: primaryGreenColor,
                            borderRadius: BorderRadius.circular(4.h)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 2.8.h,
                              backgroundColor: Colors.white.withOpacity(0.40),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: productDetailScreenController
                                        .isOutOfStock.isTrue
                                    ? SvgPicture.asset(
                                        "assets/images/send.svg",
                                        color: Colors.white,
                                      )
                                    : SvgPicture.asset(
                                        "assets/images/Cart.svg",
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextWidget(
                                text: productDetailScreenController
                                        .isOutOfStock.isTrue
                                    ? "Send Request"
                                    : "Add to cart",
                                size: 12.sp,
                                color: Colors.white,
                                bold: FontWeight.w500),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                    text: product.productName!,
                    size: 14.sp,
                    bold: FontWeight.bold,
                    color: greyColor,
                  ),
                  centerTitle: true,
                  actions: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 2.h, bottom: 2.h, right: 4.w),
                        child: GestureDetector(
                          onTap: () {
                            wishlistScreenController.toggleWishList({
                              "productId": product.id,
                            }).whenComplete(() {
                              wishlistScreenController.getWishList();
                              productDetailScreenController.update();
                              wishlistScreenController.update();
                            });
                          },
                          child: Obx(() {
                            if (wishlistScreenController.isPostLoading.isTrue ||
                                wishlistScreenController.isGetLoading.isTrue) {
                              // return const Center(
                              //   child: CircularProgressIndicator(),
                              // );
                              log("Loading");
                            }
                            if (wishlistScreenController
                                    .getWishListDetailsModel.wishlist ==
                                null) {
                              return Icon(Icons.favorite_border,
                                  color: greyColor, size: 2.8.h);
                            } else {
                              return Icon(
                                  wishlistScreenController
                                          .getWishListDetailsModel.wishlist!
                                          .any((element) =>
                                              element.id == product.id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: wishlistScreenController
                                          .getWishListDetailsModel.wishlist!
                                          .any((element) =>
                                              element.id == product.id)
                                      ? Colors.red
                                      : greyColor,
                                  size: 3.4.h);
                            }
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: appBgColor,
                body: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.share,
                            color: greyColor,
                            size: 3.2.h,
                          )),
                      product.images!.isEmpty
                          ? const SizedBox()
                          : Center(
                              child: Image.network(
                                MyApi.baseUrl +
                                    product.images![
                                        productDetailScreenController
                                            .isSelectedItem.value],
                                height: 26.h,
                              ),
                            ),
                      SizedBox(
                        height: 1.h,
                      ),
                      product.images!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: 10.h,
                              child: ListView.builder(
                                itemCount: product.images!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      productDetailScreenController
                                          .isSelectedItem.value = index;
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 2.w),
                                      padding: EdgeInsets.only(
                                          left: 6.w,
                                          top: 1.h,
                                          right: 6.w,
                                          bottom: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.6.w),
                                          border: productDetailScreenController
                                                      .isSelectedItem.value ==
                                                  index
                                              ? Border.all(
                                                  color: primaryGreenColor,
                                                  width: 0.2.h)
                                              : Border.all(
                                                  color: Colors.transparent,
                                                  width: 0.2.h),
                                          color: Colors.white),
                                      child: Image.network(
                                        MyApi.baseUrl + product.images![index],
                                        height: 14.h,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 64.w,
                            child: TextWidget(
                              text: product.productName!,
                              size: 18.sp,
                              bold: FontWeight.bold,
                              maxlines: 3,
                              overflow: TextOverflow.ellipsis,
                              color: greyColor,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 0.8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.2.h),
                              color: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    productDetailScreenController
                                        .decrementQuantity();
                                    productDetailScreenController.setTotalPrice(
                                        product
                                            .variants![
                                                productDetailScreenController
                                                    .isSelectedVariant.value]
                                            .sellingPrice!);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 1.h, right: 2.h),
                                    child: Icon(
                                      Icons.minimize,
                                      size: 2.h,
                                      color: orangeColor,
                                    ),
                                  ),
                                ),
                                TextWidget(
                                    text: productDetailScreenController
                                        .totalQuantity.value
                                        .toString(),
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600),
                                GestureDetector(
                                  onTap: () {
                                    productDetailScreenController
                                        .incrementQuantity();
                                    productDetailScreenController.setTotalPrice(
                                        product
                                            .variants![
                                                productDetailScreenController
                                                    .isSelectedVariant.value]
                                            .sellingPrice!);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 2.h),
                                    child: Icon(
                                      Icons.add,
                                      size: 2.h,
                                      color: orangeColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            text: product.isPrescriptionRequired == true
                                ? "Rx Doctor Prescription Required "
                                : "No Prescription Required",
                            size: 11.sp,
                            bold: FontWeight.w600,
                            color: primaryGreenColor,
                          ),
                          Icon(
                            Icons.info_outline,
                            color: primaryGreenColor,
                            size: 2.h,
                          ),
                          // !Check it later
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                          text: "Select variant",
                          size: 12.sp,
                          color: greyColor,
                          bold: FontWeight.w600),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      SizedBox(
                        height: 16.h,
                        child: ListView.builder(
                          itemCount: product.variants!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                productDetailScreenController
                                    .isSelectedVariant.value = index;
                                productDetailScreenController.setTotalPrice(
                                    product.variants![index].sellingPrice!);
                                product.variants![index].stock == 'Out of Stock'
                                    ? productDetailScreenController
                                        .setOutOfStock(true)
                                    : productDetailScreenController
                                        .setOutOfStock(false);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 2.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: productDetailScreenController
                                              .isSelectedVariant.value ==
                                          index
                                      ? Border.all(
                                          color: primaryGreenColor,
                                          width: 0.6.w)
                                      : Border.all(color: orangeColor),
                                  borderRadius: BorderRadius.circular(1.2.h),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.6.h,
                                    ),
                                    TextWidget(
                                      text:
                                          "   ${product.variants![index].units!}",
                                      size: 12.sp,
                                      color: orangeColor,
                                      bold: FontWeight.w600,
                                      alignment: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 0.1.h,
                                      color: orangeColor,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                        text:
                                            " ₹ ${product.variants![index].sellingPrice!}",
                                        size: 14.sp,
                                        color: Colors.black,
                                        bold: FontWeight.w700),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                        text:
                                            " (₹ ${calcAverage(product.variants![index].sellingPrice!.toDouble(), product.variants![index].units!).toStringAsFixed(2)} per unit)",
                                        size: 10.sp,
                                        color: greyColor,
                                        bold: FontWeight.w600),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    TextWidget(
                                        alignment: TextAlign.center,
                                        text:
                                            "   ${product.variants![index].stock.toString()}",
                                        size: 10.sp,
                                        color: HexColor("#4CD964"),
                                        bold: FontWeight.w600),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 0.28.h,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  text: "Return Policy",
                                  size: 12.sp,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                  alignment: TextAlign.center,
                                ),
                              ],
                            ),
                            // !Check it later
                            TextWidget(
                              text: "Non Returnable",
                              size: 12.sp,
                              color: primaryGreenColor,
                              bold: FontWeight.w600,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 0.28.h,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  text: "Consume type",
                                  size: 12.sp,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                  alignment: TextAlign.center,
                                ),
                              ],
                            ),
                            TextWidget(
                              text: product.consumeType!,
                              size: 12.sp,
                              color: primaryGreenColor,
                              bold: FontWeight.w600,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 0.28.h,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  text: "Expires on or after",
                                  size: 12.sp,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                  alignment: TextAlign.center,
                                ),
                              ],
                            ),
                            TextWidget(
                              text:
                                  "${AppFunc.calcMonth(product.expireDate!.month)} - ${product.expireDate!.year.toString()}",
                              size: 12.sp,
                              color: primaryGreenColor,
                              bold: FontWeight.w600,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 0.28.h,
                                  backgroundColor: Colors.black,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  text: "Packaging Details",
                                  size: 12.sp,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                  alignment: TextAlign.center,
                                ),
                              ],
                            ),
                            TextWidget(
                              text: product.packagingDetails.toString(),
                              size: 12.sp,
                              color: primaryGreenColor,
                              bold: FontWeight.w600,
                              alignment: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Composition",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text: product.composition.toString(),
                        size: 11.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Product Introduction",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text: product.productIntroduction.toString(),
                        size: 11.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Uses of Medication",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text: product.usesOfMedication.toString(),
                        size: 11.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Benefits",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text: product.benefits.toString(),
                        size: 11.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Contradictions",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text: product.contradictions.toString(),
                        size: 11.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Expert Advice",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.8.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  MyApi.baseUrl +
                                      product.expertAdvice!.avatar.toString(),
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 1.4.h,
                                    ),
                                    TextWidget(
                                      text: product.expertAdvice!.doctorName!
                                          .toString(),
                                      size: 12.sp,
                                      color: primaryGreenColor,
                                      bold: FontWeight.w600,
                                      alignment: TextAlign.center,
                                    ),
                                    TextWidget(
                                      text: product.expertAdvice!.designation!
                                          .toString(),
                                      size: 12.sp,
                                      color: greyColor,
                                      bold: FontWeight.w600,
                                      alignment: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            TextWidget(
                              text: product.expertAdvice!.advice!.toString(),
                              size: 11.sp,
                              bold: FontWeight.w500,
                              color: greyColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // !Check later as substitute products are null
                      TextWidget(
                        text: "Substitute Products",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 31.h,
                        width: 40.w,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 40.w,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
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
                                                product.images!.first,
                                            height: 12.h,
                                          )),
                                          TextWidget(
                                              text: "Substitute product name",
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
                                                  text: "₹366",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w900),
                                              SizedBox(width: 2.w),
                                              TextWidget(
                                                text: "₹999",
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
                                          SizedBox(
                                              width: 38.w,
                                              child: SubmitButtonHelper(
                                                text: "Add to Cart",
                                                onTap: () {},
                                                height: 4.8.h,
                                              )),
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
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: greyColor,
                                          size: 2.8.h,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Ratings & Reviews (${product.reviews!.length})",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              chartRow(
                                  product.reviews!.length,
                                  context,
                                  '5',
                                  product.reviews!.isEmpty
                                      ? 0
                                      : product.reviews!
                                          .where(
                                              (element) => element.rating == 5)
                                          .length),
                              SizedBox(
                                height: 1.h,
                              ),
                              chartRow(
                                  product.reviews!.length,
                                  context,
                                  '4',
                                  product.reviews!.isEmpty
                                      ? 0
                                      : product.reviews!
                                          .where((element) =>
                                              element.rating! < 5 &&
                                              element.rating! >= 4)
                                          .length),
                              SizedBox(
                                height: 1.h,
                              ),
                              chartRow(
                                  product.reviews!.length,
                                  context,
                                  '3',
                                  product.reviews!.isEmpty
                                      ? 0
                                      : product.reviews!
                                          .where((element) =>
                                              element.rating! < 4 &&
                                              element.rating! >= 3)
                                          .length),
                              SizedBox(
                                height: 1.h,
                              ),
                              chartRow(
                                  product.reviews!.length,
                                  context,
                                  '2',
                                  product.reviews!.isEmpty
                                      ? 0
                                      : product.reviews!
                                          .where((element) =>
                                              element.rating! < 3 &&
                                              element.rating! >= 2)
                                          .length),
                              SizedBox(
                                height: 1.h,
                              ),
                              chartRow(
                                  product.reviews!.length,
                                  context,
                                  '1',
                                  product.reviews!.isEmpty
                                      ? 0
                                      : product.reviews!
                                          .where((element) =>
                                              element.rating! < 2 &&
                                              element.rating! >= 1)
                                          .length),
                              SizedBox(
                                height: 2.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                    text: product.averageRating!
                                        .toStringAsFixed(2),
                                    size: 16.sp,
                                    bold: FontWeight.normal,
                                    color: greyColor,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: primaryGreenColor,
                                    size: 2.4.h,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                text:
                                    "${product.reviews!.length.toString()} Reviews",
                                size: 10.sp,
                                bold: FontWeight.normal,
                                color: greyColor,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              product.reviews!.isEmpty
                                  ? const Text("")
                                  : TextWidget(
                                      text:
                                          "${calcRecommended(product.reviews!.length, product.reviews!.where((element) => element.recommendOthers == true).length).toStringAsFixed(0)} %",
                                      size: 16.sp,
                                      bold: FontWeight.normal,
                                      color: greyColor,
                                    ),
                              SizedBox(
                                height: 1.h,
                              ),
                              product.reviews!.isEmpty
                                  ? const Text("")
                                  : TextWidget(
                                      text: "Recommended",
                                      size: 10.sp,
                                      bold: FontWeight.normal,
                                      color: greyColor,
                                    ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.RATING_REVIEW_SCREEN);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(0.12)),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: "Write a review",
                              size: 12.sp,
                              bold: FontWeight.w600,
                              color: greyColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextWidget(
                        text:
                            "Product reviews are managed by a third party to verify ",
                        size: 10.sp,
                        bold: FontWeight.w500,
                        color: greyColor,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            text: "authenticity and compliance with our ",
                            size: 10.sp,
                            bold: FontWeight.w500,
                            color: greyColor,
                          ),
                          TextWidget(
                            text: "Ratings & Reviews",
                            size: 10.sp,
                            bold: FontWeight.w500,
                            color: primaryGreenColor,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                      TextWidget(
                        text: "Guidelines",
                        size: 10.sp,
                        bold: FontWeight.w500,
                        color: primaryGreenColor,
                        decoration: TextDecoration.underline,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "Review this product",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      productDetailScreenController
                              .getProductsByIdModel.product!.reviews!.isEmpty
                          ? const Text("No Reviews Found")
                          : ListView.builder(
                              itemCount: productDetailScreenController
                                  .getProductsByIdModel
                                  .product!
                                  .reviews!
                                  .length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                List<Review> reviews = product.reviews!;
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: reviews[index].userName!,
                                            size: 11.sp,
                                            bold: FontWeight.w500,
                                            color: greyColor,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                reviews[index].rating! >= 1
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color:
                                                    reviews[index].rating! >= 1
                                                        ? primaryGreenColor
                                                        : greyColor,
                                                size: 2.4.h,
                                              ),
                                              Icon(
                                                reviews[index].rating! >= 2
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color:
                                                    reviews[index].rating! >= 2
                                                        ? primaryGreenColor
                                                        : greyColor,
                                                size: 2.4.h,
                                              ),
                                              Icon(
                                                reviews[index].rating! >= 3
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color:
                                                    reviews[index].rating! >= 3
                                                        ? primaryGreenColor
                                                        : greyColor,
                                                size: 2.4.h,
                                              ),
                                              Icon(
                                                reviews[index].rating! >= 4
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color:
                                                    reviews[index].rating! >= 4
                                                        ? primaryGreenColor
                                                        : greyColor,
                                                size: 2.4.h,
                                              ),
                                              Icon(
                                                reviews[index].rating! == 5
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color:
                                                    reviews[index].rating! == 5
                                                        ? primaryGreenColor
                                                        : greyColor,
                                                size: 2.4.h,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                        text: reviews[index].isVerified!
                                            ? "Verified Buyer"
                                            : "Not Verified",
                                        size: 10.sp,
                                        bold: FontWeight.w500,
                                        color: reviews[index].isVerified!
                                            ? primaryGreenColor
                                            : Colors.red,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                        text: reviews[index].title!,
                                        size: 11.sp,
                                        bold: FontWeight.w700,
                                        color: greyColor,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 64.w,
                                            child: TextWidget(
                                              text: reviews[index].review!,
                                              size: 11.sp,
                                              bold: FontWeight.w500,
                                              color: greyColor,
                                              maxlines: 4,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          TextWidget(
                                            text:
                                                reviews[index].recommendOthers!
                                                    ? "✓ Recommended"
                                                    : "",
                                            size: 9.sp,
                                            bold: FontWeight.w500,
                                            color: primaryGreenColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextWidget(
                        text: "You may also like",
                        size: 14.sp,
                        bold: FontWeight.bold,
                        color: greyColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 31.h,
                        width: 40.w,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 40.w,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w),
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
                                              child: Image.asset(
                                            "assets/images/tablet 1.png",
                                            height: 12.h,
                                          )),
                                          TextWidget(
                                              text:
                                                  "Zinga vita vitamin amla Extract 1000mg tablet",
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
                                                  text: "₹366",
                                                  size: 12.sp,
                                                  color: greyColor,
                                                  bold: FontWeight.w900),
                                              SizedBox(width: 2.w),
                                              TextWidget(
                                                text: "₹999",
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
                                          SizedBox(
                                              width: 38.w,
                                              child: SubmitButtonHelper(
                                                text: "Add to Cart",
                                                onTap: () {},
                                                height: 4.8.h,
                                              )),
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
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: greyColor,
                                          size: 2.8.h,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
      },
    );
  }

  double calcRecommended(int total, int recommended) {
    double percentage = (recommended / total) * 100;
    return percentage;
  }

  double calcAverage(double price, String myunits) {
    String units = myunits;
    double sellingPrice = price;
    String numberOfUnitsString = units
        .split(' ')[0]; // Split the string by space and take the first part
    int numberOfUnits = int.parse(
        numberOfUnitsString); // Convert the extracted part to an integer
    // Calculate the average price per unit
    double averagePrice = sellingPrice / numberOfUnits;
    return averagePrice;
  }

  Widget chartRow(int total, BuildContext context, String label, int pct) {
    return Row(
      children: [
        TextWidget(
            text: label, size: 12.sp, color: greyColor, bold: FontWeight.w600),
        SizedBox(
          width: 2.w,
        ),
        Stack(children: [
          Container(
            height: 1.4.h,
            width: MediaQuery.of(context).size.width * 0.56,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.circular(1.w)),
            child: const Text(''),
          ),
          Container(
            height: 1.4.h,
            width: MediaQuery.of(context).size.width * (pct / total) * 0.56,
            decoration: BoxDecoration(
                color: primaryGreenColor,
                borderRadius: BorderRadius.circular(1.w)),
            child: const Text(''),
          ),
        ]),
      ],
    );
  }
}
