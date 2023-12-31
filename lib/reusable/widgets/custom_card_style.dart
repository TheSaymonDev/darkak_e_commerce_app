import 'package:e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardStyle extends StatelessWidget {
   CustomCardStyle({super.key,required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: backgroundColor
        ),
        child: child,
      ),
    );
  }
}
