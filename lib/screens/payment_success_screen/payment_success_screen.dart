import 'package:darkak_e_commerce_app/routes/app_routes.dart';
import 'package:darkak_e_commerce_app/utils/app_colors.dart';
import 'package:darkak_e_commerce_app/widgets/common_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SafeArea(
        child: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 213.h,
                width: 208.w,
                child: SvgPicture.asset(
                  'assets/images/payment-success.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Gap(48.h),
              Text(
                'Success!',
                style: myStyle(60.sp, FontWeight.bold, orangeClr),
              ),
              Gap(30.h),
              Text(
                'Your order will be delivered soon. Thank you for choosing our app!',
                style: myStyle(25.sp, FontWeight.bold, blackClr),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomElevatedButton(
                  onPressed: () {
                   Get.offAllNamed(AppRoutes.homeScreen);
                  },
                  buttonName: 'Continue Shopping',
                  width: double.infinity.w),
              Gap(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
