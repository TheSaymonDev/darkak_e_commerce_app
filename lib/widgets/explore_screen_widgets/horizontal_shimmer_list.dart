import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_product_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HorizontalShimmerList extends StatelessWidget {
  const HorizontalShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324.h,
      width: double.infinity.w,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomProductCardShimmer();
          },
          separatorBuilder: (context, index) => Gap(12.w),
          itemCount: 2),
    );
  }
}
