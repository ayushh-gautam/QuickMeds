import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../helper_widgets/hex_color.dart';
import '../../helper_widgets/text_widget.dart';
import '../../helper_widgets/textfield_widget.dart';
import 'package:quickmeds_user/app/modules/search_screen_module/search_screen_controller.dart';

class SearchScreenPage extends GetView<SearchScreenController> {
  final SearchScreenController searchScreenController =
      Get.find<SearchScreenController>();

  SearchScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: searchScreenController,
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
                      hintText: "Search your products here",
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
                    color: orangeColor,
                    size: 2.4.h,
                  ),
                ),
              ),
              title: TextWidget(
                text: "Search Products",
                size: 14.sp,
                bold: FontWeight.bold,
                color: greyColor,
              ),
              centerTitle: true,
            ),
            backgroundColor: appBgColor,
            body: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.refresh,
                                  size: 2.6.h,
                                  color: greyColor,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                    text: "Zinga vita Vitamin Tablet ",
                                    size: 11.sp,
                                    color: HexColor("#3B5664"),
                                    bold: FontWeight.w600),
                              ],
                            ),
                            SvgPicture.asset("assets/images/recentSerach.svg")
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  thickness: 0.4.h,
                  color: dotColor,
                  height: 0.1.h,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 40.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: primaryGreenColor,
                              minimumSize: Size(double.infinity, 5.6.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.h))),
                          child: TextWidget(
                              text: "Request Medicine",
                              size: 11.sp,
                              alignment: TextAlign.center,
                              color: Colors.white,
                              bold: FontWeight.bold),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: TextWidget(
                    text: "Related searches",
                    size: 14.sp,
                    bold: FontWeight.w600,
                    color: HexColor("#3B5664"),
                  ),
                ),
                SizedBox(
                  height: 2.4.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 8.h,
                      mainAxisSpacing: 2.8.w, // spacing between rows
                      crossAxisSpacing: 0.6.h, // spacing between columns
                    ),

                    itemCount: 5, // total number of items
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Row(
                            children: [
                              Center(
                                  child: Image.asset(
                                "assets/images/tablet 1.png",
                                height: 6.8.h,
                              )),
                              SizedBox(
                                width: 4.w,
                              ),
                              TextWidget(
                                  text: "Zinga vita",
                                  size: 11.sp,
                                  color: HexColor("#3B5664"),
                                  bold: FontWeight.w600),
                            ],
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  thickness: 0.4.h,
                  color: dotColor,
                  height: 0.1.h,
                ),
                SizedBox(
                  height: 2.4.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: TextWidget(
                    text: "Recommended for you",
                    size: 14.sp,
                    bold: FontWeight.w600,
                    color: HexColor("#3B5664"),
                  ),
                ),
                SizedBox(
                  height: 2.4.h,
                ),
                SizedBox(
                  height: 16.h,
                  child: ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding:
                              EdgeInsets.only(left: 6.w, right: 6.w, top: 2.h),
                          margin: EdgeInsets.only(left: 4.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Column(
                            children: [
                              Center(
                                  child: Image.asset(
                                "assets/images/tablet 1.png",
                                height: 6.8.h,
                              )),
                              SizedBox(
                                height: 2.h,
                              ),
                              TextWidget(
                                  text: "Zinga vita",
                                  size: 11.sp,
                                  color: HexColor("#3B5664"),
                                  bold: FontWeight.w600),
                            ],
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
