import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final bool isCircle; // Optional flag for circular shape

  const CustomShimmer({
    super.key,
    required this.height,
    required this.width,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isCircle ? null : BorderRadius.circular(4.r),
            shape: isCircle == true ? BoxShape.circle : BoxShape.rectangle),
      ),
    );
  }
}
