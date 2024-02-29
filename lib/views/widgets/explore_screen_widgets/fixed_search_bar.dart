import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/screens/search_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_search_text_form_field.dart';
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
              child: CustomCardStyle(
                isCircle: true,
                height: 28.h,
                width: 28.h,
                child: Icon(
                  Icons.location_on,
                  size: 15.sp,
                  color: orangeClr,
                ),
              ),
            ),
            Gap(10.w),
            Text(
              'Location',
              style: myStyle(20.sp, FontWeight.normal, blackClr),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: CustomCardStyle(
                isCircle: true,
                height: 40.h,
                width: 40.h,
                child: Icon(
                  Icons.notifications,
                  size: 25.sp,
                  color: orangeClr,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Dhaka North, Banani Road No. 12 - 19',
          style: myStyle(15.sp, FontWeight.normal, greyClr),
        ),
        Gap(8.h),
        CustomSearchTextFormField(onTap: (){
          Get.to(()=>const SearchPage());
        }, readOnly: true,),
      ],
    );
  }
}