import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/api_collection/api_models/get_test_packages_model.dart';
import 'package:sizer/sizer.dart';

import '../../../api_collection/config/api_config.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'explore_packages_controller.dart';

class ExplorePackagesPage extends GetView<ExplorePackagesController> {
  final ExplorePackagesController explorePackagesController =
      Get.find<ExplorePackagesController>();

  ExplorePackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: explorePackagesController,
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
              if (explorePackagesController.isGetLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (explorePackagesController.getTestPackagesModel.testPackages ==
                  null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                      child: Image.asset("assets/images/terms&Service.png"),
                    ),
                    SizedBox(height: 2.h),
                    TextWidget(
                      text: "No Packages Found",
                      size: 14.sp,
                      bold: FontWeight.w600,
                      color: blackColor,
                    ),
                  ],
                );
              }
              return Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.6.h),
                child: ListView.builder(
                  itemCount: explorePackagesController
                      .getTestPackagesModel.testPackages!.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<TestPackage> testPackages = explorePackagesController
                        .getTestPackagesModel.testPackages!;
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PACKAGES_DETAIL);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1.6.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1.2.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.2.h),
                                  color: primaryGreenColor,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      MyApi.baseUrl +
                                          testPackages[index].image!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: double.maxFinite,
                                height: 15.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.8.h, horizontal: 4.w),
                              child: TextWidget(
                                  text: testPackages[index].name!,
                                  size: 12.sp,
                                  color: Colors.black,
                                  bold: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
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
