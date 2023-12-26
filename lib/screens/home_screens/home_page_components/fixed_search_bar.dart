import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FixedSearchBar extends StatelessWidget {
  const FixedSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 28.h,
                width: 28.h,
                alignment: Alignment.center,
                decoration: shadowDecoration(),
                child: Icon(
                  Icons.location_on,
                  size: 15.sp,
                  color: orangeColor,
                ),
              ),
            ),
            Gap(10.w),
            Text(
              'Location',
              style: myTextStyle(20.sp, FontWeight.normal, textColor),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                height: 40.h,
                width: 40.h,
                alignment: Alignment.center,
                decoration: shadowDecoration(),
                child: Icon(
                  Icons.notifications,
                  size: 25.sp,
                  color: orangeColor,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Dhaka North, Banani Road No. 12 - 19',
          style: myTextStyle(15.sp, FontWeight.normal, greyColor),
        ),
        Gap(8.h),
        const AppSearchTextFormField(),
      ],
    );
  }
}