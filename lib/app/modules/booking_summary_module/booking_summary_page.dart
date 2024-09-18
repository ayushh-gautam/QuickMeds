import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/booking_summary_module/booking_summary_controller.dart';
import 'package:quickmeds_user/app/routes/app_pages.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';


///
///

class BookingSummaryPage extends StatefulWidget {
  const BookingSummaryPage({super.key});

  @override
  State<BookingSummaryPage> createState() => _BookingSummaryPageState();
}

final BookingSummaryController bookingSummaryController =
    Get.put<BookingSummaryController>(BookingSummaryController());

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            height: 8.h,
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
                                text: "₹2216",
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
                              Get.toNamed(Routes.BOOKING_SUCCESS);
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
            text: "Booking summary",
            size: 14.sp,
            bold: FontWeight.bold,
            color: greyColor,
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            bookingPersonalDetails(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 6,
              color: const Color(0xff90A4AE).withOpacity(0.2),
            ),
            const SizedBox(
              height: 14,
            ),
            pleaseNoteSection(),
            Container(
              height: 6,
              color: const Color(0xff90A4AE).withOpacity(0.2),
            ).marginOnly(top: 20, bottom: 16),
            testsSection(),
            Container(
              height: 6,
              color: const Color(0xff90A4AE).withOpacity(0.2),
            ).marginOnly(top: 20, bottom: 16),
            couponSection(),
            Container(
              height: 6,
              color: const Color(0xff90A4AE).withOpacity(0.2),
            ).marginOnly(top: 20, bottom: 16),
            billSummarySection().marginSymmetric(horizontal: 18),
            Container(
              height: 6,
              color: const Color(0xff90A4AE).withOpacity(0.2),
            ).marginOnly(top: 20, bottom: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Others details',
                  size: 20,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextWidget(
                  text:
                      'Quick meds is a technology platform to facilitate transaction of business. The products and services are offered for sale by the sellers. The user authorizes the delivery personnel to be his agent for delivery of the goods. For details read terms and conditions',
                  size: 18,
                  bold: FontWeight.normal,
                  color: greyColor,
                ).marginOnly(bottom: 10)
              ],
            ).marginSymmetric(horizontal: 18)
          ],
        ));
  }

  Column billSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Bill Summary',
          size: 20,
          bold: FontWeight.normal,
          color: greyColor,
        ),
        const SizedBox(height: 18),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bookingSummaryController.billTitle.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: bookingSummaryController.billTitle[index],
                  size: 16,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                TextWidget(
                  text: bookingSummaryController.billCost[index],
                  size: 16,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
              ],
            ).marginOnly(bottom: 10);
          },
        ),
        Container(
          height: 0.5,
          color: const Color(0xff90A4AE),
        ).marginOnly(bottom: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: 'To be Paid',
              size: 20,
              bold: FontWeight.normal,
              color: greyColor,
            ),
            TextWidget(
              text: '₹2216',
              size: 16,
              bold: FontWeight.normal,
              color: greyColor,
            ),
          ],
        )
      ],
    );
  }

  Container testsSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Tests',
            size: 20,
            bold: FontWeight.normal,
            color: greyColor,
          ),
          const SizedBox(
            height: 8,
          ),
          TextWidget(
            text: 'Conducted by Quick meds | Labs',
            size: 16,
            bold: FontWeight.normal,
            color: greyColor,
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(height: 100, width: 60, color: Colors.red),
          )
        ],
      ).marginSymmetric(horizontal: 18),
    );
  }

  Container couponSection() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.airplane_ticket),
              TextWidget(
                text: 'Best coupons for you',
                size: 18,
                bold: FontWeight.normal,
                color: greyColor,
              ),
              const Spacer(),
              TextWidget(
                text: 'All Coupons >',
                size: 18,
                bold: FontWeight.normal,
                color: orangeColor,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(style: BorderStyle.solid)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Extra ₹95 OFF',
                  size: 20,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextWidget(
                  text: '10% off on minimum purchase of Rs.799',
                  size: 16,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: orangeColor, style: BorderStyle.solid)),
                      padding: const EdgeInsets.all(5),
                      child: TextWidget(
                        text: 'Shirt200',
                        bold: FontWeight.normal,
                        size: 16,
                        color: greyColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: orangeColor, style: BorderStyle.solid)),
                      padding: const EdgeInsets.all(6),
                      child: TextWidget(
                        text: 'Apply coupon',
                        bold: FontWeight.normal,
                        size: 16,
                        color: greyColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ).marginSymmetric(horizontal: 18),
    );
  }

  Container pleaseNoteSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Please note:',
            size: 20,
            bold: FontWeight.w400,
            color: greyColor,
          ),
          const SizedBox(
            height: 8,
          ),
          ReadMoreText(
            'lajsdkahssssssssssssssssssssssssssssssssssssshduihwd d weh dwehiu hweu hwed w weguidwgedgw iwugdieugw iwdiwugediugw idwueiydw iuweydiuywi ddiwuy ediuw iuwydi uwydwi ueydwi diuhwey wdkjhdaisud iueywiu ',
            style: TextStyle(fontSize: 17, color: greyColor),
            trimLines: 2,
            trimMode: TrimMode.Line,
            moreStyle: TextStyle(color: orangeColor),
            lessStyle: TextStyle(color: primaryGreenColor),
          ),
        ],
      ).marginSymmetric(
        horizontal: 18,
      ),
    );
  }

  ListView bookingPersonalDetails() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookingSummaryController.title.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
              alignment: Alignment.center,
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(200)),
              child: bookingSummaryController.icons[index]),
          title: TextWidget(
            text: bookingSummaryController.title[index],
            size: 16,
            bold: FontWeight.normal,
            color: greyColor,
          ),
          subtitle: TextWidget(
              text: bookingSummaryController.subtitle[index],
              size: 16,
              color: greyColor,
              bold: FontWeight.normal),
          trailing: TextWidget(
            text: 'Change',
            size: 18,
            bold: FontWeight.normal,
            color: primaryGreenColor,
          ),
        );
      },
    );
  }
}
