import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomProductCardShimmer extends StatelessWidget {
  const CustomProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Container(
            height: 324.h,
            width: 184.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r), color: whiteClr),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomShimmer(
                    height: 230.h,
                    width: double.infinity.w,
                  ),
                  Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShimmer(height: 20.h, width: double.infinity.w),
                            Gap(4.h),
                            CustomShimmer(height: 20.h, width: 60.w),
                            Gap(4.h),
                            CustomShimmer(height: 20.h, width: 100.w),
                          ]))
                ])));
  }
}
