import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/screens/home_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
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
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp, color: orangeClr),
                  ),
                  Gap(28.h),
                  Text(
                    'Your Password has been changed successfully',
                    style: Get.textTheme.bodyMedium,
                  ),
                  Gap(40.h),
                ],
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
                onPressed: () {
                  Get.to(() => const HomeScreen());
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
