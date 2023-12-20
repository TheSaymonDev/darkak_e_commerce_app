import 'package:e_commerce_app/reusable/colors.dart';
import 'package:e_commerce_app/reusable/styles.dart';
import 'package:e_commerce_app/reusable/widgets/app_back_appbar.dart';
import 'package:e_commerce_app/reusable/widgets/app_card_style.dart';
import 'package:e_commerce_app/reusable/widgets/app_orange_button.dart';
import 'package:e_commerce_app/screens/authentication_screens/successfully_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBackAppBar(onPressed: () {}),
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
                      'Verification',
                      style: myTextStyle(30.sp, FontWeight.bold, textColor),
                    ),
                    Gap(18.h),
                    Text(
                      'A 6 - Digit PIN has been sent to your email address or mobile number, enter it below to continue',
                      style: myTextStyle(
                        20.sp,
                        FontWeight.normal,
                        textColor.withOpacity(0.5),
                      ),
                    ),
                    Gap(35.h),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      // enableActiveFill: true,
                      pinTheme: pinTheme(),
                      onCompleted: (v) {},
                      onChanged: (value) {},
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Didn't received a code?",
                          style: myTextStyle(20.sp, FontWeight.normal, textColor),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Resend Code',
                              style: myTextStyle(
                                  20.sp, FontWeight.normal, orangeColor),
                            ))
                      ],
                    ),
                    Gap(35.h),
                    AppOrangeButton(
                        onPressed: () {
                          Get.to(const SuccessfullyPage());
                        },
                        buttonName: 'CONTINUE',
                        width: double.infinity.w)
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
