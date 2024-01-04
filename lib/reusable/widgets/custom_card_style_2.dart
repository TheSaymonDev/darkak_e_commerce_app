import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardStyle2 extends StatelessWidget {
  const CustomCardStyle2(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.padding});

  final double height, width;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 4,
      shadowColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r), color: backgroundColor),
        child: child,
      ),
    );
  }
}
