import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/utils/app_urls.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(
          onPressedBack: () {
            Get.back();
          },
          title: 'About Us'),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppUrls.appLogoSvg,
              height: 100.h,
              width: 120.w,
            ),
            Gap(40.h),
            Text(
              "Darkak Mart stands as a leading e-commerce platform in Bangladesh, renowned for its extensive product range, competitive pricing, and exceptional customer service. It has become a preferred online shopping destination, transforming the digital retail landscape in the country.",
              style: Get.textTheme.bodyMedium!.copyWith(color: greyClr),
              textAlign: TextAlign.center,
            ),
            Gap(24.h),
            Text('Technology Solution Provider', style: Get.textTheme.bodyMedium),
            Text('Softronixs System Limited', style: Get.textTheme.titleMedium),
            Gap(24.h),
            Image.asset(
              AppUrls.companyLogoPng,
              height: 60.h,
              width: 90.w,
            ),
          ],
        ),
      ),
    );
  }
}
