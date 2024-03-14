import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                border: Border.all(color: orangeClr, width: 2.w),
                color: whiteClr),
            child: Text(
              leftButtonName,
              style: Get.textTheme.titleMedium,
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
                borderRadius: BorderRadius.circular(4.r), color: orangeClr),
            child: Text(
              rightButtonName,
              style: Get.textTheme.titleMedium!.copyWith(color: whiteClr),
            ),
          ),
        ),
      ],
    );
  }
}
