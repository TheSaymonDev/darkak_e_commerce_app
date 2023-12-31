import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrangeButton extends StatelessWidget {
  const CustomOrangeButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    required this.width,
  });

  final String buttonName;
  final void Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: orangeColor,
          foregroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: myTextStyle(20.sp, FontWeight.bold, backgroundColor),
        ),
      ),
    );
  }
}
