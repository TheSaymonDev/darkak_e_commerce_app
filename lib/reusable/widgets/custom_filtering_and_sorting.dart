import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomFilteringAndSorting extends StatelessWidget {
  const CustomFilteringAndSorting({
    super.key,
    required this.filterTap, required this.sortingTap
  });

  final void Function()? filterTap, sortingTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: filterTap,
          child: Row(
            children: [
              Icon(Icons.filter_list_outlined, size: 25.sp, color: orangeColor,),
              Gap(4.w),
              Text('Filters', style: myTextStyle(15.sp, FontWeight.normal, textColor),),
            ],
          ),
        ),
        InkWell(
          onTap: sortingTap,
          child: Row(
            children: [
              Icon(Icons.sort, size: 25.sp, color: orangeColor,),
              Gap(4.w),
              Text('Price: lowest to high', style: myTextStyle(15.sp, FontWeight.normal, textColor),),
            ],
          ),
        )
      ],
    );
  }
}
