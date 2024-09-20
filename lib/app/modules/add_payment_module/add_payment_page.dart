import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/modules/add_payment_module/add_amount_page.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: SubmitButtonHelper(
            text: 'Next',
            onTap: () {
              Get.to(AddAmountPage());
            }),
      ).marginSymmetric(horizontal: 18, vertical: 20),
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
          text: "Add money",
          size: 14.sp,
          bold: FontWeight.bold,
          color: greyColor,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 14,
          ),
          TextWidget(
            text: 'Add by',
            size: 16,
            bold: FontWeight.normal,
            color: greyColor,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(Icons.add).marginOnly(top: 10),
                title: TextWidget(
                  text: 'UPI',
                  size: 18,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                subtitle: TextWidget(
                  text: 'Pay by an UPI app',
                  size: 16,
                  bold: FontWeight.normal,
                  color: greyColor,
                ),
                trailing: Icon(CupertinoIcons.chevron_down),
              ).marginOnly(top: 10);
            },
          )
        ],
      ).marginSymmetric(horizontal: 18),
    );
  }
}
