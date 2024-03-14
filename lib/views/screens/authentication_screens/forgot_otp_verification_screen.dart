import 'package:darkak_e_commerce_app/controllers/authentication_controllers/forget_otp_verification_controller.dart';
import 'package:darkak_e_commerce_app/core/utils/colors.dart';
import 'package:darkak_e_commerce_app/core/utils/validator.dart';
import 'package:darkak_e_commerce_app/views/widgets/styles.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_card_style.dart';
import 'package:darkak_e_commerce_app/views/widgets/base_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotOtpVerificationScreen extends StatelessWidget {
  final String? userId;
  ForgotOtpVerificationScreen({super.key, required this.userId});

  final ForgetOtpVerificationController _forgetOtpVerificationController =
      Get.find<ForgetOtpVerificationController>();

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
            child: Form(
              key: _forgetOtpVerificationController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification',
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(18.h),
                  Text(
                      'A 6 - Digit PIN has been sent to your email address or mobile number, enter it below to continue',
                      style:
                          Get.textTheme.bodyMedium!.copyWith(color: greyClr)),
                  Gap(35.h),
                  PinCodeTextField(
                    validator: Validators().pinValidator,
                    controller: _forgetOtpVerificationController.otpController,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: pinTheme(),
                    keyboardType: TextInputType.phone,
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't received a code?",
                        style: Get.textTheme.bodyMedium,
                      ),
                      Gap(8.w),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend Code',
                          style: Get.textTheme.titleMedium!
                              .copyWith(color: orangeClr),
                        ),
                      ),
                    ],
                  ),
                  Gap(35.h),
                  GetBuilder<ForgetOtpVerificationController>(
                    builder: (controller) => controller.isLoading == true
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                      onPressed: () {
                        controller.formOnSubmit(userId!);
                      },
                      buttonName: 'CONTINUE',
                      width: double.infinity.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
