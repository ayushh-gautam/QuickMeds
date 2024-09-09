import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_by_id_model.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

import 'package:quickmeds_user/app/modules/packages_detail_module/packages_detail_controller.dart';

class PackagesDetailPage extends GetView<PackagesDetailController> {
  final PackagesDetailController packagesDetailController =
      Get.find<PackagesDetailController>();

  PackagesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: packagesDetailController,
      builder: (logic) {
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
            body: Obx(() {
              if (packagesDetailController.isGetLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (packagesDetailController
                      .getTestPackagesByIdModel.testPackage ==
                  null) {
                return Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              }
              return Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                child: ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: packagesDetailController
                              .getTestPackagesByIdModel.testPackage!.name
                              .toString(),
                          size: 16.sp,
                          bold: FontWeight.bold,
                          color: greyColor,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.EXPLORE_PACKAGES);
                            },
                            child: TextWidget(
                              text:
                                  "${packagesDetailController.getTestPackagesByIdModel.testPackage!.tests!.length} results",
                              size: 10.sp,
                              bold: FontWeight.w600,
                              color: greyColor,
                            )),
                      ],
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
                    ListView.builder(
                      itemCount: packagesDetailController
                          .getTestPackagesByIdModel.testPackage!.tests!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<Test> tests = packagesDetailController
                            .getTestPackagesByIdModel.testPackage!.tests!;
                        Size mySize = MediaQuery.sizeOf(context);
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PACKAGES_DETAIL);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  child: Image(
                                    image: NetworkImage(
                                      MyApi.baseUrl + tests[index].bannerImage!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: mySize.width / 1.5,
                                      child: TextWidget(
                                          text: tests[index].testName!,
                                          maxlines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          size: 12.sp,
                                          color: Colors.black,
                                          bold: FontWeight.w500),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text:
                                                "₹ ${tests[index].sellingPrice}",
                                            maxlines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            size: 12.sp,
                                            color: greyColor,
                                            bold: FontWeight.w900),
                                        TextWidget(
                                            text: "onwards",
                                            size: 9.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600),
                                      ],
                                    ),
                                  ],
                                ),
                                TextWidget(
                                    text: tests[index].description!,
                                    maxlines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    size: 12.sp,
                                    color: greyColor,
                                    bold: FontWeight.w600),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextWidget(
                                    text:
                                        "Contains ${tests[index].containsMultipleTest!.length} tests",
                                    // maxlines: 1,
                                    // overflow: TextOverflow.ellipsis,
                                    size: 10.sp,
                                    color: greyColor,
                                    bold: FontWeight.w400),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.2.h),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(1.2.h),
                                      border: Border.all(color: orangeColor)),
                                  child: Center(
                                    child: TextWidget(
                                        text: "Book",
                                        size: 14.sp,
                                        color: orangeColor,
                                        bold: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
