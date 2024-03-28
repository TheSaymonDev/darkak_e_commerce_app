import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.height,
    this.width,
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
      color: whiteClr,
      elevation: 4,
      shadowColor: whiteClr,
      shape: isCircle == true
          ? const CircleBorder() // Use CircleBorder for circle shape
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
      child: Container(
        height: height,
        width: width ?? double.infinity,
        padding: padding,
        decoration: isCircle == true
            ? const BoxDecoration(color: whiteClr, shape: BoxShape.circle)
            : BoxDecoration(
                color: whiteClr,
                border: border,
                borderRadius: BorderRadius.circular(4.r)),
        child: child,
      ),
    );
  }
}
