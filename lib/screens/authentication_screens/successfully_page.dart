import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 25.h),
        child: Column(
          children: [
            const Spacer(),
            AppCardStyle(
              child: Column(
                children: [
                  Gap(40.h),
                  Icon(
                    Icons.verified_user_outlined,
                    size: 100.sp,
                    color: Colors.green,
                  ),
                  Gap(90.h),
                  Text(
                    'Password Changed!',
                    style: myTextStyle(30.sp, FontWeight.bold, orangeColor),
                  ),
                  Gap(28.h),
                  Text(
                    'Your Password has been changed successfully',
                    style: myTextStyle(18.sp, FontWeight.normal, textClr),
                  ),
                  Gap(40.h),
                ],
              ),
            ),
            const Spacer(),
            AppOrangeButton(
                onPressed: () {
                  Get.to(BottomNavBarPage());
                }, buttonName: 'DONE', width: double.infinity.w),
          ],
        ),
      ),
    );
  }
}
