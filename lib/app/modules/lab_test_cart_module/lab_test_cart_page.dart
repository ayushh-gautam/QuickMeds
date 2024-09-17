import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:sizer/sizer.dart';

import '../../helper_widgets/text_widget.dart';
import '../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import 'package:quickmeds_user/app/modules/lab_test_cart_module/lab_test_cart_controller.dart';

class LabTestCartPage extends GetView<LabTestCartController> {
  final LabTestCartController labTestCartController =
      Get.put<LabTestCartController>(LabTestCartController());

  LabTestCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: labTestCartController,
        builder: (logic) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: appBgColor,
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
                  text: "Cart",
                  size: 14.sp,
                  bold: FontWeight.bold,
                  color: greyColor,
                ),
                centerTitle: true,
              ),
              bottomNavigationBar: Container(
                  height: 16.h,
                  padding: EdgeInsets.only(left: 2.w, top: 1.6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.2.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/Layer 2.svg"),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Sample Collection from Office",
                                    size: 12.sp,
                                    bold: FontWeight.w500,
                                    color: greyColor,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: "Ashar It 4th Floor 402,",
                                        size: 10.sp,
                                        bold: FontWeight.w500,
                                        color: greyColor,
                                      ),
                                      TextWidget(
                                        text: "  Change",
                                        size: 11.sp,
                                        bold: FontWeight.w600,
                                        color: primaryGreenColor,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            thickness: 0.1.h,
                            color: greyColor,
                            height: 0.1.h,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      text: "To be Paid",
                                      size: 14.sp,
                                      color: greyColor,
                                      bold: FontWeight.w600),
                                  TextWidget(
                                      text: "₹1098",
                                      size: 16.sp,
                                      color: greyColor,
                                      bold: FontWeight.w800),
                                ],
                              ),
                              SizedBox(
                                width: 32.w,
                              ),
                              SizedBox(
                                width: 40.w,
                                child: SubmitButtonHelper(
                                  text: "Continue",
                                  onTap: () {
                                    Get.toNamed(Routes.TIME_SLOT);
                                  },
                                  height: 5.6.h,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              body: Padding(
                padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextWidget(
                        text: "1 test conducted",
                        size: 14.sp,
                        color: greyColor,
                        bold: FontWeight.w600),
                    SizedBox(
                      height: 0.4.h,
                    ),
                    TextWidget(
                        text: "Conducted by Quick meds | Labs",
                        size: 12.sp,
                        color: greyColor,
                        bold: FontWeight.w400),
                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 26.w,
                                child: Image.asset(
                                  "assets/images/Frame 1171275762.png",
                                  height: 20.h,
                                )),
                            SizedBox(
                              width: 4.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 50.w,
                                  child: TextWidget(
                                    text:
                                        "Comprehensive gold full body checkup with smart report",
                                    size: 12.sp,
                                    bold: FontWeight.w700,
                                    color: greyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.6.h,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                        text: "₹366",
                                        size: 16.sp,
                                        color: greyColor,
                                        bold: FontWeight.w800),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    TextWidget(
                                      text: "₹999",
                                      size: 16.sp,
                                      color: greyColor,
                                      bold: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    TextWidget(
                                      text: "55 % off",
                                      size: 16.sp,
                                      color: primaryGreenColor,
                                      bold: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Icon(
                              Icons.delete_outline,
                              size: 2.6.h,
                              color: orangeColor,
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextWidget(
                      text: "Frequently Booked together",
                      size: 16.sp,
                      bold: FontWeight.bold,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 38.h,
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.LAB_TEST_DETAIL);
                            },
                            child: Container(
                              width: 74.w,
                              margin: EdgeInsets.only(right: 1.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1.2.h),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/images/browse.png"),
                                    height: 18.h,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 1.6.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text:
                                                "Fever package extensive (includes dengue, malaria, typhoid & chiku..",
                                            size: 12.sp,
                                            color: greyColor,
                                            bold: FontWeight.w600),
                                        SizedBox(
                                          height: 1.2.h,
                                        ),
                                        TextWidget(
                                          text: "Get reports within 18 hrs",
                                          size: 9.sp,
                                          bold: FontWeight.w500,
                                          color: greyColor,
                                        ),
                                        SizedBox(
                                          height: 1.2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                                text: "₹366 onwards",
                                                size: 14.sp,
                                                color: greyColor,
                                                bold: FontWeight.w500),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.LAB_TEST_CART);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.6.h,
                                                    horizontal: 2.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.2.h),
                                                    border: Border.all(
                                                        color:
                                                            primaryGreenColor)),
                                                child: Center(
                                                  child: TextWidget(
                                                      text: "Book Now",
                                                      size: 14.sp,
                                                      color: primaryGreenColor,
                                                      bold: FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextWidget(
                      text: "Bill Summary",
                      size: 14.sp,
                      bold: FontWeight.w600,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Cart MRP",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                        TextWidget(
                          text: "₹366",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Other services",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                        TextWidget(
                          text: "₹17",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Total discount",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                        TextWidget(
                          text: "₹200",
                          size: 12.sp,
                          bold: FontWeight.w500,
                          color: greyColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      thickness: 0.1.h,
                      color: greyColor.withOpacity(0.20),
                      height: 0.1.h,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "To be Paid",
                          size: 12.sp,
                          bold: FontWeight.w600,
                          color: greyColor,
                        ),
                        TextWidget(
                          text: "₹2000",
                          size: 12.sp,
                          bold: FontWeight.w600,
                          color: greyColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextWidget(
                      text: "Other details",
                      size: 14.sp,
                      bold: FontWeight.w600,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextWidget(
                      text:
                          "Quick meds is a technology platform to facilitate transaction of business. The products and services are offered for sale by the sellers. The user authorizes the delivery personnel to be his agent for delivery of the goods. For details read terms and conditions",
                      size: 12.sp,
                      bold: FontWeight.w500,
                      color: greyColor,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),

                    //////////////////////////////////
                    SubmitButtonHelper(
                      text: 'Cancel Order',
                      onTap: () {
                        // Show Bottom Sheet
                        showModalBottomSheet(
                          useSafeArea: true,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Reason for cancellation',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const TextWidget(
                                    text:
                                        'Please select a reason for  cancellation. This helps us to improve our service',
                                    bold: FontWeight.normal,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.reasons.length,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        bool isSelected = index ==
                                            controller
                                                .selectedReasonIndex.value;
                                        return Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 0.5,
                                              color: greyColor,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            RadioListTile<int>(
                                              activeColor: orangeColor,
                                              contentPadding:
                                                  const EdgeInsets.all(0),
                                              title: TextWidget(
                                                text: controller.reasons[index],
                                                size: 16,
                                                bold: FontWeight.normal,
                                                color: isSelected
                                                    ? Colors.black
                                                    : greyColor,
                                              ),
                                              value: index,
                                              groupValue: controller
                                                  .selectedReasonIndex.value,
                                              onChanged: (int? value) {
                                                controller.selectReason(value!);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Obx(
                                    () => SizedBox(
                                      width: double.infinity,
                                      child: SubmitButtonHelper(
                                        text: 'Submit Cancellation',
                                        onTap: controller.isButtonEnabled
                                            ? () {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w),
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.h),
                                                      ),
                                                      content: Image(
                                                        image: const AssetImage(
                                                            "assets/images/cancel_order.png"),
                                                        height: 40.h,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) {
                                                  // Use Get.back() outside of the showDialog callback

                                                  Get.back(closeOverlays: true);
                                                  Get.back();
                                                });
                                              }
                                            : null,
                                        color: controller.isButtonEnabled
                                            ? primaryGreenColor
                                            : greyColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ).marginSymmetric(horizontal: 18, vertical: 18),
                            );
                          },
                        );
                      },
                    )

                    ////////////////////////////////
                  ],
                ),
              ),
            ),
          );
        });
  }
}
