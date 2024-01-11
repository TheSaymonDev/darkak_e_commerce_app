import 'package:darkak_e_commerce_app/reusable/colors.dart';
import 'package:darkak_e_commerce_app/reusable/styles.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_orange_button.dart';
import 'package:darkak_e_commerce_app/reusable/widgets/custom_text_form_field.dart';
import 'package:darkak_e_commerce_app/screens/authentication_screens/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VerifyEmailPage extends StatelessWidget {
  VerifyEmailPage({super.key});

  final _identifier = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppbarTextviewWithBack(onPressedBack: (){Get.back();}),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: CustomCardStyle(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password',
                  style: myTextStyle(30.sp, FontWeight.bold, textColor),
                ),
                Gap(18.h),
                Text(
                  'Please enter your mobile number\nor email to received verification code',
                  style: myTextStyle(
                      20.sp, FontWeight.normal, textColor.withOpacity(0.5)),
                ),
                Gap(50.h),
                CustomTextFormField(
                    labelText: 'Email or Mobile', controller: _identifier),
                Gap(40.h),
                CustomOrangeButton(
                  onPressed: () {
                    Get.to(()=>const OtpVerificationPage());
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
