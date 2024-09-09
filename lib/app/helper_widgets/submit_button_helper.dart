import 'package:flutter/material.dart';
import 'package:quickmeds_user/app/helper_widgets/text_widget.dart';
import 'package:sizer/sizer.dart';
import '../theme/app_colors.dart';

class SubmitButtonHelper extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final VoidCallback? onTap;
  const SubmitButtonHelper({super.key, required this.text,required this.onTap, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??6.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:color??primaryGreenColor,
            minimumSize: Size(double.infinity, 7.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.h)
            )),
        child: TextWidget(
            text: text ?? "",
            size: 12.sp,
            alignment: TextAlign.center,
            color: Colors.white,
            bold: FontWeight.bold),
      ),
    );
  }
}
