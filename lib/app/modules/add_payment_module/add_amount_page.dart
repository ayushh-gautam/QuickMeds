import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmeds_user/app/helper_widgets/submit_button_helper.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:quickmeds_user/app/helper_widgets/textfield_widget.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class AddAmountPage extends StatelessWidget {
  const AddAmountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
          text: "Enter Amount",
          size: 14.sp,
          bold: FontWeight.bold,
          color: greyColor,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              'assets/images/enter_amount.png',
              height: 300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(
              prefixIcon: const Icon(Icons.currency_bitcoin),
              hintText: 'Enter amount',
              hintTextStyle: const TextStyle(fontSize: 20),
              controller: TextEditingController()),
          const SizedBox(
            height: 30,
          ),
          SubmitButtonHelper(
              height: 60,
              text: 'Add',
              onTap: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.h),
                      ),
                      content: Image(
                        image:
                            const AssetImage("assets/images/amount_added.png"),
                        height: 40.h,
                      ),
                    );
                  },
                );
              })
        ],
      ).marginSymmetric(horizontal: 18),
    );
  }
}
