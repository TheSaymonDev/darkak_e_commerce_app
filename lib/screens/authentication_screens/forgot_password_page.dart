import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/reusable/widgets/app_text_form_field.dart';
import 'package:e_commerce_app/screens/authentication_screens/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _identifier = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBackAppBar(onPressed: () {
        Get.back();
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppCardStyle(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot password',
                      style: myTextStyle(30.sp, FontWeight.bold, textClr),
                    ),
                    Gap(18.h),
                    Text(
                      'Please enter your mobile number\nor email to received verification code',
                      style: myTextStyle(
                          20.sp, FontWeight.normal, textClr.withOpacity(0.5)),
                    ),
                    Gap(50.h),
                    AppTextFormField(
                        labelText: 'Email or Mobile', controller: _identifier),
                    Gap(40.h),
                    AppOrangeButton(
                      onPressed: () {
                        Get.to(const VerificationPage());
                      },
                      buttonName: 'SEND',
                      width: double.infinity.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
