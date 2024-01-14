import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_search_text_form_field.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style_2.dart';
import 'package:darkak_e_commerce_app/screens/search_results_screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
              child: CustomCardStyle2(
                isCircle: true,
                height: 28.h,
                width: 28.h,
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
              child: CustomCardStyle2(
                isCircle: true,
                height: 40.h,
                width: 40.h,
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
        CustomSearchTextFormField(onTap: (){
          Get.to(()=>const SearchPage());
        }, readOnly: true,),
      ],
    );
  }
}