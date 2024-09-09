import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmeds_user/app/theme/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomNavBarItem extends StatelessWidget {
  final String? svg;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavBarItem({
    super.key,
    this.svg,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 1.h),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svg.toString(),
              height: 3.h,
              color: isSelected ? orangeColor : greyColor,
            ),
            // SizedBox(height: 0.4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: isSelected ? orangeColor : greyColor,
              ),
            ),

            // SizedBox(height: 0.3.h) ,
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
