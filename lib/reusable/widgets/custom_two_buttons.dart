import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTwoButtons extends StatelessWidget {
  const CustomTwoButtons({
    super.key,
    required this.leftButtonName,
    required this.onLeftButtonPressed,
    required this.rightButtonName,
    required this.onRightButtonPressed,
  });

  final String leftButtonName, rightButtonName;
  final void Function()? onLeftButtonPressed, onRightButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onLeftButtonPressed,
          child: Container(
            height: 55.h,
            width: 146.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: orangeColor, width: 2.w),
                color: backgroundColor),
            child: Text(
              leftButtonName,
              style: myTextStyle(20.sp, FontWeight.bold, textColor),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onRightButtonPressed,
          child: Container(
            height: 55.h,
            width: 146.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r), color: orangeColor),
            child: Text(
              rightButtonName,
              style: myTextStyle(20.sp, FontWeight.bold, backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}
