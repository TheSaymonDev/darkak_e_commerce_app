import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/screens/bottom_nav_bar_screens/bottom_nav_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SuccessfullyPage extends StatelessWidget {
  const SuccessfullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            CustomCardStyle(
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                    style: myTextStyle(18.sp, FontWeight.normal, textColor),
                  ),
                  Gap(40.h),
                ],
              ),
            ),
            const Spacer(),
            CustomOrangeButton(
                onPressed: () {
                  Get.to(() => const BottomNavBarPage());
                },
                buttonName: 'DONE',
                width: double.infinity.w),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
