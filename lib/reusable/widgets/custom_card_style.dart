import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardStyle extends StatelessWidget {
  const CustomCardStyle({
    super.key,
    this.height,
    required this.width,
    required this.child,
    this.padding,
    this.isCircle = false, // Add a parameter for circle shape
    this.border,
  });

  final double? height, width;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool isCircle; // Flag for circle shape
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      shadowColor: backgroundColor,
      shape: isCircle == true
          ? const CircleBorder() // Use CircleBorder for circle shape
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: isCircle == true
            ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle)
            : BoxDecoration(
                color: backgroundColor,
                border: border,
                borderRadius: BorderRadius.circular(4.r)),
        child: child,
      ),
    );
  }
}
