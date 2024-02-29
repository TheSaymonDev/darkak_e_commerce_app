import 'package:darkak_e_commerce_app/core/app_data.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:darkak_e_commerce_app/views/screens/authentication_screens/otp_verification_screen.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final _identifier = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      appBar: AppbarTextviewWithBack(onPressedBack: () {
        Get.back();
      }),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: CustomCardStyle(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password',
                  style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                ),
                Gap(18.h),
                Text(
                  'Please enter your mobile number\nor email to received verification code',
                  style: Get.textTheme.bodyMedium!.copyWith(color: greyClr),
                ),
                Gap(50.h),
                CustomTextFormField(
                    labelText: 'Email or Mobile', controller: _identifier),
                Gap(40.h),
                CustomElevatedButton(
                  onPressed: () {
                    Get.to(() => const OtpVerificationScreen(userId: '',));
                  },
                  buttonName: 'SEND',
                  width: double.infinity.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
